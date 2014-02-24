/**
 * @FrameBitmapData.as
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
	import flash.display.BitmapData;

	/**
	 * 一帧的BitmapData相关数据
	 * @author sodaChen
	 * #Date:2013-6-22
	 */
	public class FrameBitmapData
	{
		/** 每帧的图像信息 **/
		public var bitmapDatas:BitmapData;
		public var x:int;
		public var y:int;
		public var width:int;
		public var height:int;
		public function FrameBitmapData()
		{
		}
	}
}
