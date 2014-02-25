/**
 * @TickManager.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-5-4
 */
package com.asframe.tick
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
	import com.asframe.tick.executer.EnterFrameExecuter;
	import com.asframe.tick.executer.ExecuteTick;
	import com.asframe.tick.executer.ITickExecuter;
	import com.asframe.tick.executer.TimerExecuter;
	
	import flash.display.DisplayObject;

	/**
	 * 心跳管理器
	 * @author sodaChen
	 * Date:2011-5-4
	 */
	public class TickManager
	{
		/** 心跳执行器 **/
		public static var tickExecuter:ITickExecuter;
		/** 心跳执行器的集合 **/
		private static var executerMap:IMap = new HashMap();
		/** 默认的空的心跳执行器 **/
		private static var NULL_TICK_EXECUTER:String = "null";
		
		/**
		 * 创建心跳管理器 
		 * @param root 当有root值时，表示是利用EnterFrame事件
		 * @param tickRate 心跳频率
		 * @param executerName 执行器的名称，方便以后获取
		 * @param isSafe 是否安全处理心跳对象
		 * @return 心跳执行器
		 * 
		 */		
		public static function createTickExecuter(	root:DisplayObject = null,
													tickRate:int = 30,
													executerName:String = null,
													isSafe:Boolean = true):ITickExecuter
		{
			var tempTickExecuter:ITickExecuter = null;
			if(root == null)
			{
				tempTickExecuter = new TimerExecuter(tickRate);
			}
			else
			{
				tempTickExecuter = new EnterFrameExecuter(root);
			}
			if(!isSafe)
			{
				tempTickExecuter.setExecuteTick(new ExecuteTick());
			}
			
			if(executerName == null)
			{
				TickManager.tickExecuter = tempTickExecuter;
				executerName = NULL_TICK_EXECUTER;
			}
			if(TickManager.tickExecuter == null)
			{
				TickManager.tickExecuter = tempTickExecuter;
			}
			executerMap.put(executerName,tempTickExecuter);
			return tempTickExecuter;
		}
		/**
		 * 初始化一个心跳执行器 
		 * @param executerName
		 * @param tickExecuter
		 * @param executeTick
		 * 
		 */		
		public static function initTickExecuter(	executerName:String,
													tickExecuter:ITickExecuter):void
		{
			if(executerName != null)
			{
				executerMap.put(executerName,tickExecuter);
			}
			else
			{
				TickManager.tickExecuter = tickExecuter;
			}
		}
		/**
		 * 添加一个心跳对象 
		 * @param tick 实现了心跳接口的对象
		 * @param executerName 执行器名称，默认为空
		 * @return 是否成功添加进去
		 * 
		 */		
		public static function addTick(tick:ITick,executerName:String = null):Boolean
		{
			return getTickExecuter(executerName).addTick(tick);
		}
		/**
		 * 删除一个心跳对象  
		 * @param tick 实现了心跳接口的对象
		 * @param executerName 执行器名称，默认为空
		 * 
		 */		
		public static function removeTick(tick:ITick,executerName:String = null):void
		{
			getTickExecuter(executerName).removeTick(tick);
		}
		/**
		 * 获取到一个心跳执行器对象
		 * @param executerName 执行器名称，为空的话则取出默认的执行器
		 * @return 返回心跳执行器对象
		 * 
		 */		
		public static function getTickExecuter(executerName:String = null):ITickExecuter
		{
			var tempExecuter:ITickExecuter = tickExecuter;
			if(executerName == null)
			{
				executerName = NULL_TICK_EXECUTER;
			}
			if(executerMap.hasKey(executerName))
			{
				tempExecuter = executerMap.get(executerName);
			}
			return tempExecuter;
		}
		public static function removeTickExecuter(executerName:String = null):ITickExecuter
		{
			var tempExecuter:ITickExecuter = tickExecuter;
			if(executerName != null && executerMap.hasKey(executerName))
			{
				tempExecuter = executerMap.remove(executerName);
			}
			else
			{
				tickExecuter = null;
			}
			return tempExecuter;
		}
	}
}
