/**
 * @LogOutputImpl.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-9-10
 */
package com.asframe.log4a.impl
{
	import com.asframe.log4a.ILogOutput;
	import com.asframe.log4a.Level;
	
	/**
	 * 日志输出的基本实现
	 * @author sodaChen
	 * @Date:2011-9-10
	 */
	public class LogOutputImpl implements ILogOutput
	{
		/**
		 * 输出目标的信息 
		 * @param targetInfo
		 * 
		 */		
		public function outputTarget(targetInfo:String):void
		{
			trace(targetInfo);
		}
		/**
		 * 日志的输出接口 
		 * @param msg:日志信息
		 * @param level:日志级别
		 * 
		 */		
		public function outputLog(logs:String,level:Level):void
		{
			trace(logs);
		}
	}
}
