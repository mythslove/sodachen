/**
 * @LoggerImpl.as.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-10-25
 */
package com.asframe.slf4j.impl
{
	import com.asframe.slf4j.ILogger;
	import com.asframe.slf4j.Level;
	import com.asframe.utils.ClassUtils;
	import com.asframe.utils.FormatTool;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2011-10-25
	 */
	public class LoggerImpl implements ILogger
	{
		protected var targetFullName:String;
		protected var level:Level;
		protected var msg:String;
		
		public function LoggerImpl()
		{
		}
		
		public function setLevel(level:Level):void
		{
			this.level = level;
		}
		public function isTraceEnabled():Boolean
		{
			return false;
		}
		
		public function isDebugEnabled():Boolean
		{
			return false;
		}
		
		public function isInfoEnabled():Boolean
		{
			return false;
		}
		
		public function isWarnEnabled():Boolean
		{
			return false;
		}
		
		public function isErrorEnabled():Boolean
		{
			return false;
		}
		
		public function setTargetClass(targetClass:Class):void
		{
			targetFullName = ClassUtils.getFullyQualifiedName(targetClass);
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
		
		public function parseObject(obj:Object):void
		{
		}
		private function traceMsg(traceLevel:Level,arg0:Object, arg1:Object, arg2:Object):void
		{
			if(level.level <= traceLevel.level)
			{
				msg = "[" + traceLevel.name + "][" + FormatTool.getEmailTime() + "]"
				if(targetFullName != null)
				{
					msg += "-[" + targetFullName +  "]:\n";
				}
				msg += toObj(arg0);
				if(arg1 != null)
				{
					msg += toObj(arg1);
				}
				if(arg2 != null)
				{
					msg += toObj(arg2);
				}
				trace(msg + "\n");
			}
		}
		
		private function toObj(obj:Object):String
		{
			if(obj is Error)
			{
				return Error(obj).getStackTrace();
			}
			return obj.toString();
		}
	}
}
