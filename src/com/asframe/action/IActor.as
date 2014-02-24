/**
 * @IActor.as
 * @author soda.C
 * @version  1.0
 * <br>Copyright (C), 2008 soda.C
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Core
 * @data 2008-6-15
 */
package com.asframe.action
{
	/**
	 * 动作执行者接口，只有实现了该接口的类，才能执行Action
	 * 
	 * @author soda.C
	 */  
	public interface IActor
	{
		/**
		 * 执行动作action，返回是否成功启动动作。
		 * action被阻碍因而不能被执行则返回false。
		 * @param	action:需要执行的动作实例
		 */
		function act(action:IAction):Boolean;
	}
}
