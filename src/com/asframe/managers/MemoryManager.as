/**
 * @MemoryManager.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-5-4
 */
package com.asframe.managers
{
	import com.asframe.tick.ITick;
	
	import flash.net.LocalConnection;
	import flash.system.System;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	/**
	 * 内存管理器
	 * @author sodaChen
	 * @Date:2011-5-4
	 */
	public class MemoryManager implements ITick
	{
		/** 内存不足警告范围 **/
		public static const WARNING_MEMORY:uint = 209715200;
		/** 内存不足关闭程序的范围 **/
		public static const ABORT_MEMORY:uint = 314572800;
		
		/** 内存不足警告范围 **/
		private var warningMemory:uint;
		/** 内存不足关闭程序的范围 **/
		private var abortMemory:uint;
		/** 单例 **/
		private static var instance:MemoryManager;
		/** 使用执行间隔的ID **/
		private var intervalID:uint;
		/** 检查的时间间隔 **/
		private var interval:int;
		/**
		 * 内存不足警告执行的方法
		 */
		private var warningHandler:Function;
		/**
		 * 内存不足时执行的方法
		 */		
		private var abortHandler:Function;
		
		public function MemoryManager()
		{
		}
		public function getInstance():MemoryManager
		{
			if(instance == null)
			{
				instance = new MemoryManager();
			}
			return instance;
		}
		/**
		 * 初始化内存管理器 
		 * @param warningMemory:警告内存的大小
		 * @param warningHandler:达到警告内存时的接收函数
		 * @param abortMemory:严重，必须关闭或者强制结束内存大小
		 * @param abortHandler:相应的相应函数
		 * 
		 */		
		public function init(	warningMemory:uint = MemoryManager.WARNING_MEMORY,
								warningHandler:Function = null,
								abortMemory:uint = MemoryManager.ABORT_MEMORY,
								abortHandler:Function = null):void
		{
			this.warningHandler = warningHandler;
			this.abortHandler = abortHandler;
		}
		/**
		 * 开始检测
		 * @param interval
		 * 
		 */
		public function start(interval:int = 10000):void
		{
			intervalID = setInterval(tick,interval);
		}
		
		/**
		 * 停止检测
		 * 
		 */		
		public function stop():void
		{
			clearInterval(intervalID);
		}
		/**
		 * 执行释放内存 
		 */		
		public static function gc():void
		{
			try
			{
				var gc1:LocalConnection = new LocalConnection();
				var gc2:LocalConnection = new LocalConnection();
				gc1.connect("com.asframe.manager.MemoryManager");
				gc2.connect("com.asframe.memory.MemoryManager");
			}
			catch(error:Error)
			{
				trace("强制执行内存清理:" + error);
			}
		}
		public function tick():void
		{
			if (warningHandler!=null && System.totalMemory > WARNING_MEMORY) 
			{
				warningHandler();
			}
			else if (abortHandler!=null && System.totalMemory > ABORT_MEMORY)
			{
				abortHandler();
			}
		}
	}
}
