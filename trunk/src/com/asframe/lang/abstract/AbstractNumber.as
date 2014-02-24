/**
 * @AbstractNumber.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-12
 */
package com.asframe.lang.abstract
{
	/**
	 *
	 * @author sodaChen
	 * Date:2012-1-12
	 */
	public class AbstractNumber
	{
		protected var value:Number;
		
		public function AbstractNumber(value:Number = 0)
		{
			this.value = value;
		}
		public function setValue(value:Number):void
		{
			this.value = value;
		}
		
		public function intValue():int
		{
			return 0;
		}
		public function longValue():Number
		{
			return 0;
		}
		public function numberValue():Number
		{
			return 0;
		}
		public function doubleValue():Number
		{
			return 0;
		}
	}
}
