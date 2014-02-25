/**
 * @IResSharing.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Lion3D
 * <br>Date:2013-8-27
 */
package com.asframe.res
{
	

	/**
	 * 资源共享管理器接口
	 * @author sodaChen
	 * #Date:2013-8-27
	 */
	public interface IResSharing
	{
		function setResShareHandle(resShareHandle:IResShareHandle):void
		/**
		 * 加载资源 
		 * @param url 路径
		 * @param complete 成功回调函数
		 * @param target 目标参数，通过complete回调回来
		 * @param error 失败函数
		 * @param level 优先级 -1为直接加载，0为最低。越高越优先加载
		 * 
		 */		
		function load(url:String,
						complete:Function = null,
						target:* = null,
						error:Function = null,
						level:int = 0):void;
		/**
		 * 卸载掉还没加载完成的资源 
		 * @param url 资源路径
		 * @param complete 成功回调函数
		 */	
		function unLoad(url:String,complete:Function):void;
		/**
		 * 取消资源的引用(对象不使用该资源时传入这里进行自动回收) 
		 * @param urlOrTarget
		 */		
		function unResRefer(urlOrTarget:*,isDestroy:Boolean = false):void;
	}
}
