/**
 * @ASFEventDispatcher.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Lion3D
 * <br>Date:2013-9-17
 */
package com.asframe.events
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 *
	 * @author sodaChen
	 * #Date:2013-9-17
	 */
	public class ASFEventDispatcher extends EventDispatcher
	{
		public function ASFEventDispatcher(target:IEventDispatcher=null)
		{
			super(target);
		}
		public override function dispatchEvent(event:Event):Boolean
		{
			if(hasEventListener(event.type))
			{
				return super.dispatchEvent(event);
			}
			return false;
		}
	}
}
