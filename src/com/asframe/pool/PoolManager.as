/**
 * @PoolManager.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-6-20
 */
package com.asframe.pool
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.utils.ClassUtils;

	/**
	 * 对象池管理器
	 * @author sodaChen
	 * #Date:2013-6-20
	 */
	public class PoolManager
	{
		private static var pools:HashMap = new HashMap();
		
		/** 默认一个对象池的最大空闲对象是数量 **/
		public static var defaultMax:int = 300; 
		
		private static var tempPool:Pool;
		
		public static function setMaxIdle(clazz:Class,maxIdle:int):void
		{
			getPool(clazz);
			tempPool.maxIdle = maxIdle;
		}
		public static function borrowObject(clazz:Class):*
		{
			return new clazz();
			getPool(clazz);
			return tempPool.borrowObject();
		}
		public static function returnObject(obj:*,clazz:Class = null):void
		{
			return ;
			if(clazz == null)
			{
				clazz = ClassUtils.forInstance(obj);
			}
			getPool(clazz);
			tempPool.returnObject(obj);
		}
		public static function getPool(clazz:Class):void
		{
			tempPool = pools.get(clazz);
			if(tempPool == null)
			{
				tempPool = new Pool();
				tempPool.objClass = clazz;
				tempPool.maxIdle = defaultMax;
				pools.put(clazz,tempPool);
			}
		}
	}
}
