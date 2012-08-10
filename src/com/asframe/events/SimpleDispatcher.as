/**
 * @SimpleDispatcher.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-7-20
 */
package com.asframe.events
{
	
	import flash.events.Event;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-7-20
	 */
	public class SimpleDispatcher implements ISimpleDispatcher
	{
		public function SimpleDispatcher()
		{
		}
		
		public function addEventListener(type:String, listener:Function):void
		{
		}
		
		public function removeEventListener(type:String, listener:Function):void
		{
		}
		
		public function removeEventListeners(type:String=null):void
		{
		}
		
		public function dispatchEvent(event:Event):void
		{
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return false;
		}
	}
}
