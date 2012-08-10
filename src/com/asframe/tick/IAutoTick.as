/**
 * @IAutoTick.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-5-4
 */
package com.asframe.tick
{
	import com.asframe.lang.IDisposable;

	/**
	 * 具备自动加入,自动结束，同时还具备了销毁的功能 的心跳对象
	 * @author sodaChen
	 * @Date:2011-5-4
	 */
	public interface IAutoTick extends ITick,IDisposable
	{
		/**
		 * 是否已经结束了.返回true时，执行器会删除掉该tick 
		 * @return 
		 * 
		 */		
		function isFinish():Boolean;
	}
}
