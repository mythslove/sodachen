/**
 * @CompareObject.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-4-13
 */
package com.asframe.lang.impl
{
	import com.asframe.lang.IComparable;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2012-4-13
	 */
	public class CompareObject implements IComparable
	{
		public var order:int;
		
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
