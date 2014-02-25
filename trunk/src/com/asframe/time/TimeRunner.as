/**
 * @TimeRuner.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:SimpleLion1.5
 * <br>Date:2013-5-17
 */
package com.asframe.time
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * 时间片段处理对象，这里是每帧会处理的对象
	 * @author sodaChen
	 * #Date:2013-5-17
	 */
	public class TimeRunner
	{
		private static var timer:Timer;
		private static var funList:Vector.<TimerModel>;
		
		public static function initRunner(frameRate:int):void
		{
			if(timer == null)
			{
				timer = new Timer(1000 / frameRate);
				timer.addEventListener(TimerEvent.TIMER,onTimer);
				funList = new Vector.<TimerModel>();
			}
		}
		public static function addFunction(fun:Function,...args):void
		{
			funList.push(new TimerModel(fun,args));
		}
		public static function start():void
		{
			if(!timer.running)
			{
				timer.reset();
				timer.start();
			}
		}
		private static function onTimer(event:TimerEvent):void
		{
			if(funList.length == 0)
			{
				timer.stop();
				return ;
			}
			var timeModel:TimerModel = funList.shift();
			if(timeModel.args.length > 0)
			{
				timeModel.fun.apply(null,timeModel.args);
			}
			else
			{
				timeModel.fun();
			}
		}
	}
}
class TimerModel
{
	public var args:Array;
	public var fun:Function;
	public function TimerModel(fun:Function,args:Array)
	{
		this.fun = fun;
		this.args = args;
	}
}
