/**
 * @LoggerFactory.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-10-27
 */
package com.asframe.slf4j
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.slf4j.impl.LoggerImpl;
	import com.asframe.utils.ClassUtils;

	/**
	 * 日志工厂
	 * @author sodaChen
	 * @Date:2011-10-27
	 */
	public class LoggerFactory
	{
		public static var level:Level = Level.DEBUG;
		/** 输出日志的集合,采用弱引用存放 **/
		private static var loggerMap:HashMap = new HashMap(true);
		/** 代理日志接口 **/
		private static var loggerClass:Class;
		
		/**
		 *
		 * 初始化静态类的Logger 
		 * @param loggerClass
		 * @param staticLogger:实现静态类处理日志的接口
		 * 
		 */		
		public static function initLoggerFactory(loggerClass:Class,staticLogger:IStaticLogger):void
		{
			LoggerFactory.loggerClass = loggerClass;
			Logger.logger = staticLogger;
		}
		public static function getLogger(targetClass:Class):ILogger
		{
			var logger:ILogger = null;
			if(loggerClass != null)
			{
				logger = loggerMap.get(targetClass);
				if(logger == null)
				{
					logger = new loggerClass();
					loggerMap.put(targetClass,logger);
				}
			}
			else
			{ 
				logger = new LoggerImpl();
				loggerMap.put(targetClass,logger);
			}
			logger.setLevel(level);
			logger.setTargetClass(targetClass);
			//设置相应的等级问题
			return logger;
		}
	}
}
