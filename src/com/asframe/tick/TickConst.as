/**
 * @TickConst.as
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
	/**
	 * 心跳机制的相关常量
	 * @author sodaChen
	 * @Date:2011-5-4
	 */
	public class TickConst
	{
		/**
		 * tick出现错误之后，删除掉(下个onTick依然会执行) 
		 */		
		public static const RMOVE_ON_TICK_ERROR:int = 1;
		/**
		 * tick出错之后，忽略掉(下个onTick依然会执行) 
		 */		
		public static const IGNORE_ON_TICK_ERROR:int = 2;
	}
}
