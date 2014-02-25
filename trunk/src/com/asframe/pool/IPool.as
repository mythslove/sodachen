/**
 * @IPool.as.as
 * 
 * @author sodaChen mail:asframe#qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Pool
 * <br>Date:2013-3-31
 */
package com.asframe.pool
{
	import com.asframe.lang.IDestory;

	/**
	 * 池接口
	 * @author sodaChen
	 * Date:2013-3-31
	 */
	public interface IPool extends IDestory
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