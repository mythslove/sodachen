/**
 * @ICmd.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-19
 */
package com.asframe.pattern.cmd
{
	/**
	 *
	 * @author sodaChen
	 * Date:2012-1-19
	 */
	public interface ICmd
	{
		/**
		 * 执行接口 
		 * @param data
		 * 
		 */		
		function execute(data:* = null):void;
	}
}
