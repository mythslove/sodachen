/**
 * @MultiKeyMap.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Collections
 * <br>Date:2012-1-19
 */
package com.asframe.collections.maps
{
	import com.asframe.collections.IIterator;
	
	/**
	 * 多个键值对应当单个值
	 * @author sodaChen
	 * @Date:2012-1-19
	 */
	public class MultiKeyMap extends HashMap
	{
		public override function put(key:*, value:*):void
		{
			var flag:Boolean = hasValue(value);
			super.put(key,value);
			if(flag)
			{
				changeSize(size() - 1);
			}
			
		}
		/**
		 * 重写HashMap的删除方法，做到删除一个，同时删除多个对应的key 
		 * @param key
		 * @return 
		 * 
		 */		
		public override function remove(key:*):*
		{
			var value:* = super.remove(key);
			var obj:Object = getContainer();
			//根据返回的value，继续删除value对应的key
			for(var oldKey:* in obj)
			{
				if(obj[oldKey] == value)
				{
					delete obj[oldKey];
				}
			}
			return value;
		}
	}
}
