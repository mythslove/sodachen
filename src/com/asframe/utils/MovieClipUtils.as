/**
 * @MovieClipUtils.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-6-19
 */
package com.asframe.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;

	/**
	 *
	 * @author sodaChen
	 * #Date:2013-6-19
	 */
	public class MovieClipUtils
	{
		/** 所有movieclip播放下一帧*/
		public static function mcPlayNextFrame(target:DisplayObject):void
		{
			if(target is MovieClip) (target as MovieClip).nextFrame();
			if(target is DisplayObjectContainer)
			{
				for(var i:int = 0; i<(target as DisplayObjectContainer).numChildren; i++)
				{
					mcPlayNextFrame((target as DisplayObjectContainer).getChildAt(i));
				}
			}
		}
		
		/** 所有movieclip停止*/
		public static function mcStopFrame(target:DisplayObject):void
		{
			if(target is MovieClip) (target as MovieClip).stop();
			if(target is DisplayObjectContainer)
			{
				for(var i:int = 0; i<(target as DisplayObjectContainer).numChildren; i++)
				{
					mcStopFrame((target as DisplayObjectContainer).getChildAt(i));
				}
			}
		}
		
		/** movieclip开始播放*/
		public static function mcPlayFrame(target:DisplayObject):void
		{
			if(target is MovieClip) (target as MovieClip).play();
			if(target is DisplayObjectContainer)
			{
				for(var i:int = 0; i<(target as DisplayObjectContainer).numChildren; i++)
				{
					mcPlayFrame((target as DisplayObjectContainer).getChildAt(i));
				}
			}
		}
		
		/** movieclip播放到某帧*/
		public static function mcGotoStopFrame(target:DisplayObject, value:int):void
		{
			if(target is MovieClip)
			{
				var c_frame:int = value > (target as MovieClip).totalFrames ? 1 : value;
				(target as MovieClip).gotoAndStop(c_frame);
			}
			if(target is DisplayObjectContainer)
			{
				for(var i:int = 0; i<(target as DisplayObjectContainer).numChildren; i++)
				{
					mcGotoStopFrame((target as DisplayObjectContainer).getChildAt(i), value);
				}
			}
		}
	}
}
