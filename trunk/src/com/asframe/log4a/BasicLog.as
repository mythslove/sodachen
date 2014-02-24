/**
 * @BasicLogger.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-10-6
 */
package com.asframe.log4a
{
	/**
	 * 具备日志输出的实例(拥有ILog对象)
	 * @author sodaChen
	 * Date:2012-10-6
	 */
	public class BasicLog
	{
		protected var log:ILog;
		
		public function BasicLog()
		{
			log = LoggerFactory.getLog(this);
		}
	}
}
