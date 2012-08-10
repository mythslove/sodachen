/**
 * @IClass.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-5-4
 */
package com.asframe.lang
{
	/**
	 * 返回此 Object 的运行时类
	 * @author sodaChen
	 * @Date:2011-5-4
	 */
	public interface IClass
	{
		/**
		 * 返回此 Object 的运行时类
		 * @return 表示此对象运行时类的 Class 对象
		 * 
		 */		
		function getClass():Class;
	}
}
