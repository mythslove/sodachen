/**
 * @TickMock.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-6-20
 */
package com.asframe.tick
{
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-6-20
	 */
	public class TickMock implements ITick
	{
		public var count:int;
		public function TickMock()
		{
			count = 0;
		}
		
		public function tick():void
		{
			count++;
		}
	}
}
