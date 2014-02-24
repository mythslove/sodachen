/**
 * @ActionConst.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Tercel3D
 * <br>Date:2012-12-3
 */
package com.asframe.action
{
	/**
	 *
	 * @author sodaChen
	 * #Date:2012-12-3
	 */
	public class ActionConsts
	{
		////////////////////动作类型////////////////////
		/** 队列动作代理动作 */
		public static const QUEUE:String = "queue";
		/** 普通正常类型,可以多个动作同时存在 **/
		public static const REPEAT:String = "repeat";
		/** 该类型动作只允许队列里只存在一个动作 **/
		public static const ALONE:String = "alone";
	}
}
