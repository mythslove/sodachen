/**
 * @ResManager.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-12
 */
package com.asframe.res
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.lang.impl.UrlVersion;
	import com.asframe.managers.TimerManager;
	import com.asframe.res.data.ResData;
	import com.asframe.res.parsers.IResParser;
	import com.asframe.res.parsers.LoaderResParser;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;

	/**
	 * 资源管理对象，默认的实现方式，一般情况，只使用该对象即可。单例模式。
	 * 一般来说，不需要特别实现资源管理器了，直接使用该管理器即可满足大部分的功能开发
	 * @author sodaChen
	 * #Date:2012-2-12
	 */
	public class ResManager extends UrlVersion implements IResManager
	{
		private static var instance:ResManager = new ResManager();
		
		/** 等待解析的列表 **/
		private var waitParseQueue:Vector.<IResParser>;
		/** 解析集合 **/
		private var parsers:HashMap;
		/** 加载资源的数据结构 **/
		private var resDatas:Dictionary;
		/** 是否已经在时间管理器中 **/
		private var addTimer:Boolean;
		/** 单个解析器的最大解析时间(毫秒) **/
		private var frameTime:int;
		/** 资源后缀 **/
		private var suffix:String;
		/** 二进制加载器列表，默认是3个（并发3条） **/
		private var bytesLoaders:BytesLoaders;
		////////在onTimer里使用到的临时变量////////////
		private var time:int;
		
		public function ResManager()
		{
			resDatas = new Dictionary();
			parsers = new HashMap();
			addTimer = true;
			waitParseQueue = new Vector.<IResParser>();
			frameTime = 5;
			//添加默认的解析器
			addParser(new LoaderResParser(),"swf","png","jpg");
			
			bytesLoaders = new BytesLoaders();
			bytesLoaders.completeFun = onBytes;
		}
		public static function getInstance():ResManager
		{
			return instance;
		}
		public function addParser(parser:IResParser,...parseTypes):void
		{
			for (var i:int = 0; i < parseTypes.length; i++) 
			{
				//统一变成小写
				parsers.put(parseTypes[i].toLowerCase(),parser);
				if(parser.isAsync())
				{
					parser.setAsyncComplete(onAsyncComplete);
				}
			}
		}
		public override function setUrlVersion(urlHead:String,version:String):void
		{
			bytesLoaders.setUrlVersion(urlHead,version);
		}
		
		public static function load(url:String, complete:Function=null, target:*=null, error:Function=null, level:int=0):void
		{
			instance.load(url,complete,target,error,level);
		}
		
		public function load(url:String, complete:Function=null, target:*=null, error:Function=null, level:int=0):void
		{
			var resData:ResData = resDatas[url];
			if(resData == null)
			{
				//todo 这里使用对象池，会导致不同的url放在一起。必须测试才可以用对象池
//				resData = PoolManager.borrowObject(ResData);
				resData = new ResData();
				resDatas[url] = resData;
				resData.url = url;
				bytesLoaders.load(url,level > 0);
			}
			resData.level = level;
			resData.completes.push(complete);
			resData.errors.push(error);
			resData.targets.push(target);
		}
		
		public function loads(urls:Array, complete:Function=null, target:*=null, error:Function=null, level:int=0):void
		{
			throw new Error("暂时没有实现数组的方式");
		}
		
		public function cancel(url:String,complete:Function):void
		{
			var resData:ResData = resDatas[url];
			if(resData != null)
			{
				for (var i:int = 0; i < resData.completes.length; i++) 
				{
					if(resData.completes[i] == complete)
					{
						resData.completes.splice(i,1);
						break;
					}
				}
				if(resData.completes.length == 0)
				{
					delete resDatas[url];
					resData.destory();
					//停止加载
					bytesLoaders.stop(url);
				}
			}
		}
		/**
		 * 释放在资源管理器缓存的资源 
		 * @param url
		 * 
		 */		
		public function release(url:String):void
		{
			
		}
		private function onBytes(bytes:ByteArray,url:String):void
		{
			//缓存数据,进行转换
			var resData:ResData = resDatas[url];
			if(resData == null)
			{
				throw new Error("出现url没有对应的ResData:" + url);
			}
			//借出新的解析器
			var parser:IResParser = getParserFromSuffix(url);
			if(parser == null)
			{
				//直接返回二进制数据
				onParseComplete(resData,bytes);
				return ;
			}
			resData.bytes = bytes;
			resData.suffix = suffix;
			parser.addResData(resData);
			if(parser.isAsync())
			{
				//尝试开始加载
				parser.startParse();
			}
			else
			{
				//存放到循环渐变解析中
				waitParseQueue.push(parser);
				//进行循环解析
				if(addTimer)
				{
					addTimer = false;
					TimerManager.addDelay(20,onTimer);
				}
			}
		}
		private function onTimer():void
		{
			time = getTimer() + frameTime;
			var parser:IResParser = null;
			for (var i:int = 0; i < waitParseQueue.length; i++) 
			{
				parser = waitParseQueue[i];
				if(parser.isPaused())
				{
					//跳过暂停
					continue;
				}
				//尝试开始新的加载
				parser.startParse();
				//实际解析数据
				parser.onParse(time);
				if(parser.isComplete())
				{
					//解析完毕
					waitParseQueue.splice(i, 1);
					i--;
					onParseComplete(parser.getResData(),parser.getRes());
					//出清干净解析器的相关护具
					parser.clean();
				}
				if (getTimer() >= time) break;
			}
			if(waitParseQueue.length == 0)
			{
				addTimer = true;
				TimerManager.removeDelay(onTimer);
			}
		}
		private function onAsyncComplete(parser:IResParser):void
		{
			if(parser.isComplete())
			{
				//成功了
				onParseComplete(parser.getResData(),parser.getRes());
			}
			else
			{
				trace("onAsyncComplete有解析失败了");
			}
		}
		private function onParseComplete(resData:ResData,data:*):void
		{
			//先进行清除，预防回调里有再次使用到ResManager
			delete resDatas[resData.url];
			//遍历，广播出去
			var len:int = resData.completes.length;
			for (var i:int = 0; i < len; i++) 
			{
				if(resData.targets[i] == null)
				{
					resData.completes[i](data);
				}
				else
				{
					resData.completes[i](data,resData.targets[i]);
				}
			}
			resData.destory();
		}
		private function getParserFromSuffix(url:String):IResParser
		{
			var index:int = url.lastIndexOf(".");
			url = url.indexOf("?") > 0 ? url.split("?")[0] : url;
			suffix = url.substr((index + 1)).toLowerCase();
			return parsers.get(suffix);
		}
	}
}
