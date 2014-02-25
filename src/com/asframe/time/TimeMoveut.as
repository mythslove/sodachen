/**
 * @TimeMoveut.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Game3D
 * <br>Date:2012-12-11
 */
package com.asframe.time
{
	import flash.utils.getTimer;

	/**
	 * 时差结算对象
	 * @author sodaChen
	 * #Date:2012-12-11
	 */
	public class TimeMoveut
	{
		private static var time:int;
		
		public static function startTime():void
		{
			time = getTimer();
		}
		
		public static function getTimeMoveut():int
		{
			return getTimer() - time;
		}
		public static function getTime():int
		{
			return time;
		}
		public static function traceTimeMoveut(msg:String,isSec:Boolean = false):void
		{
			trace(getTimeMoveutMsg(msg,isSec));
		}
		public static function getTimeMoveutMsg(msg:String,isSec:Boolean = false):String
		{
			time = getTimeMoveut();
			if(isSec)
			{
				return msg + "耗费:" + time / 1000 + "秒";
			}
			return msg + "耗费:" + time + "毫秒";
		}
	}
}
