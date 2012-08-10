/**
 * @MultiValueMap.as
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
	import com.asframe.collections.lists.ArrayList;
	import com.asframe.collections.sets.HashSet;
	import com.asframe.collections.sets.ISet;

	/**
	 *
	 * @author sodaChen
	 * @Date:2012-1-19
	 */
	public class MultiValueMap extends HashMap
	{
		public function MultiValueMap()
		{
			super();
		}
		public override function put(key:*, value:*):void
		{
			var set:ISet = get(key) as ISet;
			if(set == null)
			{
				set = new HashSet();
				super.put(key,set);
			}
			set.add(value);
		}
	}
}
