/**
 * @ObjectLog.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Torchlight
 * <br>Date:2013-4-9
 */
package com.asframe.log4a
{
	/**
	 * 
	 * @author sodaChen
	 * data:2013-4-9
	 */
	public class ObjectLog
	{
		/** 日志对象 **/
		protected var log:ILog;
		
		public function ObjectLog()
		{
			log = LoggerFactory.getLog(this);
		}
	}
}
