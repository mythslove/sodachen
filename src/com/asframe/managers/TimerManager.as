package com.asframe.managers
{
	import com.asframe.utils.FunctionUtils;
	
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;

	/**
	 * 计时器管理类 
	 * @author sodaChen
	 * 
	 */	
	public class TimerManager
	{
		private static var funcToTimerDic:Dictionary = new Dictionary();
		private static var timerDic:Dictionary = new Dictionary();
		private static var funcListDic:Dictionary = new Dictionary();
		private static var targetDic:Dictionary = new Dictionary();
		
		/**
		 * 延时指定时间调用函数(会一直循环调用，直到被删除)
		 * @param delay 延迟时间
		 * @param func 回调函数
		 * 
		 */		
		public static function addDelay(delay:int, 
										func:Function, 
										target:* = null) : void
		{
			if (funcToTimerDic[func] != null)
			{
				//此函数已存在，需先移除才能再添加
				throw new Error(FunctionUtils.getFuncName(func) + "已经添加过该函数，请先移除");
			}
			if(target != null)
			{
				targetDic[func] = target;
			}
			createTimer(delay);
			funcToTimerDic[func] = delay;
			funcListDic[delay].push(func);
		}
		
		/** 移除指定函数调用 */
		public static function removeDelay(func:Function) : void
		{
			if (funcToTimerDic[func] == null)
			{
				return;
			}
			
			var ttimer:Timer = null;
			var tdelay:int = funcToTimerDic[func];
			delete funcToTimerDic[func];
			//删除target
			delete targetDic[func];
			
			var tlist:Array = funcListDic[tdelay];
			while (tlist.indexOf(func) > -1){
				tlist.splice(tlist.indexOf(func), 1);
			}
			
			if(tlist.length == 0){
				ttimer = timerDic[tdelay] as Timer;
				ttimer.stop();
				ttimer.removeEventListener(TimerEvent.TIMER, timerHandler);
				
				delete funcListDic[tdelay];
				delete timerDic[tdelay];
			}
		}
		
		/** 时间监听处理函数 */
		protected static function timerHandler(event:TimerEvent) : void
		{
			var tlist:Array = funcListDic[Timer(event.target).delay];
			for each(var e:Function in tlist)
			{
				if(e.length == 1)
				{
					e(targetDic[e]);
				}
				else
				{
					e();
				}
			}
		}
		
		/** 创建Timer实例 */
		private static function createTimer(delay:int) : Timer
		{
			if(timerDic[delay] == null)
			{
				var ttimer:Timer = timerDic[delay] = new Timer(delay);
				ttimer.addEventListener(TimerEvent.TIMER, timerHandler);
				ttimer.start();
				if(funcListDic[delay] == null)
				{
					funcListDic[delay] = [];
				}
			}
			return timerDic[delay];
		}
	}
}