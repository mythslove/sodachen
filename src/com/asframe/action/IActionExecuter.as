/**
 * @IActionExecuter.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame GameEngine
 * <br>Date:2012-10-13
 */
package com.asframe.action
{
	import com.asframe.tick.ITick;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-10-14
	 */
	public interface IActionExecuter extends ITick
	{
		function getAction(actionName:String):IAction;
		/**
		 * 根据Action的名称删除一个action
		 * @param actionName:action名称
		 * @return 返回IAction实例，如果没有则返回null
		 */
		function removAction(actionName:String,isDispose:Boolean = true):void
		function setActor(actor:IActor):void;
		function actAction(action:IAction):Boolean;
		function clearActions():void;
	}
}
