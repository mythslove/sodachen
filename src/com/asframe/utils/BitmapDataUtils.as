/**
 * @BtmapDataUtils.as.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Tercel
 * <br>Date:2012-8-16
 */
package com.asframe.utils
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-8-16
	 */
	public class BitmapDataUtils
	{
		public function BitmapDataUtils()
		{
		}
		/**
		 * 把显示对象转换成BitmapData对象 
		 * @param display
		 * @param rect
		 * @param mx
		 * @return 
		 * 
		 */		
		public static function draw(display:DisplayObject,rect:Rectangle = null, mx:Matrix = null):BitmapData
		{
			if(rect == null)
			{
				rect = new Rectangle(0,0,display.width,display.height);
			}
			var bitmapData:BitmapData = new BitmapData(rect.width,rect.height,true,0x00000000);
			bitmapData.draw(display,mx,null,null,rect);
			return bitmapData;
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
									   	col:int,
										isTwoAry:Boolean = true):Array
		{
			var width:int = bitmapData.width / col;
			var height:int = bitmapData.height / row;
			
			var point:Point = new Point(0,0);
			var rect:Rectangle = new Rectangle(0,0,width,height);
			//切割图片
			var bitmapDatas:Array = new Array();
			var temp:Array = null;
			for(var i:int = 0; i < row; i++)
			{
				if(isTwoAry)
					temp = new Array();
				for(var j:int = 0; j < col; j++)
				{
					rect.x = j * width;
					rect.y = i * height;
					var bit:BitmapData = new BitmapData(width,height,true,0);
					bit.copyPixels(bitmapData,rect,point);
					if(temp == null)
					{
						bitmapDatas.push(bit);
					}
					else
					{
						temp.push(bit);
					}
				}
				if(temp != null)
				{
					bitmapDatas.push(temp);
				}
			}
			//释放掉原来的资源
			bitmapData.dispose();
			return bitmapDatas;
		}
	}
}
