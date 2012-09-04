/**
 * @BtmapDataUtils.as.as
 * 
 * @author sodaChen mail:sujun10@21cn.com
 * @version 1.0
 * <br>Copyright (C), 2012 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Tercel
 * <br>Date:2012-8-16
 */
package com.asframe.utils
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 *
	 * @author sodaChen
	 * @Date:2012-8-16
	 */
	public class BitmapDataUtils
	{
		public function BitmapDataUtils()
		{
		}
		/**
		 * 对BitmapData进行等宽，等高的切割 
		 * @param bitmapData
		 * @param row 行
		 * @param col 纵
		 * @return 返回切好的二维bitmapdata数组
		 * 
		 */		
		public static function carveup(	bitmapData:BitmapData,
									   	row:int, 
									   	col:int):Array
		{
			var width:int = bitmapData.width / col;
			var height:int = bitmapData.height / row;
			
			var point:Point = new Point(0,0);
			var rect:Rectangle = new Rectangle(0,0,width,height);
			//切割图片
			var bitmapDatas:Array = new Array();
			for(var i:int = 0; i < row; i++)
			{
				var temp:Array = new Array();
				for(var j:int = 0; j < col; j++)
				{
					rect.x = j * width;
					rect.y = i * height;
					var bit:BitmapData = new BitmapData(width,height,true,0);
					bit.copyPixels(bitmapData,rect,point);
					temp.push(bit);
				}
				bitmapDatas.push(temp);
			}
			//释放掉原来的资源
			bitmapData.dispose();
			return bitmapDatas;
		}
	}
}