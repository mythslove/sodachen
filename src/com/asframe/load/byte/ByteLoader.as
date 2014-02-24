/**
 * @ByteLoader.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-23
 */
package com.asframe.load.byte
{
	import com.asframe.load.BasicLoader;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;

	/**
	 * 字节加载器,加载进来的是二进制字节码.如果有解码器,则获取数据的时候会进行解码,转换成实际的数据格式
	 * @author sodaChen
	 */
	public class ByteLoader extends BasicLoader
	{
		private var loader:URLLoader;
		private var byteCode:IByteCode;
		private var data:*;
		
		public function ByteLoader()
		{
			super();
			loader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.BINARY;
		}
		public function setByteCode(byteCode:IByteCode):void
		{
			this.byteCode = byteCode;
		}
		protected override function startLoad(request:URLRequest):void
		{
			addLoadEvent(loader);
			loader.load(request);
		}
		protected override function onComplete(event:Event):void
		{
			if(byteCode == null)
			{
				data = loader.data;
				super.onComplete(event);
			}
			else
			{
				data = byteCode.byteCode(loader.data,onByteCode);
				super.onComplete(event);
			}
		}
		public function getByteArray():ByteArray
		{
			return loader.data as ByteArray;
		}
		public override function getData():*
		{
			return data;
		}
		public function getDataByCode(byteCode:IByteCode,resuleFun:Function = null):void
		{
			
		}
		private function onByteCode(data:*):void
		{
			this.data = data;
			super.onComplete(null);
		}
	}
}
