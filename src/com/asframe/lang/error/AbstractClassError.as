/**
 * @AbstractClassError.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-7-20
 */
package com.asframe.lang.error
{
	/**
	 * 抽象类错误，实例化了一个抽象了，就会报这个错误
	 * @author sodaChen
	 * Date:2012-7-20
	 */
	public class AbstractClassError extends Error
	{
		public function AbstractClassError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
