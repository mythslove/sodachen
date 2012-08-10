/**
 * @SafeExecuteTick.as
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
	import com.asframe.tick.TickConst;

	/**
	 * 安全执行Tick列表里的每一个Tick方法。确保每个一个都会被执行到
	 * @author sodaChen
	 * @Date:2011-5-4
	 */
	public class SafeExecuteTick extends ExecuteTick
	{
		/** 心跳错误的处理方式，默认是忽略 **/
		private var tickErrorModel:int;
		/** tick发生错误的回调 **/
		private var errorCallBack:Function;
		public function SafeExecuteTick(errorCallBack:Function = null)
		{
			super();
			tickErrorModel = TickConst.IGNORE_ON_TICK_ERROR;
			this.errorCallBack = errorCallBack;
		}
		public function setErrorCallBack(errorCallBack:Function):void
		{
			this.errorCallBack = errorCallBack;
		}
		public function setTickErrorMode(tickErrorModel:int):void
		{
			this.tickErrorModel = tickErrorModel;
		}
		public override function execute():void
		{
			var len:int = tickList.length;
			for(var i:int = 0; i < len; i++)
			{
				var tick:ITick = tickList[i];
				try
				{
					tick.tick();
				}
				catch(error:Error)
				{
					if(tickErrorModel == TickConst.RMOVE_ON_TICK_ERROR)
					{
						removeList.push(tick);
					}
					if(errorCallBack != null)
					{
						try
						{
							errorCallBack(tick);
						}
						catch(errorCall:Error)
						{
							
						}
					}
				}
			}
		}
	}
}
