/**
 * @ILoggerFactory.as.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-10-28
 */
package com.asframe.slf4j
{
	/**
	 *
	 * @author sodaChen
	 * Date:2011-10-28
	 */
	public interface ILoggerFactory
	{
		/**
		 * 根据目标获取对应的日志输出对象 
		 * @param target
		 * @return 
		 * 
		 */		
		function getLogger(target:Object):ILogger;
	}
}
