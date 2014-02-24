/**
 * @ILog.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2010-5-6
 */
package com.asframe.log4a
{
	import com.asframe.log4a.format.ILogFormat;

	/**
	 * 日志接口
	 * @author sodaChen
	 * Date:2010-5-6
	 */
	public interface ILog
	{
		/**
		 * 是否开启普通输出模式
		 * @return 
		 * 
		 */		
		function isTraceEnabled():Boolean;
		/**
		 * 是否开启调试输出 
		 * @return 
		 * 
		 */		
		function isDebugEnabled():Boolean;
		/**
		 * 是否开启信息输出 
		 * @return 
		 * 
		 */		
		function isInfoEnabled():Boolean;
		/**
		 * 是否开启警告信息输出 
		 * @return 
		 * 
		 */		
		function isWarnEnabled():Boolean;
		/**
		 * 是否开启错误信息输出 
		 * @return 
		 * 
		 */		
		function isErrorEnabled():Boolean;
		/**
		 * 初始化日志对象 
		 * @param level:等级
		 * @param logFormat:日志格式对象
		 * 
		 */				
		function initLog(level:Level,logFormat:ILogFormat):void;
		
		function setTargetClass(targetClass:Class):void;

		/**
		 * 输出调试信息
		 * @param	msg:需要输出信息的对象
		 */
		function debug(arg0:Object,arg1:Object = null,arg2:Object = null):void;
		/**
		 * 输出警告的信息
		 * @param	msg:需要输出信息的对象
		 */
		function warn(arg0:Object,arg1:Object = null,arg2:Object = null):void;
		/**
		 * 输出提示信息 
		 * @param msg
		 * 
		 */		
		function info(arg0:Object,arg1:Object = null,arg2:Object = null):void;
		/**
		 * 输出错误的信息
		 * @param	msg:需要输出信息的对象
		 */
		function error(arg0:Object,arg1:Object = null,arg2:Object = null):void;
		/**
		 * 解析整个对象，遍历出该对象的所有信息 
		 * @param obj
		 * 
		 */		
		function parseObject(obj:Object):void;
	}
}
