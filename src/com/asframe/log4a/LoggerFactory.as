/**
 * @LoggerFactory.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-8-19
 */
package com.asframe.log4a
{
	import com.asframe.log4a.format.ArrayFormat;
	import com.asframe.log4a.format.ILogFormat;
	import com.asframe.log4a.format.LogFormatImpl;
	import com.asframe.log4a.format.ObjectFormat;
	import com.asframe.log4a.impl.LogOutputImpl;

	/**
	 * 日志工厂
	 * @author sodaChen
	 * @Date:2011-8-19
	 */
	public final class LoggerFactory
	{
		public function LoggerFactory()
		{
		}
		public static function getDefaultFormat():ILogFormat
		{
			var logFormat:ILogFormat = new LogFormatImpl();
			logFormat.setLevel(Level.DEBUG);
			logFormat.setLogOutput(new LogOutputImpl());
			//添加默认的处理方式
			logFormat.isShowTime(true);
			logFormat.addObjectFormat(new ArrayFormat());
			logFormat.addObjectFormat(new ObjectFormat());
			return logFormat;
		}
		/**
		 * 获取log输出对象
		 * @param name
		 * @return 
		 * 
		 */		
		public static function getLogger(name:String):ILog
		{
			return null;
		}
		/**
		 * 获取log输出对象
		 * @param name
		 * @return 
		 * 
		 */		
		public static function getLoggerByClass(clazz:Class):ILog
		{
			return null;
		}
	}
}
