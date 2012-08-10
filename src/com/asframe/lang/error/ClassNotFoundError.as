/**
 * @ClassNotFoundError.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-12
 */
package com.asframe.lang.error
{
	/**
	 * 类找不到错误
	 * @author sodaChen
	 * @Date:2012-1-12
	 */
	public class ClassNotFoundError extends Error
	{
		public function ClassNotFoundError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
