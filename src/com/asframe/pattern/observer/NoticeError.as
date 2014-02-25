/**
 * @NoticeError.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame AStruts2
 * <br>Date:2012-4-15
 */
package com.asframe.pattern.observer
{
	/**
	 * 通知的相关错误
	 * @author sodaChen
	 * Date:2012-4-15
	 */
	public class NoticeError extends Error
	{
		public function NoticeError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
