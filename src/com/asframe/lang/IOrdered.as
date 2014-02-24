/**
 * @IOrdered.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-4-12
 */
package com.asframe.lang
{
	/**
	 *
	 * @author sodaChen
	 * Date:2012-4-12
	 */
	public interface IOrdered
	{
		/**
		 * Return the order value of this object, with a higher value meaning greater in terms of sorting.
		 * <p>Normally starting with 0 or 1. Same order values will result in arbitrary positions for the affected objects.</p>
		 * <p>Higher value can be interpreted as lower priority, consequently the first object has highest priority.</p>
		 * <p>Note that order values below 0 are reserved for framework purposes. Application-specified values should always be 0 or greater, with only framework components (internal or third-party) supposed to use lower values.</p>
		 */
		function get order():int;
		
		/**
		 * @private
		 */
		function set order(value:int):void;
	}
}
