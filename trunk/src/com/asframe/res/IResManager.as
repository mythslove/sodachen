/**
 * @IResManager.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2010-5-7
 */
package com.asframe.res
{
	import com.asframe.lang.IUrlVersion;
	import com.asframe.res.parsers.IResParser;

	/**
	 *
	 * @author sodaChen
	 * #Date:2010-5-7
	 */
	public interface IResManager extends IUrlVersion
	{
		/**
		 * 添加解析器 
		 * @param parserClass
		 * 
		 */		
		function addParser(parser:IResParser,...parseTypes):void;
		/**
		 * 加载资源 
		 * @param url 路径
		 * @param complete 成功回调函数
		 * @param target 目标参数，通过complete回调回来
		 * @param error 失败函数
		 * @param level 优先级 -1为直接加载，0为最低。越高越优先加载
		 * 
		 */		
		function load(url:String,
					  complete:Function = null,
					  target:* = null,
					  error:Function = null,
					  level:int = 0):void;
		
		/**
		 * 加载一组资源，返回也是一组结果（顺序不变） 
		 * @param urls
		 * @param complete
		 * @param target
		 * @param error
		 * @param level
		 * 
		 */		
		function loads(urls:Array,
					  complete:Function = null,
					  target:* = null,
					  error:Function = null,
					  level:int = 0):void;
		/**
		 * 取消资源加载 
		 * @param url
		 * @param complete
		 * 
		 */			
		function cancel(url:String,complete:Function):void;
		/**
		 * 释放在资源管理器缓存的资源 .主动释放其中缓存的二进制资源。注意，会销毁ByteArray的
		 * @param url
		 * 
		 */		
		function release(url:String):void;
	}
}
