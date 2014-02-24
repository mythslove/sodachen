/**
 * @NumberFormatError.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-12
 */
package com.asframe.lang.error
{
	/**
	 * 当应用程序试图将字符串转换成一种数值类型，但该字符串不能转换为适当格式时，抛出该异常。
	 * @author sodaChen
	 * Date:2012-1-12
	 */
	public class NumberFormatError extends Error
	{
		public function NumberFormatError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
