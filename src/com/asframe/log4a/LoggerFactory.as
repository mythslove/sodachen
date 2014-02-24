/**
 * @LoggerFactory.as.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-8-19
 */
package com.asframe.log4a
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.log4a.format.ArrayFormat;
	import com.asframe.log4a.format.ILogFormat;
	import com.asframe.log4a.format.IObjectFormat;
	import com.asframe.log4a.format.LogFormatImpl;
	import com.asframe.log4a.format.ObjectFormat;
	import com.asframe.log4a.impl.LogImpl;
	import com.asframe.log4a.impl.LogOutputImpl;
	import com.asframe.utils.ClassUtils;
	
	import flash.media.Camera;

	/**
	 * 日志工厂
	 * @author sodaChen
	 * Date:2011-8-19
	 */
	public final class LoggerFactory
	{
		private static var logMap:HashMap = new HashMap();
		
		private static var logOutput:ILogOutput = new LogOutputImpl();
		private static var arrayFormat:IObjectFormat = new ArrayFormat();
		private static var objectFormat:IObjectFormat = new ObjectFormat();
		public function LoggerFactory()
		{
		}
		public static function getDefaultFormat():ILogFormat
		{
			var logFormat:ILogFormat = new LogFormatImpl();
			logFormat.setLevel(Level.DEBUG);
			logFormat.setLogOutput(logOutput);
			//添加默认的处理方式
			logFormat.isShowTime(true);
			logFormat.addObjectFormat(arrayFormat);
			logFormat.addObjectFormat(objectFormat);
			return logFormat;
		}
		/**
		 * 获取log输出对象
		 * @param name
		 * @return 
		 * 
		 */		
		public static function getLog(obj:Object):ILog
		{
			var clazz:Class = null;
			if(obj is Class)
			{
				clazz = obj as Class;
			}
			else
			{
				clazz = ClassUtils.forInstance(obj);
			}
			return getLogByClass(clazz);
		}
		/**
		 * 获取log输出对象
		 * @param name
		 * @return 
		 * 
		 */		
		public static function getLogByClass(clazz:Class):ILog
		{
			var log:ILog = logMap.get(clazz);
			if(log == null)
			{
				log = new LogImpl(clazz);
				log.initLog(Level.DEBUG,getDefaultFormat());
			}
			return log;
		}
	}
}
