/**
 * @FrameLabelData.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-6-26
 */
package com.asframe.display.data
{
	import flash.display.BitmapData;

	/**
	 *
	 * @author sodaChen
	 * Date:2013-6-26
	 */
	public class FrameLabelData
	{
		/** 每帧的图像信息 **/
		public var bitmapDatas:Vector.<BitmapData>;
		/** 包含每帧偏移的数据 **/
		public var frameDatas:Vector.<FrameBitmapData>;
	}
}
