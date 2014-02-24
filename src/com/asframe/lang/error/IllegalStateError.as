/**
 * @IllegalStateError.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-15
 */
package com.asframe.lang.error
{
	/**
	 * 在非法或不适当的时间调用方法时产生的信号。换句话说，应用程序没有处于请求操作所要求的适当状态下。
	 * @author sodaChen
	 * Date:2012-1-15
	 */
	public class IllegalStateError extends Error
	{
		public function IllegalStateError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
