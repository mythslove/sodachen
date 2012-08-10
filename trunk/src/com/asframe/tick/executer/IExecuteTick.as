/**
 * @IExecuteTick.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-5-4
 */
package com.asframe.tick.executer
{
	import com.asframe.lang.IDisposable;
	import com.asframe.tick.ITick;

	/**
	 * 执行心跳的机制
	 * @author sodaChen
	 * @Date:2011-5-4
	 */
	public interface IExecuteTick extends IDisposable
	{
		/**
		 * 设置心跳存放和删除列表 
		 * @param tickList:
		 * @param removeList:
		 */			
		function setTickList(tickList:Vector.<ITick>,removeList:Vector.<ITick>):void;
		/**
		 * 执行心跳执行器里面的心跳(tick)队列 
		 */		
		function execute():void;
	}
}
