/**
 * @EnterFrameExecuter.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASframe Tick
 * <br>Date:2012-6-11
 */
package com.asframe.tick.executer
{
	import flash.display.DisplayObject;
	import flash.events.Event;

	/**
	 * 利用显示对象每一帧事件实现心跳
	 * @author sodaChen
	 * @Date:2012-6-11
	 */
	public class EnterFrameExecuter extends TickExecuter
	{
		private var root:DisplayObject;
		
		public function EnterFrameExecuter(root:DisplayObject = null)
		{
			super();
			this.root = root;
		}
		
		public override function start():void
		{
			root.addEventListener(Event.ENTER_FRAME,onTicks);
			onTicks(null);
		}
		
		public override function stop():void
		{
			root.removeEventListener(Event.ENTER_FRAME,onTicks);
		}
		
		public override function pause():void
		{
			stop();
		}
		
		public override function reset():void
		{
			start();
		}
		
		public override function clear():void
		{
			super.clear();
			stop();
			root = null;
		}
	}
}
