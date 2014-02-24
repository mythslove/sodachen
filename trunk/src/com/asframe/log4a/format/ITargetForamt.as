/**
 * @ITargetForamt.as.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-9-10
 */
package com.asframe.log4a.format
{
	/**
	 * 目标处理格式
	 * @author sodaChen
	 * Date:2011-9-10
	 */
	public interface ITargetForamt
	{
		/**
		 * 对目标进行格式处理 
		 * @return 
		 * 
		 */		
		function toTargetForamt(target:Object):String;
	}
}
