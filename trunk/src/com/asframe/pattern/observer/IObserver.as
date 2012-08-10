/**
 * @IObserver.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-1-19
 */
package com.asframe.pattern.observer
{
	/**
	 * 观察者接口
	 * @author sodaChen
	 * @Date:2012-1-19
	 */
	public interface IObserver
	{
		/**
		 * 相应观察者 
		 * @param notice 触发此次相应的通知
		 * @param args 相关参数（当参数只有一个时，args为单一对象，如果参数是多个的话，则args为数组） 
		 * 
		 */		
		function replyNotice(notice:*,args:* = null):void;
	}
}
