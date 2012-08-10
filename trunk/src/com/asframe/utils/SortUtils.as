/**
 * @SortUtils.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-4-12
 */
package com.asframe.utils
{
	import com.asframe.collections.lists.IList;
	import com.asframe.lang.IComparable;

	/**
	 * 排序工具
	 * @author sodaChen
	 * @Date:2012-4-12
	 */
	public class SortUtils
	{
		public static function compareByList(list:IList,isMin:Boolean = true):void
		{
			var len:int = list.size();
			var comparte1:IComparable = null;
			var comparte2:IComparable = null;
			for (var i:int = 0; i < len; i++) 
			{
				comparte1 = list.get(i);
				for (var j:int = i + 1; j < len; j++) 
				{
					comparte2 = list.get(j);
					if(isMin && comparte1.compareTo(comparte2) > 0 || !isMin && comparte1.compareTo(comparte2) < 0)
					{
						if(comparte1.compareTo(comparte2) > 0)
						{
							list.set(i,comparte2);
							list.set(j,comparte1);
						}
					}
				}
			}
		}
		public static function compareByArray(list:Array,isMin:Boolean = true):void
		{
			var len:int = list.length;
			var comparte1:IComparable = null;
			var comparte2:IComparable = null;
			for (var i:int = 0; i < len; i++) 
			{
				comparte1 = list[i];
				for (var j:int = i + 1; j < len; j++) 
				{
					comparte2 = list[j];
					if(isMin && comparte1.compareTo(comparte2) > 0 || !isMin && comparte1.compareTo(comparte2) < 0)
					{
						if(comparte1.compareTo(comparte2) > 0)
						{
							list[i] = comparte2;
							list[j] = comparte1;
						}
					}
				}
			}
		}
	}
}
