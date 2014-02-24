/**
 * @AbstraceMultiLoader.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-23
 */
package com.asframe.load.multi
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
	import com.asframe.lang.impl.UrlVersion;
	import com.asframe.load.ILoader;
	import com.asframe.load.LoadUtils;
	import com.asframe.loading.ILoading;
	import com.asframe.loading.IMultilLoading;
	import com.asframe.slf4j.ILogger;
	import com.asframe.slf4j.LoggerFactory;
	import com.asframe.utils.FunctionUtils;
	
	import flash.system.ApplicationDomain;
	
	/**
	 * 多资源加载器的抽象类
	 * @author sodaChen
	 */
	public class AbstraceMultiLoader extends UrlVersion implements IMultiLoader
	{
		protected static const value		:Object = new Object();
		
		protected var log					:ILogger;
		protected var type					:String;
		/**  **/
		protected var loaderMap				:IMap;
		/** 全部加载完成的回调函数 **/
		protected var allComplete			:Function;
		/**  **/
		protected var urls					:Array;
		/** 全部结果 **/
		protected var resultAry				:Array;
		/** 默认单个成功回调函数 **/
		protected var defaultOneSucess		:Function;
		/** 默认单个失败回调函数 **/
		protected var defaultOneFail		:Function;
		/** 单个成功回调函数 **/
		protected var oneSucess				:Function;
		/** 单个失败回调函数 **/
		protected var oneFail				:Function;
		/** loading **/
		protected var loading				:ILoading; 
		
		/** 当前正在加载的数据 **/
		protected var currentMultiBean		:MultiLoadBean;
		/** 是否正在加载中 **/
		protected var onLoading				:Boolean;
		/** 等待加载的数据列表 **/
		protected var multiBeanList			:Array;
		/** 是否所有的资源都以二进制的形式加载 **/
		protected var _isByteLoad			:Boolean;
		protected var nextLoader			:INextLoader;
		protected var domain				:ApplicationDomain;
		
		private var isStart					:Boolean;
		
		
		
		public function AbstraceMultiLoader()
		{
			loaderMap = new HashMap();
			multiBeanList = [];
			currentMultiBean = new MultiLoadBean();
			log = LoggerFactory.getLogger(this);
			isStart = true;
			setNextLoader(new DefaultNextLoader());
		}
		public function setApplicationDomain(domain:ApplicationDomain):void
		{
			this.domain = domain;
		}
		public function addFailResult(failResult:Function):void
		{
			throw new Error("多加载器中禁止设置addFailResult方法，请设置addDefaultOneFun或者setOneResult方法");
		}
		public function setType(type:String):void
		{
			this.type = type;
		}
		public function getType():String
		{
			return type;
		}
		/**
		 * 是否正在加载中
		 * @return true/false
		 * 
		 */		
		public function isLoading():Boolean
		{
			return false;
		}
		public function setLoading(loading	:ILoading):void
		{
			this.loading = loading;
		}
		/**
		 * 继续加载 
		 * 
		 */		
		public function start():void
		{
			isStart = true;
		}
		/**
		 * 停止加载（暂停） 
		 * 
		 */		
		public function stop():void
		{
			isStart = false;
		}
		/**
		 * 停止并且清除需要加载的资源，恢复到没有加载任何资源的状态 
		 * 
		 */		
		public function clear():void
		{
			isStart = false;
		}
		public function set isByteLoad(_isByteLoad:Boolean):void
		{
			if(this._isByteLoad )
			{
				throw new Error("多加载器已经设置为字节加载器，不能进行再次设置！");
			}
			this._isByteLoad = _isByteLoad;
		}
		public function get isByteLoad():Boolean
		{
			return this._isByteLoad;
		}
		/**
		 * 添加默认的单个资源加载成功或者失败的回调函数 
		 * @param defaultOneSucess
		 * @param defaultOneFail
		 * 
		 */			
		public function addDefaultOneFun(defaultOneSucess:Function,defaultOneFail:Function = null):void
		{
			this.defaultOneSucess = defaultOneSucess;
			this.defaultOneFail = defaultOneFail;
		}
		/**
		 * 单个资源加载触发的函数 
		 * @param oneSucessResult:单资源加载成功
		 * @param oneFailResult:单资源加载失败
		 * 
		 */				
		public function setOneResult(oneSucessResult:Function,oneFailResult:Function = null):void
		{
			this.oneSucess = oneSucessResult;
			this.oneFail = oneFailResult;
		}
	   /**
		* 一次加载单个资源 
		* @param url:路径
		* @param sucessResult:成功回调函数
		* @param loading:loading条
		* 
		*/
		public function load(url:*,sucessResult:Function = null,target:* = null):void
		{
			if(url == null)
			{
				throw new Error("加载的url为空");  
			}
			createMultiLoadBean(url,sucessResult,target,loading);
			if(!onLoading)
			{
				onLoading = true;
				startMultiLoad();
			} 
		}
		/**
		 * 释放接口 
		 * @param o:释放时需要的参数（不是必须的）
		 * 
		 */		
		public function destroy(o:* = null):void
		{
			loading = null;
		}
		public function getData():*
		{
			throw new Error("getData为抽象方法,子类必须重写该方法");
		}
		private function multiLoad(urls:Array,sucessResult:Function = null,target:* = null,loading:IMultilLoading = null,bytesTotal:int = 0):void
		{
			if(urls == null || urls.length == 0)
			{
				throw new Error("加载的url为空或者长度为0");  
			}
			createMultiLoadBean(urls,sucessResult,target,loading);
			if(!onLoading)
			{
				startMultiLoad();
			}
		}
		/**
		 * 开始一次多资源的加载,主要是给不同的子类进行重写
		 * @return 
		 * 
		 */		
		protected function startMultiLoad():void
		{
			resultAry = [];
			onLoading = true;
			urls = currentMultiBean.urls;
		}
		private function createMultiLoadBean(url:*,sucessResult:Function = null,target:* = null, loading:ILoading = null):void
		{
			var urls:Array = null;
			if(currentMultiBean == null)
			{
				currentMultiBean = new MultiLoadBean();
			}
			var multiBean:MultiLoadBean = currentMultiBean;
			if(onLoading)
			{
				multiBean = new MultiLoadBean();
				multiBeanList.push(multiBean);
			}
			if(url is String)
			{
				urls = [url];
				multiBean.isOne = true;
			}
			else
			{
				urls = url;
			}
			multiBean.loadType = type;
			type = null;
			multiBean.allComplete = sucessResult;
			if(loading == null)
			{
				loading = this.loading;
			}
			multiBean.loading = loading;
			multiBean.urls = urls;
			multiBean.target = target;
			multiBean.oneSucessResult = oneSucess;
			multiBean.oneFailResult = oneFail;
			if(oneSucess == null)
			{
				multiBean.oneSucessResult = defaultOneSucess;
			}
			if(multiBean.oneFailResult == null)
			{
				multiBean.oneFailResult = defaultOneFail;
			}
			oneSucess = null;
			oneFail = null;
		}
		/**
		 * 获取到资源加载器(默认是取出单个)
		 * @param url
		 * @return 
		 * 
		 */
		protected function getLoader(loadType:String):ILoader
		{
			throw new Error("getLoader为抽象方法,子类必须实现");
		}
		protected function onOneIoError(errorObj:Object):void
		{
			//处理一下数据，因为之前是从单个资源加载过来的
			errorObj.target = currentMultiBean.target;
			FunctionUtils.execute(currentMultiBean.oneFailResult,[errorObj]);
			//单个资源的错误，则直接进入下一个队列加载了
			if(currentMultiBean.isOne)
			{
				resultAry = null;
				onLoading = false;
				currentMultiBean = null;
				//是否有下个队列加载
				if(multiBeanList.length > 0)
				{
					currentMultiBean = multiBeanList.shift();
					startMultiLoad();
				}
			}
			else
			{
				resultAry.push(errorObj);
				loadOneOver();
			}
		}
		/**
		 * 单个完成函数,进行队列触发处理
		 * @param event
		 * 
		 */
		protected function onOneComplete(data:*,target:*):void
		{
			//是loader接口，表示用户使用加载时没有匹配target
			if(currentMultiBean.oneSucessResult != null)
			{
				if(target == this || target == null)
				{
					FunctionUtils.execute(currentMultiBean.oneSucessResult,[data]);
				}
				else
				{
					FunctionUtils.execute(currentMultiBean.oneSucessResult,[data,target]);
				}
			}
			resultAry.push(data);
			loadOneOver();
		}
		/**
		 * 当前是否有下一个资源需要进行加载 
		 * @return 
		 * 
		 */		
		protected function hasNext():Boolean
		{
			return urls.length > 0
		}
		private function loadOneOver():void
		{
			if(hasNext())
			{
				if(urls.length > 0)
				{
					//继续加载下一个资源
					nextLoader.nextLoad(urls.shift(),currentMultiBean.target,onOneComplete);
				}
			}
			else
			{
				//执行加载结束的函数
				var params:* = resultAry;
				if(currentMultiBean.isOne)
				{
					params = resultAry[0];
				}
				if(currentMultiBean.target != null && currentMultiBean.target != this)
				{
					FunctionUtils.execute(currentMultiBean.allComplete,[params,currentMultiBean.target]);
				}
				else
				{
					FunctionUtils.execute(currentMultiBean.allComplete,[params]);
				}
				resultAry = null;
				onLoading = false;
				currentMultiBean = null;
				//是否有下个队列加载
				if(multiBeanList.length > 0)
				{
					currentMultiBean = multiBeanList.shift();
					startMultiLoad();
				}
			}
		}

		/**
		 * 设置下一个加载器的解析器 
		 * @param nextLoader
		 * 
		 */		
		public function setNextLoader(nextLoader:INextLoader):void
		{
			this.nextLoader = nextLoader;
			nextLoader.setMultiLoader(this);
		}
		public function startLoadNext(url:String,target:*,complete:Function,loading:ILoading):void
		{
			var loadType:String = currentMultiBean.loadType;
			if(loadType == null)
			{
				loadType = LoadUtils.getUrlType(url);
			}
			var loader:ILoader = getLoader(loadType);
			loader.addFailResult(onOneIoError);
			if(loading == null)
			{
				loading = this.loading;
			}
			loader.setLoading(loading);
			if(this is SameLoader)
			{
				//这里主要是为了子类SameLoader使用的
				var sameTarget:SameTarget = new SameTarget();
				sameTarget.loader = loader;
				sameTarget.target = target;
				loader.load(url,complete,sameTarget);
			}
			else if(target == null)
			{
				loader.load(url,complete,this);
			}
			else
			{
				loader.load(url,complete,target);
			}
		}
	}
}
