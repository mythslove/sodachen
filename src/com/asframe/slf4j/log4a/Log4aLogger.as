/**
 * @Log4aLogger.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame AStruts2Lib
 * <br>Date:2012-4-15
 */
package com.asframe.slf4j.log4a
{
	import com.asframe.log4a.ILog;
	import com.asframe.log4a.Level;
	import com.asframe.log4a.LoggerFactory;
	import com.asframe.log4a.format.ILogFormat;
	import com.asframe.slf4j.ILogger;
	import com.asframe.slf4j.Level;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-4-15
	 */
	public class Log4aLogger implements ILog, ILogger
	{
		private var log4a:ILog;
		private var log4aLevel:com.asframe.log4a.Level;
		
		public function Log4aLogger()
		{
		}
		public function setLevel(level:com.asframe.slf4j.Level):void
		{
			log4aLevel.levelName = level.name;
			log4aLevel.level = level.level;
		}
		public function setLog4a(log4a:ILog):void
		{
			this.log4a = log4a;
			log4a.initLog(log4aLevel,LoggerFactory.getDefaultFormat());
		}
		public function isTraceEnabled():Boolean
		{
			return log4a.isTraceEnabled();
		}
		
		public function isDebugEnabled():Boolean
		{
			return log4a.isDebugEnabled();
		}
		
		public function isInfoEnabled():Boolean
		{
			return log4a.isInfoEnabled();
		}
		
		public function isWarnEnabled():Boolean
		{
			return log4a.isWarnEnabled();
		}
		
		public function isErrorEnabled():Boolean
		{
			return log4a.isErrorEnabled();
		}
		
		public function initLog(level:com.asframe.log4a.Level, logFormat:ILogFormat):void
		{
			log4a.initLog(level,logFormat);
		}
		
		public function setTargetClass(targetClass:Class):void
		{
			log4a.setTargetClass(targetClass);
		}
		
		public function trace(arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
		}
		
		public function debug(arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
		}
		
		public function warn(arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
		}
		
		public function info(arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
		}
		
		public function error(arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
		}
		
		public function parseObject(obj:Object):void
		{
		}
	}
}
