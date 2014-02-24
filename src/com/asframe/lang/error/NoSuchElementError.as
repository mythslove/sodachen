/**
 * @NoSuchElementError.as
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
	 * 由 Enumeration 的 nextElement 方法抛出，表明枚举中没有更多的元素。 
	 * @author sodaChen
	 * Date:2012-1-15
	 */
	public class NoSuchElementError extends Error
	{
		public function NoSuchElementError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
