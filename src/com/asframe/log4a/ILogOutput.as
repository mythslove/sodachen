/**
 * @ILogOutput.as.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-9-4
 */
package com.asframe.log4a
{
	/**
	 * 日志的最终输出接口(日志的终端)
	 * @author sodaChen
	 * Date:2011-9-4
	 */
	public interface ILogOutput
	{
		/**
		 * 输出目标的信息 
		 * @param targetInfo
		 * 
		 */		
		function outputTarget(targetInfo:String):void
		/**
		 * 日志的输出接口 
		 * @param msg:日志信息
		 * @param level:日志级别
		 * 
		 */		
		function outputLog(logs:String,level:Level):void;
	}
}
