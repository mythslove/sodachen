/**
 * @Log4aStaticLogger.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-10-26
 */
package com.asframe.slf4j.log4a
{
	import com.asframe.log4a.Logger;
	import com.asframe.slf4j.ILogger;
	import com.asframe.slf4j.IStaticLogger;
	import com.asframe.slf4j.Level;
	
	/**
	 * log4实现了静态Logger的处理（代理类）
	 * @author sodaChen
	 * @Date:2011-10-26
	 */
	public class Log4aStaticLogger implements IStaticLogger
	{
		public function isTraceEnabled():Boolean
		{
			return Logger.isTraceEnabled();
		}
		public function setLevel(level:Level):void
		{
			
		}
		public function setTargetClass(targetClass:Class):void
		{
			
		}
		public function isDebugEnabled():Boolean
		{
			return Logger.isDebugEnabled();
		}
		
		public function isInfoEnabled():Boolean
		{
			return Logger.isInfoEnabled();
		}
		
		public function isWarnEnabled():Boolean
		{
			return Logger.isWarnEnabled();
		}
		
		public function isErrorEnabled():Boolean
		{
			return Logger.isErrorEnabled();
		}
		
		public function debug(target:Object, arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			Logger.debug(target,arg0,arg1,arg2);
		}
		
		public function warn(target:Object, arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			Logger.warn(target,arg0,arg1,arg2);
		}
		
		public function info(target:Object, arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			Logger.info(target,arg0,arg1,arg2);
		}
		
		public function error(target:Object, arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			Logger.error(target,arg0,arg1,arg2);
		}
		
		public function parseObject(obj:Object):void
		{
			Logger.parseObject(obj);
		}
	}
}
