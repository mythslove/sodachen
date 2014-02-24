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
	import com.asframe.display.data.BitmapMovieData;
	import com.asframe.display.data.FrameBitmapData;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	/**
	 * 利用Bitmap实现的动画.这里是纯粹的一帧帧播放。不做其他的任何处理。相当于播放器
	 * @author sodaChen
	 * #Date:2013-6-19
	 */
	public class BitmapMovie extends Bitmap
	{
		/** 是否可以播放 **/
		public var isStop			:Boolean;
		/** 播放结束的回调函数 **/
		public var playOverFun		:Function;
		private var bitmapDatas		:Vector.<BitmapData>;
		private var start			:int;
		private var end				:int;
		private var loop			:Boolean;
		private var frame			:int;
		/** 图片的数据对象 **/
		private var movieData		:BitmapMovieData;
		/** 包含每帧偏移的数据 **/
		public var frameDatas		:Vector.<FrameBitmapData>;
		
		public function BitmapMovie(pixelSnapping:String="auto", smoothing:Boolean=false)
		{
			super(null, pixelSnapping, smoothing);
		}
		public function initMovie(movieData:BitmapMovieData):void
		{
			this.bitmapDatas = movieData.bitmapDatas;
			this.frameDatas = movieData.frameDatas;
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
			if(end == -1)
			{
				end = bitmapDatas.length;
			}
			this.loop = loop;
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
			//更新位置
			x = frameDatas[frame].x;
			x = frameDatas[frame].y;
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
