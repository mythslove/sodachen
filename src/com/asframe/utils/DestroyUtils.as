/**
 * @DestroyUtils.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Game3DAnd2D
 * <br>Date:2013-9-27
 */
package com.asframe.utils
{
	import com.asframe.lang.IDestory;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	/**
	 *
	 * @author sodaChen
	 * #Date:2012-9-27
	 */
	public class DestroyUtils
	{
		public static function destroyObj(obj:Object):void
		{
			//逐个判断并且清除
			if(obj is IDestory)
			{
				IDestory(obj).destroy();
			}
			else if(obj is Bitmap)
			{
				Bitmap(obj).bitmapData.dispose();
			}
			else if(obj is BitmapData)
			{
				BitmapData(obj).dispose();
			}
			else if(obj.hasOwnProperty("dispose"))
			{
				obj["dispose"]();
			}
			else if(obj.hasOwnProperty("destroy"))
			{
				obj["destroy"]();
			} 
		}
	}
}
