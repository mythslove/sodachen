/**
 * @(#)MoreFileLoad.as
 * @author soda.C
 * @version  1.0
 * <br>Copyright (C), 2007 soda.C
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Soda.API
 * @data 2008-2-26
 */
package com.asframe.net
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.loading.ILoading;
	import com.asframe.net.bean.FileLoadBean;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	/**
	 * 多文件加载器，不支持同时加载多文件，按添加顺序进行加载.对添加文件的数据结构，封装在FileBean中，一般在开发小游戏专用
	 * <code>
	 * 		var loader:MoreFileLoader = new MoreFileLoader();
	 *		loader.addFile(onLoadXml,"config/NetConfig.xml","网络配置",MoreFileLoader.XML_TYPE);
	 *		loader.addFile(onLoadDisply,"image/role.png","角色图片",MoreFileLoader.BITMAP_TYPE);
	 *		loader.notify();
	 * </code>
	 * 
	 * @see org.sujun.net.MoreFileBean
	 */
	public class SimpleGameLoader extends EventDispatcher
	{
//		public static var RES_VERSION				:String = "?version=1";
		/** 生成显示对象 **/
		public static var DISPLAY_TYPE:int = 0;
		/** 生成Sprite对象 **/
		public static var SPRITE_TYPE:int = 1;
		/** 生成MovieClip对象 **/
		public static var MOVIECLIP_TYPE:int = 2;
		/** 生成Bitmap对象 **/
		public static var BITMAP_TYPE:int = 3;
		/** 生成bitmapData对象 **/
		public static var BITMAPDATA_TYPE:int = 4;
		/** 生成XML对象 **/
		public static var XML_TYPE:int = 5;
		/** 生成二进制数据流 **/
		public static var BYTEARRAY_TYPE:int = 6;
		/** 生成文本数据 **/
		public static var TEXT_TYPE:int = 7;
		
		private var isLoad			:Boolean;		//是否已经加载
		private var urlLoader		:URLLoader;		//加载器
		private var loader			:Loader;		//显示对象加载器
		private var request		:URLRequest;	//网络请求对象
		private var count			:int;			//计数器
		private var beanAry		:Array;			//存放加载文件的数据结构
		private var currBean		:FileLoadBean;	//当前正在加载的文件信息
		private var fileMap		:HashMap;		//与加载的缓存集合
		private var currType		:int;
		private var context		:LoaderContext;
		private var isGBK			:Boolean;
		private var loading		:ILoading;
		
		public function SimpleGameLoader(domain:ApplicationDomain = null)
		{
			urlLoader = new URLLoader();
			loader = new Loader();
			request = new URLRequest();
			fileMap = new HashMap();
			if(domain == null)
			{
				domain = ApplicationDomain.currentDomain;
			}
			context = new LoaderContext(false, domain);
			urlLoader.addEventListener(Event.COMPLETE, onURLLader,false,0,true);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadFile,false,0,true);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onError,false,0,true);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError,false,0,true);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR,onError,false,0,true);
			urlLoader.addEventListener(ProgressEvent.PROGRESS,progressEvent,false,0,true);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError,false,0,true);
			
			init();
		}
		public function setIsGBK(isGBK:Boolean):void
		{
			this.isGBK = isGBK;
		}
		public function setLoading(loading	:ILoading):void
		{
			this.loading = loading;
		}
		/**
		 * 初始化一些基础数据
		 */
		public function init():void
		{
			count = 0;
			isLoad = false;
			beanAry = new Array();
		}
		/**
		 * 清除资源加载器的所有资源，以便进行回收 
		 * 
		 */		
		public function clearRes():void
		{
			fileMap.clear();
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoadFile);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onError);
			loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
			urlLoader.removeEventListener(Event.COMPLETE, onURLLader);
			urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,onError);
			urlLoader.removeEventListener(ProgressEvent.PROGRESS,progressEvent);
			urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
		}
		/**
		 * 添加一个需要加载的文件
		 * @param displayName	: 文件在进度条中显示的名称
		 */
		public function addFile(path:String,displayName:String = null,dataType:int = 0):void
		{
			var bean:FileLoadBean = new FileLoadBean();
			bean.setPath(path);
			bean.setName(displayName);
			bean.setType(dataType);
			beanAry.push(bean);
		}
		public function getFile(key:String):Object
		{
			return fileMap.get(key);
		}
		/**
		 * 开始加载文件
		 */  
		public function notify():void
		{
			if(beanAry.length == 0)
			{
				//直接发出成功事件
				againLoad();
				return ;
			}
			currBean = FileLoadBean(beanAry.shift());
			request.url = currBean.getPath();
			currType = currBean.getType();
			if(currBean.getType() == XML_TYPE)
			{
				//进行文本加载
				urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
				urlLoader.load(request);
			}
			else
			{
				urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
				urlLoader.load(request);
			}
		}
		//再一次加载加载文件
		private function againLoad():void
		{
			if(beanAry.length > 0)
			{
				isLoad = false;
				//继续加载下一个文件
				notify();
			}
			else
			{
				init();
				//把引用清空，利于回收
				urlLoader.data = null;
				//发送全部加载完成时间
				this.dispatchEvent(new NetEvent(NetEvent.MORE_COMPLETE));
			}
		}
		private function onURLLader(event:Event):void
		{
			if(currBean.getType() == XML_TYPE)
			{
				fileMap.put(currBean.getPath(),XML(urlLoader.data));
				againLoad();
			}
			else
			{
				if(currBean.getType() == TEXT_TYPE)
				{
					var byteArray:ByteArray = urlLoader.data as ByteArray;
					if(isGBK)
					{
						fileMap.put(currBean.getPath(),byteArray.readMultiByte(byteArray.length,"GBK"));
					}
					else
					{
						fileMap.put(currBean.getPath(),byteArray.readMultiByte(byteArray.length,"UTF8"));
					}
					againLoad();
				}
				else
				{
					//如果是显示对象，则重新用Loader加载
					try
					{
						loader.loadBytes(urlLoader.data,context);
					}
					catch(error:Error) 
					{
						loader.loadBytes(urlLoader.data,context);
					}
				}
			}
			urlLoader.data = null;
		}
		private function onLoadFile(event:Event):void
		{
			//根据需要的类型，把数据强制转换成对应的数据类型
			switch (currBean.getType())
			{
				case DISPLAY_TYPE:
					fileMap.put(currBean.getPath(),loader.content);
					break;
				case SPRITE_TYPE:
					fileMap.put(currBean.getPath(),Sprite(loader.content));
					break;
				case MOVIECLIP_TYPE:
					fileMap.put(currBean.getPath(),MovieClip(loader.content));
					break;
				case BITMAP_TYPE:
					fileMap.put(currBean.getPath(),Bitmap(loader.content));
					break;
				case BITMAPDATA_TYPE:
					fileMap.put(currBean.getPath(),Bitmap(loader.content).bitmapData);
					break;
			}
			//卸载掉加载的资源
			loader.unload();
			againLoad();
		}
		private function onError(event:IOErrorEvent):void
		{
			trace("加载出现错误了............." + request.url);
			againLoad();
		}
		private function onSecurityError(event:SecurityErrorEvent):void
		{
			trace("出现安全错误了............." + request.url);
			againLoad();
		}
		private function progressEvent(event:ProgressEvent):void
		{
			if(loading != null)
			{
				loading.progress(event.bytesLoaded,event.bytesTotal);
			}
//			var netEvent:NetEvent = new NetEvent(NetEvent.PROGRESS);
//			netEvent.bytesTotal = event.bytesTotal;
//			netEvent.bytesLoaded = event.bytesLoaded;
//			dispatchEvent(netEvent);
		}
	}
}
