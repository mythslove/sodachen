/**
 * @TextLoader.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Load
 * <br>Date:2012-2-25
 */
package com.asframe.load
{
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;

	/**
	 * 文本加载器
	 * @author sodaChen
	 * @Date:2012-2-25
	 */
	public class TextLoader extends AbstractLoader
	{
		private var loader:URLLoader;
		
		public function TextLoader()
		{
			super();
			loader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
		}
		protected override function startLoad(request:URLRequest):void
		{
			addLoadEvent(loader);
			loader.load(request);
		}
		public override function getData():*
		{
			return loader.data;
		}
		public function getString():String
		{
			return loader.data;
		}
		public function getXML():String
		{
			return XML(loader.data);
		}
	}
}
