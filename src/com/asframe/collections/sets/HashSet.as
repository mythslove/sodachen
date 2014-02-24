/**
 * @HashSet.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Collections
 * <br>Date:2012-1-19
 */
package com.asframe.collections.sets
{
	import com.asframe.collections.IIterator;
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2012-1-19
	 */
	public class HashSet implements ISet
	{
		private static const VALUE:Object = new Object();
		private var map:IMap;
		
		public function HashSet()
		{
			map = new HashMap();
		}
		
		public function add(o:*):Boolean
		{
			if(map.hasKey(o))
			{
				return false;
			}
			map.put(o,VALUE);
			return true;
		}
		
		public function clear():void
		{
			map.clear();
		}
		
		public function has(o:*):Boolean
		{
			return map.hasKey(o);
		}
		
		public function isEmpty():Boolean
		{
			return map.isEmpty();
		}
		
		public function remove(o:*):Boolean
		{
			return map.remove(o);
		}
		
		public function toArray():Array
		{
			return map.keysToArray();
		}
		
		public function size():int
		{
			return map.size();
		}
		
		public function iterator():IIterator
		{
			return map.keyIterator();
		}
	}
}
