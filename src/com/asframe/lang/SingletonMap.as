/**
 * @SingletonMap.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-10-29
 */
package com.asframe.lang
{
	import com.asframe.collections.maps.HashMap;
	
	import flash.errors.IllegalOperationError;

	/**
	 * 单例的集合
	 * @author sodaChen
	 * Date:2012-10-29
	 */
	public class SingletonMap
	{
		protected static var singletonMap:HashMap = new HashMap();
		
		
		public function addSingleton(name:String,singleton:*):void
		{
			if(singletonMap.hasKey(name))
			{
				throw new IllegalOperationError(singleton + "是单例对象，不能进行多次实例化");
			}
			singletonMap.put(name,singleton);
		}
		public function removeSingleton(name:String):*
		{
			return singletonMap.remove(name);
		}
		public function getSingleton(name:String):*
		{
			var instane:* = singletonMap.get(name);
			if(instane == null)
			{
				throw new IllegalOperationError(name + "单例的实例不存在，请加添"); 
			}
			return instane;
		}
	}
}
