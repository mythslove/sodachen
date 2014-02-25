/**
 * @Tick.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-11-9
 */
package com.asframe.tick
{
	import com.asframe.collections.maps.HashMap;
	
	import flash.display.Shape;
	import flash.events.Event;
	import flash.utils.Dictionary;

	/**
	 * 心跳对象，当添加了心跳 函数之后，会根据帧频进行有规律地跳动，直接容器不再有需要执行的函数。
	 * 自带了Timer功能，具备指定时间间隔和次数地进行执行回调函数。
	 * Date:2013-11-9
	 */
	public class Tick
	{
		/** 帧频率 **/
		public static var frameRate:int = 60;
		/** 心跳机制的动力机 **/
		private static var power:Shape = new Shape();
		/** 心跳集合 **/
		private static var tickMap:HashMap = new HashMap();
		private static var tickDic:Dictionary = tickMap.getContainer();
		
		/** Timer类型的心跳集合 **/
		private static var timerCallMap:HashMap = new HashMap();
		private static var timerCallDic:Dictionary = timerCallMap.getContainer();

		/**
		 * 添加心跳函数 
		 * @param fun
		 * 
		 */		
		public static function addFun(fun:Function):void
		{
			tickMap.put(fun,fun);
			if(tickMap.length == 1)
			{
				power.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			}
		}
		/**
		 * 删除心跳函数
		 * @param fun
		 * 
		 */		
		public static function removeFun(fun:Function):void
		{
			tickMap.remove(fun);
			if(tickMap.length == 0)
			{
				power.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			}
		}
		/**
		 * 添加实现ITick接口的实例进行心跳 
		 * @param tick
		 * 
		 */		
		public static function addTick(tick:ITick):void
		{
			addFun(tick.tick);
		}
		/**
		 * 删除ITick的心跳事件
		 * @param tick
		 * 
		 */		
		public static function removeTick(tick:ITick):void
		{
			removeFun(tick.tick);
		}
		/**
		 * 添加Timer功能的处理方式 
		 * @param delay 时间间隔(毫秒)
		 * @param repeat 重复次数。默认是1，当小于0时，为无限次
		 * @param callback 回调函数
		 * @param param 参数，会通过callback传递回去
		 * 
		 */		
		public static function addTimer(delay:int, callback:Function,repeat:int = 1,param:* = null):void
		{
			//把毫秒转换成次数。
//			timerCallMap.put(callback,new TimeItem(delay / (1000 / frameRate), repeat, callback, param));
			timerCallMap.put(callback,new TimeItem(delay / frameRate, repeat, callback, param));
			if(timerCallMap.length == 1)
			{
				addFun(onTimerEnter);
			}
		}
		/**
		 * 移除Timer 
		 * @param callBack
		 * 
		 */		
		public static function removeTimer(callBack:Function):void
		{
			timerCallMap.remove(callBack);
			if(timerCallMap.length == 0)
			{
				removeFun(onTimerEnter);
			}
		}
		private static function onEnterFrame(event:Event):void
		{
			for each (var fun:Function in tickDic)
			{
				fun();
			}
		}
		private static function onTimerEnter():void
		{
			for each (var timeItem:TimeItem in timerCallDic)
			{
				timeItem.counter--;
				if (timeItem.counter < 1)
				{
					timeItem.counter = timeItem.delay;
					if(timeItem.param == null)
					{
						timeItem.callback();
					}
					else
					{
						timeItem.callback(timeItem.param);
					}
					
					if (timeItem.repeat > 0)
					{
						timeItem.repeat --;
						if (timeItem.repeat <= 0)
						{
							removeTimer(timeItem.callback);
						}
					}
				}
			}
		}
	}
}
class TimeItem
{
	public var delay:int;
	public var counter:int;
	public var repeat:int;
	public var callback:Function;
	public var param:*;
	
	public function TimeItem(delay:int, repeat:int, callback:Function, param:* = null)
	{
		this.delay = delay;
		this.counter = delay;
		this.repeat = repeat;
		this.callback = callback;
		this.param = param;
	}
}
