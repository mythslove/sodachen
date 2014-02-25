/**
 * @LoaderResParser.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-12
 */
package com.asframe.res.parsers
{
	import flash.display.Loader;
	import flash.events.Event;

	/**
	 * 通过Loader来做自动解析的处理，主要是处理图片和SWF
	 * @author sodaChen
	 * #Date:2012-2-12
	 */
	public class LoaderResParser extends BasicResParser
	{
		private var loader:Loader;
		public function LoaderResParser()
		{
			super();
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoader);
			asyncFlag = true;
		}
		protected override function onInitParser():void
		{
//			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoader);
			parsing = true;
			loader.loadBytes(byteArray);
		}
		private function onLoader(event:Event):void
		{
//			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoader);
			data = loader.content;
			parseOver();
			//回调参数
			asyncComplete(this);
			try
			{
				loader.unload();
			} 
			catch(error:Error) 
			{
				
			}
			//查看是否有下一个，自动加载下一个
			startParse();
		}
	}
}
