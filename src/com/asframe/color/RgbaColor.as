/**
 * @RgbaColor.as
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
	/**
	 *
	 * @author sodaChen
	 * Date:2012-9-6
	 */
	public class RgbaColor extends RgbColor
	{
		/** 透明通道 **/
		public var alpha:Number = 1;
		
		public function RgbaColor(red:uint = 0 , 
								green:uint = 0,
								blue:uint = 0,
								alpha:Number = 1) 
		{
			super(red,green,blue);
			this.alpha = alpha;
		}
		
		/**
		 * 获取4通道16进制值
		 * @return
		 */
		public function getHex32():uint
		{
			var hex24:uint = getHex24();
			var c:Number = hex24 / 0x10000000;
			return (hex24 & 0xffffff) + Math.floor(alpha * c) * 0x10000000;
		}
		
		/**
		 * 应用一个alpha值 , 并返回一个32位通道值
		 * @param	a
		 * @return
		 */
		public function applyAlpha(alpha:Number):uint
		{
			this.alpha = alpha;
			return getHex32();
		}
		
		/**
		 * 克隆
		 * @return
		 */
		public override function clone():*
		{
			return new RgbaColor(red, green, blue, alpha);
		}
		
		/**
		 * 输出文本
		 * @return
		 */
		public override function toString():String
		{
			return "red:" + red + "  " + 
				"green:" + green + "  " + 
				"blue:" + blue + "  " +
				"alpha:" + alpha;
		}
	}
}
