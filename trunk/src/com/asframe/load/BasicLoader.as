/**
 * @AbstractLoader.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-21
 */
package com.asframe.load
{
	import com.asframe.lang.impl.UrlVersion;
	import com.asframe.loading.ILoading;
	import com.asframe.slf4j.ILogger;
	import com.asframe.slf4j.LoggerFactory;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	
	/**
	 * 抽象加载器
	 * @author sodaChen
	 */
	public class BasicLoader extends UrlVersion implements ILoader
	{
		/** 日志输出对象 **/
		protected var log					:ILogger;
		/** 加载器类型 **/
		protected var type					:String;
		/** 加载成功后的回调函数 **/
		protected var sucessResult			:Function;
		/** 加载失败功后的回调函数 **/
		protected var failResult			:Function;
		/** loading界面和控制 **/
		protected var loading				:ILoading;
		/** 路径 **/
		public var url						:String;
		/** 目标对象 **/
		public var target					:*;
		/** 是否正在loading中 **/
		protected var	_isLoading			:Boolean;	
		protected var domain				:ApplicationDomain;
		protected var reuqest				:URLRequest;
		
		public function BasicLoader()
		{ 
			//获取到对象的Class对象
			log = LoggerFactory.getLogger(this);
//			domain = ApplicationDomain.currentDomain;
			reuqest = new URLRequest();
		}
		public function setApplicationDomain(domain:ApplicationDomain):void
		{
			this.domain = domain;
		}
		public function setLoading(loading	:ILoading):void
		{
			this.loading = loading;
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
			return _isLoading;
		}
		public function addFailResult(failResult:Function):void
		{
			this.failResult = failResult;
		}
		public function load(url:*, sucessResult:Function = null, target:* = null):void
		{
			if(_isLoading)
			{
				throw Error("正在加载中，不能再次调用Loader方法");
			}
			this.sucessResult = sucessResult;
			_isLoading = true;
			this.url = url;
			this.target = target;
			reuqest.url = getFullUrl(url);
			startLoad(reuqest);
		}
		/**
		 * 添加loder的相关事件 
		 * @param eventDispatcher
		 * 
		 */		
		public function addLoadEvent(eventDispatcher:IEventDispatcher):void
		{
			if(eventDispatcher != null)
			{ 
				if(!eventDispatcher.hasEventListener(Event.COMPLETE))
				{
					eventDispatcher.addEventListener(Event.COMPLETE,onComplete,false,0,true);
				}
				if(!eventDispatcher.hasEventListener(ProgressEvent.PROGRESS))
				{
					eventDispatcher.addEventListener(ProgressEvent.PROGRESS,onProgress,false,0,true);
				}
				if(!eventDispatcher.hasEventListener(IOErrorEvent.IO_ERROR))
				{
					eventDispatcher.addEventListener(IOErrorEvent.IO_ERROR,onIoError,false,0,true);
				}
			}
		}
		/**
		 * 删除loder的相关事件 
		 * @param eventDispatcher
		 * 
		 */		
		public function removeLoadEvent(eventDispatcher:IEventDispatcher):void
		{
			if(eventDispatcher != null)
			{
				eventDispatcher.removeEventListener(Event.COMPLETE,onComplete);
				eventDispatcher.removeEventListener(ProgressEvent.PROGRESS,onProgress);
				eventDispatcher.removeEventListener(IOErrorEvent.IO_ERROR,onIoError);
			}
		}
		private function clear():void
		{
			sucessResult = null;
			failResult = null;
			loading = null;
			target = null;
			url = null;
		}
		/**
		 * 释放接口 
		 * @param o:释放时需要的参数（不是必须的）
		 * 
		 */		
		public function destroy(o:* = null):void
		{
			clear();
		}
		/**
		 * 开始加载,子类进行重写(一般是单加载器才进行重写)
		 * @param request
		 * 
		 */		
		protected function startLoad(request:URLRequest):void
		{
			throw new Error("startLoad为抽象方法,子类必须重写该方法");
		}
		protected function onComplete(event:Event):void
		{
			loadOver(event);
			try
			{
				if(target == null)
				{
					sucessResult(getData());
				}
				else
				{
					sucessResult(getData(),target);
				}
			}
			catch(error:Error)
			{
				trace(error.getStackTrace());
			}
			//清除相关数据
			if(!_isLoading)
				clear();
		}
		protected function onProgress(event:ProgressEvent):void
		{
			if(loading != null)
			{
				loading.progress(event.bytesLoaded,event.bytesTotal);
			}
		}
		protected function onIoError(event:IOErrorEvent):void
		{
			trace("资源加载失败:" + url + "\n" + event);
			loadOver(event);
			if(failResult != null)
			{
				var erroeObj:Object = {};
				erroeObj.event = event;
				erroeObj.target = target;
				erroeObj.url = url;
				erroeObj.loader = this;
				failResult(erroeObj);
			}
			if(!_isLoading)
				clear();
		}
		private function loadOver(event:Event):void
		{
			if(event != null)
			{
				removeLoadEvent(event.target as IEventDispatcher);
			}
			_isLoading = false;
		}
		public function getData():*
		{
			throw new Error("getData为抽象方法,子类必须重写该方法");
		}
	}
}
