/**
 * @MovieClipsImpl.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-11-1
 */
package com.asframe.display.movie
{
	import com.asframe.display.IClips;
	
	import flash.display.MovieClip;
	
	/**
	 * 用MovieClip
	 * @author sodaChen
	 * Date:2012-11-1
	 */
	public class MovieClipsImpl extends MovieClip implements IClips
	{
		public function MovieClipsImpl()
		{
			super();
		}
		
		public function tick():void
		{
			if(isPlaying)
			{
				if(currentFrame < totalFrames)
				{
					nextFrame();
				}
				else
				{
					gotoAndPlay(1);
				}
			}
		}
	}
}
