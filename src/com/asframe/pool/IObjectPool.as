/**
 * @IObjectPool.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Pool
 * <br>Date:2012-1-15
 */
package com.asframe.pool
{
	import com.asframe.lang.IDestory;

	/**
	 * 对象池接口，该接口可以用来存放任意对象的对象池接口
	 * @author sodaChen
	 * 
	 */	
	public interface IObjectPool extends IDestory
	{
		/**
		 * 借出一个对象 
		 * @return 
		 * 
		 */		
		function borrowObject():*;
		
		/**
		 * 归还对象 
		 * @param obj
		 * 
		 */
		function returnObject(obj:*):void
		
		/**
		 * 添加一个对象 
		 * 
		 */		
		function addObject():void;
		
		/**
		 * 返回池里的可用对象 
		 * @return 
		 * 
		 */		
		function getNumIdle() :int;
		
		/**
		 * 清除池里的所有对象，恢复成最初状态 
		 */		
		function clear() :void;
	}
}
