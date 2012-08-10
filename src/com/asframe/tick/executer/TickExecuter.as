/**
 * @TickExecuter.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-5-4
 */
package com.asframe.tick.executer
{
	
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
	import com.asframe.lang.Constants;
	import com.asframe.utils.VectorUtils;
	
	import flash.events.Event;
	import flash.utils.getTimer;
	import com.asframe.tick.ITick;

	/**
	 * 心跳执行器的基类。默认使用了
	 * @author sodaChen
	 * @Date:2011-5-4
	 */
	public class TickExecuter implements ITickExecuter
	{
		protected var tickList			:Vector.<ITick>;
		/** 心跳对象的集合 **/
		protected var tickMap			:IMap;
		/** 删除列表 **/
		protected var removeList		:Vector.<ITick>;
		/** 是否正在循环执行moment **/
		protected var isMomentting		:Boolean;
		/** 帧频 **/
		protected var tickRate			:int;
		/** 上一个循环的时间 **/
		protected var prevTime			:int;
		/** 执行tick的频率(时间) **/
		protected var intervalTime		:int;
		/** 是否需要处理延迟信息 **/
		protected var isDelayTime		:Boolean;
		/** 执行tick列表中tick方法的对象，默认是安全处理对象 **/
		protected var executeTick		:IExecuteTick;
		protected var name				:String;
		
		public function TickExecuter()
		{
			tickList = new Vector.<ITick>();
			removeList = new Vector.<ITick>();
			tickMap = new HashMap();
			//默认是安全处理对象
			executeTick = new SafeExecuteTick();
			executeTick.setTickList(tickList,removeList);
		}
		/**
		 * @inheritDoc
		 */		
		public function size():int
		{
			return tickList.length;
		}
		/**
		 * @inheritDoc
		 */		
		public function setIsDelayTime(isDelayTime:Boolean):void
		{
			this.isDelayTime = isDelayTime;
		}
		/**
		 * @inheritDoc
		 */	
		public function setTickRate(tickRate:int=30):void
		{
			this.tickRate = tickRate;
		}
		/**
		 * @inheritDoc
		 */	
		public function start():void
		{
		}
		/**
		 * @inheritDoc
		 */	
		public function stop():void
		{
		}
		/**
		 * @inheritDoc
		 */	
		public function pause():void
		{
		}
		/**
		 * @inheritDoc
		 */	
		public function reset():void
		{
		}
		/**
		 * @inheritDoc
		 */	
		public function clear():void
		{
			if(tickList.length > 0)
			{
				tickList.splice(0,tickList.length);
			}
			if(removeList.length > 0)
			{
				removeList.splice(0,removeList.length);
			}
		}
		/**
		 * @inheritDoc
		 */	
		public function addTick(tick:ITick):Boolean
		{
			if(tickMap.hasKey(tick))
			{
				return false;
			}
			tickList.push(tick);
			tickMap.put(tick,Constants.OBJECT);
			return true;
		}
		/**
		 * @inheritDoc
		 */	
		public function removeTick(tick:ITick):void
		{
			if(isMomentting)
			{
				removeList.push(tick);
			}
			else
			{
				removeItem(tickList,tick);
			}
		}
		/**
		 * @inheritDoc
		 */	
		public function setExecuteTick(executeTick:IExecuteTick):void
		{
			if(executeTick == null)
			{
				throw new Error("IExecuteTick对象不能为空");
			}
			if(this.executeTick != null)
			{
				this.executeTick.dispose();
			}
			this.executeTick = executeTick;
			executeTick.setTickList(tickList,removeList);
		}
		
		protected function onTicks(event:Event):void
		{
			isMomentting = true;
			if(isDelayTime)
			{
				var delayTime:int = getTimer() - prevTime;
				if((delayTime - intervalTime) >= (intervalTime * 2))
				{
					//进行多重执行
					var len:int = delayTime / intervalTime - 1;
					if(len > 0)
					{
						for(var i:int = 0; i < len; i++)
						{
							executeTick.execute();
						}
					}
				}
			}
			executeTick.execute();
			isMomentting = false;
			var removeLen:int = removeList.length;
			if(removeLen > 0)
			{
				for (var j:int = 0; j < removeLen; j++) 
				{
					removeItem(tickList,removeList[j]);
				}
				removeList.splice(0,removeLen);
			}
		}
		
		public function removeItem(vector:Vector.<ITick>,item:ITick):Boolean
		{
			var index : int = vector.indexOf(item);
			if (index == -1)
			{
				return false;
			}
			vector.splice(index, 1);
			return true;
		}
	}
}
