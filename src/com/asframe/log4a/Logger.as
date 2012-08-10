/**
 * @Logger.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-8-12
 */
package com.asframe.log4a
{
	import com.asframe.log4a.format.ILogFormat;
	import com.asframe.log4a.format.LogFormatImpl;

	/**
	 *
	 * @author sodaChen
	 * @Date:2011-8-12
	 */
	public class Logger
	{
//		/** 是否开启输出 **/
//		public static var isTraceEnabled				:Boolean;
//		/** 是否开启调试输出 **/
//		public static var isDebugEnabled				:Boolean;
//		/** 是否开启警告信息输出 **/
//		public static var isWarnEnabled				:Boolean;
//		/** 是否开启信息输出 **/
//		public static var isInfoEnabled				:Boolean;
//		/** 是否开启错误信息输出 **/
//		public static var isErrorEnabled				:Boolean;
		
		/** 默认是开启调试模式的 **/
		private static var level						:Level = Level.ERROR;
		
		public static var logFormat					:ILogFormat = LoggerFactory.getDefaultFormat();
		
		/**
		 * 是否开启普通输出模式
		 * @return 
		 * 
		 */		
		public static function isTraceEnabled():Boolean
		{
			return level.level >= Level.TRACE.level;
		}
		/**
		 * 是否开启调试输出 
		 * @return 
		 * 
		 */		
		public static function isDebugEnabled():Boolean
		{
			return level.level >= Level.DEBUG.level;
		}
		/**
		 * 是否开启信息输出 
		 * @return 
		 * 
		 */		
		public static function isInfoEnabled():Boolean
		{
			return level.level >= Level.INFO.level;
		}
		/**
		 * 是否开启警告信息输出 
		 * @return 
		 * 
		 */		
		public static function isWarnEnabled():Boolean
		{
			return level.level >= Level.WARN.level;
		}
		/**
		 * 输出调试信息 
		 * @param target:日志输出的源头
		 * @param arg0:输出参数
		 * @param arg1:输出参数
		 * @param arg2:输出参数
		 * 
		 */				
		public static function debug(target:Object,arg0:Object,arg1:Object = null,arg2:Object = null):void
		{
			formatLog(Level.DEBUG,target,arg0,arg1,arg2);
		}
		/**
		 * 输出警告的信息
		 * @param target:日志输出的源头
		 * @param arg0:输出参数
		 * @param arg1:输出参数
		 * @param arg2:输出参数
		 * 
		 */	
		public static function warn(target:Object,arg0:Object,arg1:Object = null,arg2:Object = null):void
		{
			formatLog(Level.WARN,target,arg0,arg1,arg2);
		}
		/**
		 * 设置日志等级 
		 * @param level:日志等级描述对象
		 * 
		 */		
		public static function setLevel(level:Level):void
		{
			Logger.level = level;
			logFormat.setLevel(level);
		}
		/**
		 * 是否开启错误信息输出 
		 * @return 
		 * 
		 */		
		public static function isErrorEnabled():Boolean
		{
			return level.level >= Level.ERROR.level;
		}
//		/**
//		 * 设置日志等级 
//		 * @param level:日志等级描述对象
//		 * 
//		 */		
//		public static function setLevel(level:Level):void
//		{
//			Logger.level = level;
//			logFormat.setLevel(level);
//		}
//		/**
//		 * 输出调试信息 
//		 * @param args
//		 *  
//		 */		
//		public static function trace(target:Object,arg0:Object,arg1:Object = null,arg2:Object = null):void
//		{
//			formatLog(Level.TRACE,target,arg0,arg1,arg2);
//		}
//		/**
//		 * 输出调试信息 
//		 * @param target:日志输出的源头
//		 * @param arg0:输出参数
//		 * @param arg1:输出参数
//		 * @param arg2:输出参数
//		 * 
//		 */				
//		public static function debug(target:Object,arg0:Object,arg1:Object = null,arg2:Object = null):void
//		{
//			formatLog(Level.DEBUG,target,arg0,arg1,arg2);
//		}
//		/**
//		 * 输出警告的信息
//		 * @param target:日志输出的源头
//		 * @param arg0:输出参数
//		 * @param arg1:输出参数
//		 * @param arg2:输出参数
//		 * 
//		 */	
//		public static function warn(target:Object,arg0:Object,arg1:Object = null,arg2:Object = null):void
//		{
//			formatLog(Level.WARN,target,arg0,arg1,arg2);
//		}
		/**
		 * 输出提示信息 
		 * @param msg
		 * 
		 */		
		public static function info(target:Object,arg0:Object,arg1:Object = null,arg2:Object = null):void
		{
			formatLog(Level.INFO,target,arg0,arg1,arg2);
		}
		/**
		 * 输出错误的信息
		 * @param	msg:需要输出信息的对象
		 */
		public static function error(target:Object,arg0:Object,arg1:Object = null,arg2:Object = null):void
		{
			formatLog(Level.ERROR,target,arg0,arg1,arg2);
		}
		/**
		 * 解析整个对象，遍历出该对象的所有信息 
		 * @param obj
		 * 
		 */		
		public static function parseObject(obj:Object):void
		{
			
		}
		private static function formatLog(logLevel:Level,target:Object,arg0:Object,arg1:Object,arg2:Object):void
		{
			if(level.level >= logLevel.level)
			{
				logFormat.setLevel(logLevel);
				logFormat.logFormat(target,arg0,arg1,arg2);
			}
		}
	}
}
