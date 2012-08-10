/**
 * @DisplayByteCode.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-26
 */
package com.asframe.load.byte
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.utils.ByteArray;
	
	/**
	 * 显示对象解码器
	 * @author sodaChen
	 */
	public class DisplayByteCode extends BaseByteCode
	{
		private var loader:Loader;
		private var sucessResult:Function;
		
		public function DisplayByteCode()
		{
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete,false,0,true);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIoError,false,0,true);
		}
		
		protected override function onByteCode(byteArray:ByteArray,sucessResult:Function):*
		{
			if(sucessResult == null)
			{
				throw Error("显示对象解码，必须有回调函数!");
			}
			this.sucessResult = sucessResult;
			loader.loadBytes(byteArray);
			return null;
		}
		private function onIoError(event:IOErrorEvent):void
		{
			trace("显示对象解码出现错误");
			sucessResult(null);
		}
		private function onComplete(event:Event):void
		{
			var data:* = loader.content;
			try
			{
				loader.unload();
			}
			catch(error:Error)
			{
				trace(error.getStackTrace());
			}
			sucessResult(data);
		}
	}
}
