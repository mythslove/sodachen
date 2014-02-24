/**
 * @BasicBitmapClips.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-11-1
 */
package com.asframe.display.bitmap
{
	import com.asframe.display.IClips;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2012-11-1
	 */
	public class BasicBitmapClips extends Bitmap implements IClips
	{
		protected var mCurrentFrame				:int;
		protected var mCurrentLabel				:String;
		protected var mCurrentLabels			:Array;
		protected var mTotalFrames				:int;
		
		public function BasicBitmapClips(bitmapData:BitmapData=null, pixelSnapping:String="auto", smoothing:Boolean=false)
		{
			super(bitmapData, pixelSnapping, smoothing);
		}
		
		public function get currentFrame():int
		{
			return mCurrentFrame;
		}
		
		public function get currentLabel():String
		{
			return mCurrentLabel;
		}
		
		public function get currentLabels():Array
		{
			return mCurrentLabels;
		}
		
		public function get totalFrames():int
		{
			return mTotalFrames;
		}
		
		public function gotoAndPlay(frame:Object, scene:String=null):void
		{
		}
		
		public function gotoAndStop(frame:Object, scene:String=null):void
		{
		}
		
		public function nextFrame():void
		{
		}
		
		public function prevFrame():void
		{
		}
		
		public function play():void
		{
		}
		
		public function stop():void
		{
		}
		
		public function tick():void
		{
		}
	}
}
