/**
 * @IDestory.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-8-2
 */
package com.asframe.lang
{
	/**
	 *
	 * @author sodaChen
	 * #Date:2013-8-2
	 */
	public interface IDestory
	{
		/**
		 * 释放对象相关资源 
		 * @param o:释放时需要的参数（不是必须的）
		 * 
		 */		
		function destroy(o:* = null):void;
	}
}
