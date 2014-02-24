/**
 * @BitmapMovieData.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame GameEngine
 * <br>Date:2013-6-22
 */
package com.asframe.display.data
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.share.BasicShareObject;
	import flash.display.BitmapData;

	/**
	 * Bitmap影片剪辑的数据
	 * @author sodaChen
	 * #Date:2013-6-22
	 */
	public class BitmapMovieData
	{
		/** 帧名字的集合 **/
		public var frameLabelMap:HashMap;
		/** 每帧的图像信息 **/
		public var bitmapDatas:Vector.<BitmapData>;
		/** 包含每帧偏移的数据 **/
		public var frameDatas:Vector.<FrameBitmapData>;
		
		public function BitmapMovieData()
		{
			frameLabelMap = new HashMap();
		}
		public function getFrameLabel(frameLabel:String):FrameLabelData
		{
			return frameLabelMap.get(frameLabel);
		}
	}
}
