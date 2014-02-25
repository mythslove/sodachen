/**
 * @Logger.as.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-8-12
 */
package com.asframe.slf4j
{
	import com.asframe.slf4j.impl.StaticLoggerImpl;

	/**
	 * 采用转换接口的模式来实现，分两种，纯接口和静态处理，
	 * @author sodaChen
	 * Date:2011-8-12
	 */
	public class Logger
	{
		public static var logger						:IStaticLogger = new StaticLoggerImpl();
//		public static var logger						:ILogger;
		
//		/**
//		 * 是否开启普通输出模式
//		 * @return 
//		 * 
//		 */		
//		public static function isTraceEnabled():Boolean
//		{
//			return logger.isTraceEnabled();
//		}
		/**
		 * 是否开启调试输出 
		 * @return 
		 * 
		 */		
		public static function isDebugEnabled():Boolean
		{
			return logger.isDebugEnabled();
		}
		/**
		 * 是否开启信息输出 
		 * @return 
		 * 
		 */		
		public static function isInfoEnabled():Boolean
		{
			return logger.isInfoEnabled();
		}
		/**
		 * 是否开启警告信息输出 
		 * @return 
		 * 
		 */		
		public static function isWarnEnabled():Boolean
		{
			return logger.isWarnEnabled();
		}
		/**
		 * 是否开启错误信息输出 
		 * @return 
		 * 
		 */		
		public static function isErrorEnabled():Boolean
		{
			return logger.isErrorEnabled();
		}
		/**
		 * 输出调试信息 
		 * @param args
		 * 
		 */		
		public static function debug(target:Object,arg0:Object,arg1:Object = null,arg2:Object = null):void
		{
			logger.debug(target,arg0,arg1,arg2);
		}
		/**
		 * 输出警告的信息
		 * @param	msg:需要输出信息的对象
		 */
		public static function warn(target:Object,arg0:Object,arg1:Object = null,arg2:Object = null):void
		{
			logger.warn(target,arg0,arg1,arg2);
		}
		/**
		 * 输出提示信息 
		 * @param msg
		 * 
		 */		
		public static function info(target:Object,arg0:Object,arg1:Object = null,arg2:Object = null):void
		{
			logger.info(target,arg0,arg1,arg2);
		}
		/**
		 * 输出错误的信息
		 * @param	msg:需要输出信息的对象
		 */
		public static function error(target:Object,arg0:Object,arg1:Object = null,arg2:Object = null):void
		{
			logger.error(target,arg0,arg1,arg2);
		}
		/**
		 * 解析整个对象，遍历出该对象的所有信息 
		 * @param obj
		 * 
		 */
		public static function parseObject(obj:Object):void
		{
			logger.parseObject(obj);
		}
	}
}
