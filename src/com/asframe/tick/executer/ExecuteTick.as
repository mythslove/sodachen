/**
 * @ExecuteTick.as
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
	import com.asframe.slf4j.ILogger;
	import com.asframe.slf4j.LoggerFactory;
	import com.asframe.tick.ITick;

	/**
	 * 基础的执行心跳对象.如果某一个tick执行ontick出错的话，会导致后面的tick不能执行到onTick方法.
	 * 因为没有了对异常的捕捉，所以效率会相对高一些，可以根据具体点情况而使用
	 * @author sodaChen
	 * @Date:2011-5-4
	 */
	public class ExecuteTick implements IExecuteTick
	{
		/** 心跳对象列表 **/
		protected var tickList			:Vector.<ITick>;
		/** 删除列表 **/
		protected var removeList		:Vector.<ITick>;
		/** 日志接口 **/
		protected var log				:ILogger;
		
		public function ExecuteTick()
		{
			log = LoggerFactory.getLogger(ExecuteTick);
		}
		/**
		 * @inheritDoc
		 */		
		public function setTickList(tickList:Vector.<ITick>,removeList:Vector.<ITick>):void
		{
			this.tickList = tickList;
			this.removeList = removeList;
		}
		/**
		 * @inheritDoc
		 */		
		public function execute():void
		{
			var len:int = tickList.length;
			for(var i:int = 0; i < len; i++)
			{
				var tick:ITick = tickList[i];
				if(tick != null)
				{
					tick.tick();
				}
			}
		}
		/**
		 * @inheritDoc
		 */	
		public function dispose(o:* = null):void
		{
			tickList = null;
			tickList = null;
		}
	}
}
