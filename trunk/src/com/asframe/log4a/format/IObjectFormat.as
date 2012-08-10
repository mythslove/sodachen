/**
 * @IObjectFormat.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-9-4
 */
package com.asframe.log4a.format
{
	/**
	 * 处理对象的格式
	 * @author sodaChen
	 * @Date:2011-9-4
	 */
	public interface IObjectFormat
	{
		/**
		 * 获取到对象格式的类型（唯一标识） 
		 * @return 
		 * 
		 */		
		function getType():String;
		/**
		 * 把对象转换成特定的文本格式 
		 * @param object
		 * @return 
		 * 
		 */		
		function toFormatString(object:Object):String;
	}
}
