/**
 * @IUndoCmd.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-10-7
 */
package com.asframe.pattern.cmd
{
	/**
	 *
	 * @author sodaChen
	 * Date:2012-10-7
	 */
	public interface IUndoCmd extends ICmd
	{
		/**
		 * 撤销指令（刚执行过的execute方法操作的逻辑）
		 */		
		function undo():void;
	}
}
