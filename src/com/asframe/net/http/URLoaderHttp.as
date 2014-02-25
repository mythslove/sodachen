/**
 * @URLoaderHttp.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-9-6
 */
package com.asframe.net.http
{
	import com.asframe.loading.ILoading;
	import com.asframe.ref.Variable;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.system.Capabilities;
	import flash.utils.ByteArray;

	/**
	 * 基于ULRLoader的http服务
	 * @author sodaChen
	 * Date:2012-9-6
	 */
	public class URLoaderHttp extends BaseHttpServices
	{
		private var isByte					:Boolean;
		private var urlLoader				:URLLoader;
		private var urlRequest				:URLRequest;
		
		public function URLoaderHttp(httpData:IHttpData = null,urlHead:String = null)
		{
			super(httpData,urlHead);
			urlLoader = new URLLoader();
			urlRequest = new URLRequest();
			urlLoader.dataFormat = URLLoaderDataFormat.BINARY;
			urlLoader.addEventListener(Event.COMPLETE,onComplete);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR,onIoError);
		}
		public override function destroy(o:* = null):void
		{
			super.destroy(o);
			urlLoader.removeEventListener(Event.COMPLETE,onComplete);
			urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,onIoError);
			urlRequest = null;
			urlLoader = null;
		}
		protected override function onRequest(url:String):void
		{
			urlRequest.data = null;
			urlRequest.url = url;
			if(params != null)
			{
				urlRequest.data = params;
			}
			urlLoader.load(urlRequest);
		}
		
		private function onIoError(event:IOErrorEvent):void
		{
			trace("io错误:" + event);
			if(errorFun != null)
			{
				errorFun(event);
			}
		}
		private function onComplete(event:Event):void
		{
			var bytes:ByteArray = urlLoader.data;
			bytes.position = 0;
			var context:String = bytes.readMultiByte(bytes.length,charSet);
			if(httpData != null)
			{
				successFun(httpData.decode(context));
			}
			else
			{
				//原始的解析方式key=value&key=value
				var obj:Object = new Object();
				var arys:Array = context.split("&");
				var temps:Array = null;
				for (var i:int = 0; i < arys.length; i++) 
				{
					temps = arys[i].split("=");
					if(temps.length == 2)
					{
						obj[temps[0]] = temps[1];
					}
				}
				successFun(obj);
			}
		}
	}
}
