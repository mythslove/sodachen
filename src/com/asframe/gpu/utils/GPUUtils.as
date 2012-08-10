/**
 * @GPUUtils.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-7-13
 */
package com.asframe.gpu.utils
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;

	/**
	 *
	 * @author sodaChen
	 * @Date:2012-7-13
	 */
	public class GPUUtils
	{
		public static const NO_STATUS:int = 0;
		public static const EQUS_STATUS:int = 1;
		public static const CHANGE_STATUS:int = 2;
		public static const WIDTH:int = 2048;
		public static const HEIGHT:int = 2048;
		/**
		 * 检测或者更新，返回BitmapData对象符合GPU的使用 
		 * @param bitmapData 返回符合GPU的BitmapData对象
		 * @return 
		 * 
		 */		
		public static function checkUpdateBmp(bitmapData:BitmapData,isScale:Boolean = true):BitmapData
		{
			var widthStatus:int = NO_STATUS;
			var heightStatus:int = NO_STATUS;
			var width:int = WIDTH;
			var height:int = HEIGHT;
			if(bitmapData.width > width)
			{
				widthStatus = CHANGE_STATUS;
			}
			if(bitmapData.height > height)
			{
				heightStatus = CHANGE_STATUS;
			}
			var pow:int = 0;
			if(widthStatus == NO_STATUS)
			{
				for (var i:int = 0; i < 12; i++ ) 
				{
					pow = Math.pow(2, i);
					//没有状态，并且当前的小于2的i次方
					if(pow > bitmapData.width)
					{
						width = pow;
						widthStatus = CHANGE_STATUS;
						break;
					}
					else if(pow == bitmapData.width)
					{
						widthStatus = EQUS_STATUS;
						break;
					}
				}
			}
			if(heightStatus == NO_STATUS)
			{
				for (var j:int = 0; j < 12; j++ ) 
				{
					pow = Math.pow(2, j);
					//没有状态，并且当前的小于2的i次方
					if(pow > bitmapData.height)
					{
						height = pow;
						heightStatus = CHANGE_STATUS;
						break;
					}
					else if(pow == bitmapData.height)
					{
						height = pow;
						heightStatus = EQUS_STATUS;
						break;
					}
				}
			}
			//本身是2的n次方，则不需要做改变
			if(widthStatus == EQUS_STATUS && heightStatus == EQUS_STATUS)
			{
				return bitmapData;
			}
			//重新绘画一个新的
			var temp:BitmapData = new BitmapData(width, height,true, 0);
			if(isScale)
			{
				var matrix:Matrix = new Matrix(width / bitmapData.width, 0, 0, height / bitmapData.height);
				temp.draw(bitmapData, matrix, null, null, null, true);
			}
			else
			{
				temp.draw(bitmapData, null, null, null, null, true);
			}
			return temp;
		}
	}
}
