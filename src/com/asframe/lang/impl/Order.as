/**
 * @Order.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-4-12
 */
package com.asframe.lang.impl
{
	import com.asframe.lang.IOrdered;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-4-12
	 */
	public class Order implements IOrdered
	{
		protected var _order:int;
		
		public function Order()
		{
		}
		
		public function get order():int
		{
			return _order;
		}
		
		public function set order(value:int):void
		{
			this._order = value;
		}
	}
}
