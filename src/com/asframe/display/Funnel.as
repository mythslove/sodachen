package com.asframe.display 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osmf.events.TimeEvent;

	//
	public class Funnel extends CDLoadingMc
	{
		private var timer_t:Timer=new Timer(100);//每100毫秒更新一次
		private var count:uint=0;
		private var addRate:Number=0.1;//增加率
		//
		public function Funnel(width:Number=50,height:Number=50)
		{
			super(width,height)
			this.timer=1000;
			this.listener();
		}
		private function init():void
		{
			
		}
		private function listener():void
		{
			this.timer_t.addEventListener(TimerEvent.TIMER,startTimer);
		}
		public function set timer(val:uint):void
		{
			this.timer_t.reset();
			this.timer_t.stop();
			this.value=0;
			this.count=val/this.timer_t.delay;
			this.addRate=100/this.count;
			
		}
		public function get timed():uint
		{
			return 100-this.count;
		}
		private function startTimer(e:TimerEvent):void 
		{
			this.value +=this.addRate;
			this.count--;
			this.dispatchEvent(new TimerEvent(TimerEvent.TIMER));;
			if(this.count==0)
			{
				this.setRunTimer=false;
				this.dispatchEvent(new TimerEvent(TimerEvent.TIMER_COMPLETE))
			}
		}
		public function clearAll():void 
		{
			this.setRunTimer=false;
			this.value=0;
		}
		public function set setRunTimer(bln:Boolean):void 
		{
			if (bln) {
				if (this.count>0) 
				{
					this.timer_t.start();
				}
			} else {
				this.timer_t.reset();
				this.timer_t.stop();
			}
		}
	}
	
}