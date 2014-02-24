/**
 * @IMovieClips.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-10-29
 */
package com.asframe.display
{
	import com.asframe.tick.ITick;

	/**
	 * 动画接口,gotoAndPlay和gotoAndStop是为了兼容原有的MovieClip对象
	 * @author sodaChen
	 * Date:2012-10-29
	 */
	public interface IClips extends ITick
	{
		function get currentFrame():int;
		function get currentLabel():String;
		function get currentLabels():Array;
		function get totalFrames():int;
		
		function gotoAndPlay(frame:Object, scene:String = null):void;
		function gotoAndStop(frame:Object, scene:String = null):void;
		function nextFrame():void;
		function prevFrame():void;
		function play():void;
		function stop():void;
	}
}
