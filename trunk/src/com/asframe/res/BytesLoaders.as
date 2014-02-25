/**
 * @ByteLoaders.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Lion3D
 * <br>Date:2013-10-24
 */
package com.asframe.res
{
	import com.asframe.ASF;
	import com.asframe.lang.impl.UrlVersion;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * 字节加载器，纯粹是加载二进制字节.支持并发和队列加载
	 * @author sodaChen
	 * #Date:2013-10-24
	 */
	public class BytesLoaders extends UrlVersion
	{
		/** 二进制的缓存管理策略 **/
		public var bytesPolicy:IBytesPolicy = new BytesPolicy(); 
		/** 加载成功之后回调函数 **/
		public var completeFun:Function;
		/** 加载错误之后回调函数 **/
		public var errorFun:Function;
		/** 并发最大数 默认为3 **/
		public var loadMax:int = 3;
		/** 重载次数，默认为1 **/
		public var reLoad:int = 1;
		/** ByteLoader加载器列表 **/
		private var loaderList:Vector.<ByteLoader>;
		/** 等待加载资源队列 **/
		private var waitLoadQueue:Vector.<String>;
		/** 错误重新次数记录集合 **/
		private var reLoadDic:Dictionary;
		/** 正在加载中的URLLoader集合 **/
		private var loaderDic:Dictionary;
		
		public function BytesLoaders()
		{
			loaderList = new Vector.<ByteLoader>();
			for (var i:int = 0; i < 3; i++) 
			{
				loaderList.push(new ByteLoader());
				loaderList[i].addEventListener(Event.COMPLETE,onComplete);
				loaderList[i].addEventListener(IOErrorEvent.IO_ERROR,onIoError);
			}
			waitLoadQueue = new Vector.<String>();
			reLoadDic = new Dictionary();
			loaderDic = new Dictionary();
		}
		private function onIoError(event:IOErrorEvent):void
		{
			var byteLoad:ByteLoader = event.target as ByteLoader;
			var reLoadCount:int = 0;
			if(reLoadDic[byteLoad.url] != null)
			{
				reLoadCount = reLoadDic[byteLoad.url];
			}
			reLoadCount++;
			if(reLoadCount > reLoad)
			{
				delete loaderDic[byteLoad.url];
				trace("加载错误，重载" + reLoadCount + "次，对应的路径没有数据：" + byteLoad.url);
				if(errorFun != null)
					errorFun(byteLoad.url);
				//超出重载次数，加载下一条
				nextLoad(byteLoad);
			}
			else
			{
				reLoadDic[byteLoad.url] = reLoadCount;
				byteLoad.reStart();
			}
		}
		private function onComplete(event:Event):void
		{
			var byteLoad:ByteLoader = event.target as ByteLoader;
			delete loaderDic[byteLoad.url];
			
			if(reLoadDic[byteLoad.url] != null)
				delete reLoadDic[byteLoad.url];
			
			//缓存起来
			if(ASF.isCacheBytes)
				bytesPolicy.addBytes(byteLoad.url,byteLoad.data);
			//回调
			completeFun(byteLoad.data,byteLoad.url);
			nextLoad(byteLoad);
		}
		private function nextLoad(byteLoad:ByteLoader):void
		{
			if(waitLoadQueue.length > 0)
			{
				var url:String = waitLoadQueue.shift();
				byteLoad.start(url,getFullUrl(url));
			}
			else
			{
				//返回池
				loaderList.push(byteLoad);
			}
		}
//		public function addLinsters(complete:Function,error:Function,progess:Function = null):void
//		{
//			for (var i:int = 0; i < 3; i++) 
//			{
//				loaderList[i].addEventListener(Event.COMPLETE,complete);
//				loaderList[i].addEventListener(IOErrorEvent.IO_ERROR,error);
//				if(progess != null)
//					loaderList[i].addEventListener(ProgressEvent.PROGRESS,progess);
//			}
//		}
		/**
		 * 加载url。因为内部采用的并发加载，所以不保证加载的顺序 
		 * @param url
		 * @param isQuick
		 * 
		 */		
		public function load(url:String,isQuick:Boolean = false):void
		{
			//查看是否有缓存
			if(ASF.isCacheBytes)
			{
				var bytes:ByteArray = bytesPolicy.getBytes(url);
				if(bytes != null)
				{
					//直接返回
					completeFun(bytes,url);
					return ;
				}
			}
			if(loaderList.length == 0)
			{
				if(isQuick)
				{
					waitLoadQueue.unshift(url);
				}
				else
				{
					waitLoadQueue.push(url);
				}
				return ;
			}
			//todo 这里都是采用删除和添加的方式来使用loader，如果有性能问题，采用index来获取loader
			var loader:ByteLoader = loaderList.shift();
			loaderDic[url] = loader;
			loader.start(url,getFullUrl(url));
		}
		/**
		 * 停止加载指定的url 
		 * @param url
		 * 
		 */		
		public function stop(url:String):void
		{
			//正在加载中
			var byteLoad:ByteLoader = loaderDic[url];
			if(byteLoad != null)
			{
				//停掉指定的loader
				delete loaderDic[byteLoad.url];
				
				if(reLoadDic[byteLoad.url] != null)
					delete reLoadDic[byteLoad.url];
				
				byteLoad.close();
				
				return ;
			}
			//删除等候列表
			var index:int = waitLoadQueue.indexOf(url);
			if(index != -1)
			{
				waitLoadQueue.splice(index,1);
			}
		}
	}
}
