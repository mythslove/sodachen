/**
 * @AbstractMethodError.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Lion
 * <br>Date:2013-3-7
 */
package com.asframe.lang.error
{
	/**
	 *
	 * @author sodaChen
	 * #Date:2013-3-7
	 */
	public class AbstractMethodError extends Error
	{
		public function AbstractMethodError(message:*="", id:*=0)
		{
			if(message == "")
			{
				message = "必须实现该方法才可调用！";
			}
			super(message, id);
		}
	}
}
