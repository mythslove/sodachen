/**
 * @ILoader.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-21
 */
package com.asframe.load
{
	import com.asframe.lang.IDisposable;
	import com.asframe.lang.IUrlVersion;
	import com.asframe.loading.ILoading;

	/**
	 * 加载接口
	 * @author sodaChen
	 */
	public interface ILoader extends IDisposable,IUrlVersion
	{
		/**
		 * 设置加载的loading加载显示器 
		 * @param loading
		 * 
		 */		
		function setLoading(loading:ILoading):void;
		/**
		 * 是否正在加载中
		 * @return true/false
		 * 
		 */		
		function isLoading():Boolean;
		/**
		 * 设置Loader的类型 
		 * @param type
		 * 
		 */
		function setType(type:String):void;
		/**
		 * 获取Loader的类型
		 * @return 
		 * 
		 */			
		function getType():String;
		/**
		 * 获取到加载的内容
		 * @return 
		 * 
		 */		
		function getData():*;
		/**
		 * 添加加载失败的回调函数(不是必须的) 
		 * @param failResult
		 * 
		 */		
		function addFailResult(failResult:Function):void;
		/**
		 * 加载资源 
		 * @param url:路径
		 * @param sucessResult:成功回调函数
		 * @param loading:loading条
		 * 
		 */		
		function load(url:*,sucessResult:Function = null,target:* = null,loading:ILoading = null):void;
	}
}
