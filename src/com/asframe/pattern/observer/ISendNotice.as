/**
 * @ISendNotice.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-4-12
 */
package com.asframe.pattern.observer
{
	/**
	 * 发送一个通知的接口
	 * @author sodaChen
	 * Date:2012-4-12
	 */
	public interface ISendNotice
	{
		/**
		 * 发送一个通知 
		 * @param notice 通知对象
		 * @param args 不定参数
		 * 
		 */		
		function sendNotice(notice:*,...args):void;
	}
}
