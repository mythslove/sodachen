/**
 * @ByteLoader.as
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
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	/**
	 *
	 * @author sodaChen
	 * #Date:2013-10-24
	 */
	public class ByteLoader extends URLLoader
	{
		/** 加载的资源路径 **/
		public var url:String;
		
		public var request:URLRequest;
		public function ByteLoader()
		{
			dataFormat = URLLoaderDataFormat.BINARY;
			request = new URLRequest();
		}
		
		public function start(url:String,loadUrl:String):void
		{
			this.url = url;
			request.url = loadUrl;
			load(request);
		}
		public function reStart():void
		{
			load(request);
		}
	}
}
