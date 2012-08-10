/**
 * @ITickExecuter.as
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
	import com.asframe.tick.ITick;

	/**
	 * 心跳执行器
	 * @author sodaChen
	 * @Date:2011-5-4
	 */
	public interface ITickExecuter
	{
		/**
		 * 获取到心跳执行器里面的心跳数量 
		 * @return 
		 */		
		function size():int;
		/**
		 * 设置是否处理延迟带来的影响 
		 * @param isDelayTime
		 * 
		 */		
		function setIsDelayTime(isDelayTime:Boolean):void;
		/**
		 * 设置运行的频率，默认是30帧/秒
		 * @param frameRate:帧率/秒
		 */  
		function setTickRate(tickRate:int = 30):void;
		
		/**
		 * 开始心跳
		 */ 
		function start():void;
		
		/**
		 * 停止心跳
		 */  
		function stop():void;
		/**
		 * 暂停心跳 
		 */		
		function pause():void;
		/**
		 * 复位心跳
		 */  
		function reset():void;
		
		/**
		 * 清除所有的心跳对象
		 */		
		function clear():void;
		
		/**
		 * 添加一个心跳对象
		 * @param tick：心跳接口
		 */  	
		function addTick(tick:ITick):Boolean;
		
		/**
		 * 删除一个心跳对象
		 * @param tick：心跳接口
		 */
		function removeTick(tick:ITick):void;
		/**
		 * 设置执行心跳列表对象 
		 * @param executeTick
		 * 
		 */		
		function setExecuteTick(executeTick:IExecuteTick):void;
	}
}
