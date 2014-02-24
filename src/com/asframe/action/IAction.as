/**
 * @IAction.as
 * @author soda.C 	E-mail:asframe@qq.com
 * @version  1.0
 * <br>Copyright (C), 2008 soda.C
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Core
 * @data 2008-6-15
 */
package com.asframe.action
{
	import com.asframe.lang.IDisposable;
	import com.asframe.tick.ITick;

	/**
	 * 动作接口，在应用所有关于动作的都是该接口的实现类
	 * 
	 * @author soda.C
	 */  
	public interface IAction extends ITick,IDisposable
	{
		/**
		 * 开始执行该动作,绑定动作执行者，每个动作只能绑定一个动作执行者
		 * 
		 * @param actor:动作执行者(IActor接口实现类)
		 */  
		function start(actor:IActor):void;
		/**
		 * 是否已经结束了.当返回true时，该Moment会被自动销毁
		 * 
		 * @return 返回一个逻辑值
		 */
		function isFinish():Boolean;
		
		/**
		 * 尝试用action动作替换自己。替换成功则返回true，replaceType参数默认是直接替换，
		 * 此时自己将被移除执行列表，action被加入执行列表。在这过程中有可能是发生临时替换，返回结果也是
		 * 
		 * @param action:动作接口
		 * @return 返回成功与否的逻辑值
		 */
		function replace(action:IAction):Boolean;
		
		/**
		 * 返回动作基本类型
		 * @see ActionConstants
		 */
		function getType():String;
		/**
		 * @return 返回动作名称
		 * @see ActionConstants
		 */
		function getName():String;

	}
}
