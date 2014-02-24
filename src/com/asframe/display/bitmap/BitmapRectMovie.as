/**
 * @BitmapMovie.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-6-19
 */
package com.asframe.display.bitmap
{
	import flash.display.Bitmap;
	
	/**
	 * 利用Bitmap实现的动画.这里是纯粹的一帧帧播放。不做其他的任何处理。相当于播放器.
	 * @author sodaChen
	 * #Date:2013-6-19
	 */
	public class BitmapRectMovie extends Bitmap
	{
		/** 是否可以播放 **/
		public var isStop			:Boolean;
		/** 播放结束的回调函数 **/
		public var playOverFun		:Function;
		private var bitmapDatas		:Array;
		private var start			:int;
		private var end				:int;
		private var loop			:Boolean;
		private var frame			:int;
		public function BitmapRectMovie(bitmapDatas:Array = null, pixelSnapping:String="auto", smoothing:Boolean=false)
		{
			super(null, pixelSnapping, smoothing);
			this.bitmapDatas = bitmapDatas;
			loop = true;
		}
		public function setBitmapDatas(bitmapDatas:Array):void
		{
			this.bitmapDatas = bitmapDatas;
			start = 0;
			end = bitmapDatas.length;
			this.bitmapData = bitmapDatas[start];
		}
		/**
		 * 播放Bitmap动画 
		 * @param start 开始帧数，从1开始
		 * @param end 结束帧数
		 * @param loop 是否循环播放
		 * 
		 */		
		public function play(start:int = 1,end:int = -1,loop:Boolean = true):void
		{
			//从0开始算
			this.start = start - 1;
			this.frame = this.start;
			this.end = end;
			if(this.end == -1)
			{
				this.end = bitmapDatas.length;
			}
			this.loop = loop;
			this.bitmapData = bitmapDatas[start];
			isStop = false;
		}
		public function stop():void
		{
			isStop = true;
		}
		public function update():void
		{
			if(isStop)
			{
				return ;
			}
			bitmapData = bitmapDatas[frame];
			frame++;
			if(frame >= end)
			{
				
				if(loop)
				{
					frame = start;
				}
				else
				{
					//没有循环，则表示已经播放完了
					isStop = true;
				}
				//回调
				if(playOverFun != null)
				{
					playOverFun();
				}
			}
		}
	}
}
