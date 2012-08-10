/**
 * @ClassCastError.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-4-12
 */
package com.asframe.lang.error
{
	/**
	 * 当试图将对象强制转换为不是实例的子类时，抛出该异常。例如，以下代码将生成一个 ClassCastException： 
	 * @author sodaChen
	 * @Date:2012-4-12
	 */
	public class ClassCastError extends Error
	{
		public function ClassCastError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
