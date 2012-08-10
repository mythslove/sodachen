/**
 * @MapIterator.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Collections
 * <br>Date:2012-1-7
 */
package com.asframe.collections.maps
{
	import com.asframe.collections.AbstractIterator;
	import com.asframe.collections.IIterator;
	
	/**
	 * map迭代器
	 * @author sodaChen
	 * @Date:2012-1-7
	 */
	public class MapIterator extends AbstractIterator
	{
		private var map:IMap;
		public function MapIterator(map:IMap)
		{
			super(map.valuesToArray());
			this.map = map;
		}

	}
}
