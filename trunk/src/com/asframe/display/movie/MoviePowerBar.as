/**
 * @SimplePowerBar.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:TribeGameClient
 * <br>Date:2010-11-2
 */
package com.asframe.display.movie
{
	import flash.display.MovieClip;

	/**
	 *
	 * @author sodaChen
	 * Date:2010-11-2
	 */
	public class MoviePowerBar
	{
		public var powerbar		:MovieClip;
		/** 最大值 **/
		public var maxValue		:int;
		/** 实际动画的帧数 **/
		public var frame			:int;
		/**
		 * 设置能量条和动画的帧数 
		 * @param powerbar
		 * @param max:最大值
		 * @param frame:动画的帧数,默认为100帧
		 * 
		 */		
		public function MoviePowerBar(powerbar:MovieClip,maxValue:int,frame:int = 100)
		{
			super();
			this.powerbar = powerbar;
			powerbar.gotoAndPlay(0);
			this.maxValue = maxValue;
			this.frame = frame;
		}
		
		public function changeValue(value:int):void
		{
			gotoAndStop(Math.floor((value / maxValue) * frame));
		}
		public function gotoAndStop(position:int):void
		{
			if(position < 0)
			{
				position = 0;
			}
			else if(position > frame)
			{
				position = frame;
			}
			powerbar.gotoAndStop(position);
		}
		
		public function getContainer():MovieClip
		{
			return powerbar;
		}
	}
}
