/**
 * @DisplayLoader.as
 * 
 * @author sodaChen mail:asframe@163.com
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
	import flash.system.LoaderContext;

	/**
	 *
	 * @author sodaChen
	 */
	public class DisplayLoader extends AbstractLoader
	{
		private var loader:Loader;
		private var coaderContext:LoaderContext;
		
		public function DisplayLoader()
		{
			super();
			loader = new Loader();
			coaderContext = new LoaderContext(false,domain);
		}
		public override function getClass():Class
		{
			return DisplayLoader;
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
			loader.load(request,coaderContext);
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
			return loader.content;
		}
		public override function dispose(o:* = null):void
		{
			super.dispose();
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
