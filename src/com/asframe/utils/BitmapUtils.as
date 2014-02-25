/**
 * @BitmapUtils.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-9-6
 */
package com.asframe.utils
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-9-6
	 */
	public class BitmapUtils
{
	  /**
		* 根据参数获取位图
		* @param	value
		* @return
		*/
		public static function getBitmap(value:*):Bitmap
		{
			var bitmap:Bitmap = null;
			
			if (value is String)
			{
				var bitmapClass:Class = ClassUtils.forName(value);
				return bitmap = getBitmap(bitmapClass);
			}
			
			if(value is Class)
			{
				try
				{
					return bitmap = new value() as Bitmap;
				}
				catch (e:Error)
				{
					return bitmap = new Bitmap(new value(0, 0) as BitmapData);
				}
			}			
			if (value is BitmapData)
			{
				return new Bitmap(value);
			}
			return bitmap;
		}
	}
}
