/**
 * @DisplayLoader.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-22
 */
package com.asframe.load
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.SecurityDomain;

	/**
	 *
	 * @author sodaChen
	 */
	public class DisplayLoader extends BasicLoader
	{
		private var loader:Loader;
		private var loaderContext:LoaderContext;
		
		public function DisplayLoader()
		{
			super();
			loader = new Loader();
//			loaderContext = new LoaderContext(false,ApplicationDomain.currentDomain);
//			loaderContext.securityDomain = SecurityDomain.currentDomain;
		}
		protected override function startLoad(request:URLRequest):void
		{
			if(loader.content != null)
			{
				try
				{ 
					loader.unloadAndStop();
				}
				catch(error:Error)
				{
					trace(error.getStackTrace());
				}
			}
			addLoadEvent(loader.contentLoaderInfo);
			loader.load(request,loaderContext);
		}
		public function getDisplay():DisplayObject
		{
			return getData() as DisplayObject;
		}
		public function getBitmap():Bitmap
		{
			return getData() as Bitmap;
		}
		public function getMovieClip():MovieClip
		{
			return getData() as MovieClip;
		}
		public function getSprite():Sprite
		{
			return getData() as Sprite;
		}
		public override function getData():*
		{
			var data:DisplayObject = loader.content;
			//todo 注意，这里如果unload，会造成加载的sprite对象的loadInfo属性为空，不能进行域的反射取值
			//暂时不进行回收，会造成最多一个资源的缓存
//			try
//			{
//				loader.unload();
//			} 
//			catch(error:Error) 
//			{
//				trace(error.getStackTrace());
//			}
			return data;
		}
		public override function destroy(o:* = null):void
		{
			super.destroy();
			try
			{ 
				loader.unload();
			}
			catch(error:Error)
			{
				trace(error.getStackTrace());
			}
			loader = null;
		}
	}
}
