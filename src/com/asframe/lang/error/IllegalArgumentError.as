/**
 * @IllegalArgumentError.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-14
 */
package com.asframe.lang.error
{
	/**
	 * 参数非法错误
	 * @author sodaChen
	 * Date:2012-1-14
	 */
	public class IllegalArgumentError extends Error
	{
		public function IllegalArgumentError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
