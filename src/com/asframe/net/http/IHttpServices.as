/**
 * @IHttpServices.as
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
	import com.asframe.lang.IDestory;
	import com.asframe.loading.ILoading;

	/**
	 * Http服务
	 * @author sodaChen
	 * Date:2012-9-6
	 */
	public interface IHttpServices extends IDestory
	{
		/**
		 * 设置字符集 
		 * @param charSet
		 * 
		 */		
		function setCharSet(charSet:String):void;
		/**
		 * 设置HttpData的格式 
		 * @param httpData
		 * 
		 */		
		function setHttpData(httpData:IHttpData):void;
		/**
		 * 设置一次发送的参数 
		 * @param args
		 * 
		 */		
		function addParams(key:String,value:*):void;
		/**
		 * 设置请求数据时的loading 
		 * @param loading
		 * 
		 */		
		function setLoading(loading:ILoading):void;
		/**
		 * 进行一次请求 
		 * @param url url
		 * @param params 参数  可选
		 * @param success 成功回调函数 fun(data:Object)  可选
		 * @param error 失败回调函数 fun(event:Event)    可选
		 * @param loading loading 可选
		 * 
		 */		
		function request(url:String, 
						 params:Object = null, 
						 success:Function = null, 
						 error:Function = null,
						 loading:ILoading = null):void;
	}
}
