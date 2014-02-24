/**
 * @LogImpl.as.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-9-4
 */
package com.asframe.log4a.impl
{
	import com.asframe.log4a.ILog;
	import com.asframe.log4a.Level;
	import com.asframe.log4a.format.ILogFormat;

	/**
	 * 日志输出对象的基础实现
	 * @author sodaChen
	 * Date:2011-9-4
	 */
	public class LogImpl implements ILog
	{
		protected var targetClass		:Class;
		/** 默认是开启调试模式的 **/
		protected var level			:Level;
		protected var logFormat		:ILogFormat;

		
		public function LogImpl(targetClass:Class)
		{
			this.targetClass = targetClass;
		}
		public function setTargetClass(targetClass:Class):void
		{
			this.targetClass = targetClass;
		}
		/**
		 * 是否开启普通输出模式
		 * @return 
		 * 
		 */		
		public function isTraceEnabled():Boolean
		{
			return level.level >= Level.TRACE.level;
		}
		/**
		 * 是否开启调试输出 
		 * @return 
		 * 
		 */		
		public function isDebugEnabled():Boolean
		{
			return level.level >= Level.DEBUG.level;
		}
		/**
		 * 是否开启信息输出 
		 * @return 
		 * 
		 */		
		public function isInfoEnabled():Boolean
		{
			return level.level >= Level.INFO.level;
		}
		/**
		 * 是否开启警告信息输出 
		 * @return 
		 * 
		 */		
		public function isWarnEnabled():Boolean
		{
			return level.level >= Level.WARN.level;
		}
		/**
		 * 是否开启错误信息输出 
		 * @return 
		 * 
		 */		
		public function isErrorEnabled():Boolean
		{
			return level.level >= Level.ERROR.level;
		}
		/**
		 * 初始化日志对象 
		 * @param level:等级
		 * @param logFormat:日志格式对象
		 * 
		 */				
		public function initLog(level:Level,logFormat:ILogFormat):void
		{
			this.level = level;
			this.logFormat = logFormat;
			logFormat.setLevel(level);
			logFormat.setTarget(targetClass);
		}
		
		public function debug(arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			traceMsg(Level.DEBUG,arg0,arg1,arg2);
		}
		
		public function warn(arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			traceMsg(Level.WARN,arg0,arg1,arg2);
		}
		
		public function info(arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			traceMsg(Level.INFO,arg0,arg1,arg2);
		}
		
		public function error(arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			traceMsg(Level.ERROR,arg0,arg1,arg2);
		}
		/**
		 * 解析整个对象，遍历出该对象的所有信息 
		 * @param obj
		 * 
		 */		
		public function parseObject(obj:Object):void
		{
			
		}
		
		private function traceMsg(currentLevel:Level,arg0:Object,arg1:Object,arg2:Object):void
		{
			if(currentLevel.level >= level.level)
			{
				logFormat.logFormat(arg0,arg1,arg2);
			}
		}
	}
}
