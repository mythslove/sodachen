/**
 * @TimerExecuter.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-6-20
 */
package com.asframe.tick.executer
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * 基于Timer的心跳执行器
	 * @author sodaChen
	 * @Date:2012-6-20
	 */
	public class TimerExecuter extends TickExecuter
	{
		/** 计时器 **/
		private var timer:Timer;
		/** 执行时间 **/
		private var runTime:int;
		/**
		 *  构造器
		 * @param tickRate 心跳频率(帧数,一秒钟执行的次数)
		 */		
		public function TimerExecuter(tickRate:int)
		{
			super();
			this.tickRate = tickRate;
		}
		
		public override function setTickRate(tickRate:int=30):void
		{
			this.tickRate = tickRate;
			runTime = 1000 / 30;
		}
		
		public override function start():void
		{
			timer = new Timer(runTime);
			timer.addEventListener(TimerEvent.TIMER,onTicks);
			timer.start();
			onTicks(null);
		}
		
		public override function stop():void
		{
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER,onTicks);
		}
		
		public override function pause():void
		{
			timer.stop();
		}
		
		public override function reset():void
		{
			timer.reset();
			timer.start();
		}
		
		public override function clear():void
		{
			super.clear();
			stop();
			timer = null;
		}
	}
}
