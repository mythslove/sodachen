/**
 * @CompareOrder.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Lang
 * <br>Date:2012-4-12
 */
package com.asframe.lang.impl
{
	import com.asframe.lang.IComparable;
	import com.asframe.lang.IOrdered;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2012-4-12
	 */
	public class CompareOrder extends Order implements IComparable
	{
		public function compareTo(other:Object):int
		{
			if(order < other.order)
			{
				return 1;
			}
			else if(order == other.order)
			{
				return 0;
			}
			return -1;
		}
	}
}
