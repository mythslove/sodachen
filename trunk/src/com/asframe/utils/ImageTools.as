package com.asframe.utils
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	public class ImageTools
	{
		/** 图像的显示区域 ,默认值为-220,-250,460,300，可以修改该值 **/
		public static var imageRec:Rectangle = new Rectangle(-220,-250,460,300);
		public function ImageTools()
		{
		}
		
		public static function drawMovieFrame(movie:MovieClip,frame:int,isMin:Boolean = false):BitmapData
		{
			var bitmapData:BitmapData = minimizeImage(movie,frame);
			if(isMin)
			{
				var tempRec:Rectangle = bitmapData.getColorBoundsRect(0xFF000000,0x00000000,false)
				var tempData:BitmapData =new BitmapData(tempRec.width,tempRec.height,true,0x00000000)
				tempData.draw(bitmapData,new Matrix(1,0,0,1,-tempRec.x,-tempRec.y));
				bitmapData.dispose();
				return tempData;
			}
			//直接返回范围内的像素
			return bitmapData;
		}
		
		public static function minimizeImage(movie:MovieClip,frame:int):BitmapData
		{
			var rect:Rectangle = new Rectangle(0, 0, imageRec.width, imageRec.height);
			var matrix:Matrix = new Matrix();
			matrix.tx = -imageRec.x;
			matrix.ty = -imageRec.y;
			var b:BitmapData = new BitmapData(imageRec.width, imageRec.height,true,0x00000000);
			movie.gotoAndStop(frame);
			b.draw(movie,matrix,null,null,rect);
			return b;
		}
	}
}