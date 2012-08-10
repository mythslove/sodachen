/**
 * @ILogHeadFormat.as.as
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
	import com.asframe.log4a.Level;

	/**
	 * 日志的头信息处理格式
	 * @author sodaChen
	 * @Date:2011-9-4
	 */
	public interface ILogHeadFormat
	{
		/**
		 * 创建日志的头信息 
		 * @param target:日志的输出咪表
		 * @param level:日志的输出级别
		 * @return 
		 * 
		 */		
		function toHeadFormat(targetPath:String,level:Level):String;
	}
}
