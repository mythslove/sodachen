/**
 * @UnsupportedOperationError.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-15
 */
package com.asframe.lang.error
{
	/**
	 * 当不支持请求的操作时，抛出该异常。
	 * @author sodaChen
	 * @Date:2012-1-15
	 */
	public class UnsupportedOperationError extends Error
	{
		public function UnsupportedOperationError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
