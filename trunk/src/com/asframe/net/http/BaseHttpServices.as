/**
 * @BaseHttpServices.as
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
	
	import flash.net.URLVariables;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2012-9-6
	 */
	public class BaseHttpServices implements IHttpServices
	{
		protected var httpData			:IHttpData;
		protected var params			:URLVariables;
		protected var loading			:ILoading;
		protected var charSet			:String;
		protected var successFun		:Function;
		protected var errorFun			:Function;
		protected var urlHead			:String = null;
		
		public function BaseHttpServices(httpData:IHttpData = null,urlHead:String = null)
		{
			this.httpData = httpData;
			this.urlHead = urlHead;
			charSet = "UTF-8";
		}
		
		public function setCharSet(charSet:String):void
		{
			this.charSet = charSet;
		}
		
		public function setHttpData(httpData:IHttpData):void
		{
			this.httpData = httpData;
		}
		
		public function addParams(key:String,value:*):void
		{
			if(params == null)
			{
				params = new URLVariables();
			}
			params[key] = value;
		}
		
		public function setLoading(loading:ILoading):void
		{
			this.loading = loading;
		}
		
		public function request(url:String, 
								params:Object = null, 
								success:Function = null, 
								error:Function = null,
								loading:ILoading = null):void
		{
			if(params != null)
			{
				if(params is URLVariables)
				{
					this.params = URLVariables(params);
				}
				else
				{
					if(this.params == null)
					{
						this.params = new URLVariables();
					}
					for (var key:String in params) 
					{
						this.params[key] = params[key];
					}
				}
			}
			if(urlHead != null)
			{
				url = urlHead + url;
			}
			this.successFun = success;
			this.errorFun = error;
			this.loading = loading;
			onRequest(url);
		}
		public function destroy(o:* = null):void
		{
			httpData = null;
			errorFun = null;
			successFun = null;
			loading = null;
			params = null;
		}
		/**
		 * 子类用来重写实际请求操作的方法 
		 * @param url
		 * 
		 */		
		protected function onRequest(url:String):void
		{
			
		}
	}
}
