/**
 * @RgbColor.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Color
 * <br>Date:2012-9-6
 */
package com.asframe.color
{
	import com.asframe.lang.ICloneable;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-9-6
	 */
	public class RgbColor implements ICloneable
	{
		/**
		 * 红色
		 */
		public var red:uint = 0;
		
		/**
		 * 绿色
		 */
		public var green:uint = 0;
		
		/**
		 * 蓝色
		 */
		public var blue:uint = 0;
		
		/**
		 * 构造
		 */
		public function RgbColor(red:uint = 0 , 
								green:uint = 0,
								blue:uint = 0) 
		{
			this.red = red;
			this.green = green;
			this.blue = blue;
		}
		
		/**
		 * 获取3通道16进制值
		 * @return
		 */
		public function getHex24():uint
		{
			return ((red << 16) | (green << 8) | blue);
		}
		
		
		public function clone():*
		{
			return new RgbaColor(red, green, blue);
		}
		
		/**
		 * @return
		 */
		public function toString():String
		{
			return "red:" + red + "  " + 
				"green:" + green + "  " + 
				"blue:" + blue;
		}
	}
}
