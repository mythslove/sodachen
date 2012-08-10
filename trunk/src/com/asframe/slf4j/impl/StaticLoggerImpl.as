/**
 * @StaticLogger.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:RPGDemo
 * <br>Date:2012-6-12
 */
package com.asframe.slf4j.impl
{
	import com.asframe.slf4j.ILogger;
	import com.asframe.slf4j.IStaticLogger;
	import com.asframe.slf4j.Level;
	import com.asframe.utils.ClassUtils;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-6-12
	 */
	public class StaticLoggerImpl implements IStaticLogger
	{
		private var log:ILogger;
		public function StaticLoggerImpl()
		{
			log = new LoggerImpl();
			log.setLevel(Level.DEBUG);
		}
		
		public function isDebugEnabled():Boolean
		{
			return true;
		}
		
		public function isInfoEnabled():Boolean
		{
			return true;
		}
		
		public function isWarnEnabled():Boolean
		{
			return true;
		}
		
		public function isErrorEnabled():Boolean
		{
			return true;
		}
		
		public function debug(target:Object, arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			var cl:Class = ClassUtils.forInstance(target);
			log.setTargetClass(cl);
			log.debug(arg0,arg1,arg2);
		}
		
		public function warn(target:Object, arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			var cl:Class = ClassUtils.forInstance(target);
			log.setTargetClass(cl);
			log.warn(arg0,arg1,arg2);
		}
		
		public function info(target:Object, arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			var cl:Class = ClassUtils.forInstance(target);
			log.setTargetClass(cl);
			log.info(arg0,arg1,arg2);
		}
		
		public function error(target:Object, arg0:Object, arg1:Object=null, arg2:Object=null):void
		{
			var cl:Class = ClassUtils.forInstance(target);
			log.setTargetClass(cl);
			log.error(arg0,arg1,arg2);
		}
		
		public function parseObject(obj:Object):void
		{
		}
		private function formatLog(target:Object,arg0:Object,arg1:Object,arg2:Object):void
		{
			var cl:Class = ClassUtils.forInstance(target);
			log.setTargetClass(cl);
			log.debug(arg0,arg1,arg2);
		}
	}
}
