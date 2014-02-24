/**
 * @ArithmeticError.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-3-26
 */
package com.asframe.lang.error
{
	/**
	 * 当出现异常的运算条件时，抛出此异常。例如，一个整数“除以零”时，抛出此类的一个实例。
	 * @author sodaChen
	 * Date:2012-3-26
	 */
	public class ArithmeticError extends Error
	{
		public function ArithmeticError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
