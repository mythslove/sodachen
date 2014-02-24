/**
 * @ISimpleDispatcher.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-7-20
 */
package com.asframe.events
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	/**
	 * 对原生的事件派发器进行简化，同时又兼容原来的体系
	 * @author sodaChen
	 * Date:2012-7-20
	 */
	public interface ISimpleDispatcher
	{
		function addEventListener(type:String, listener:Function):void;
		
		function removeEventListener(type:String, listener:Function):void;
		
		function removeEventListeners(type:String=null):void;
		
		function dispatchEvent(event:Event):void;
		
		function hasEventListener(type:String):Boolean;
	}
}
