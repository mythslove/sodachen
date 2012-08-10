/**
 * @IDisposable.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-12
 */
package com.asframe.lang
{
	/**
	 * 释放资源接口
	 * @author sodaChen
	 * @Date:2012-1-12
	 */
	public interface IDisposable
	{
		/**
		 * 释放对象相关资源 
		 * @param o:释放时需要的参数（不是必须的）
		 * 
		 */		
		function dispose(o:* = null):void;
	}
}
