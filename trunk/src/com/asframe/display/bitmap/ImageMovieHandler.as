package com.asframe.display.bitmap
{
	import com.asframe.display.data.ImageActionForamt;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * 图片形式的影片剪辑处理对象
	 *  
	 * @author Soda.Chen
	 * #date 2009-2-3
	 * 
	 */
	public class ImageMovieHandler
	{
		public static var width:int;
		public static var height:int;
		
		public function ImageMovieHandler()
		{
		}
		
		/**
		 * 根据图片的具体规格创建一个图片的动作格式对象 
		 * @param bitmapData
		 * @param row
		 * @param col
		 * @return 
		 * 
		 */		
		public static function createImageAction(bitmapData:BitmapData,row:int,col:int,addY:int = 0):ImageActionForamt
		{
			width = bitmapData.width / col;
			height = bitmapData.height / row;
			
			var point:Point = new Point(0,0);
			var rect:Rectangle = new Rectangle(0,0,width,height);
			var actionFormat:ImageActionForamt = new ImageActionForamt();
			actionFormat.row = row;
			actionFormat.col = col;
			actionFormat.addY = addY;
			//切割图片
			var bitmapDatas:Array = new Array();
			for(var i:int = 0; i < row; i++)
			{
				var temp:Array = new Array();
				for(var j:int = 0; j < col; j++)
				{
					rect.x = j * width;
					rect.y = i * height;
					var bit:BitmapData = new BitmapData(width,height,true,0);//false,0)
					bit.copyPixels(bitmapData,rect,point);
					temp.push(bit);
				}
				bitmapDatas.push(temp);
			}
			//释放掉原来的资源
			bitmapData.dispose();
			actionFormat.bitmapDatas = bitmapDatas;
			
			return actionFormat;
		}
		public static function createTwoFiveAction(bitmapData:BitmapData,row:int,col:int,addY:int = 0):ImageActionForamt
		{
			width = bitmapData.width / col;
			height = bitmapData.height / row;
			
			var point:Point = new Point(0,0);
			var rect:Rectangle = new Rectangle(0,0,width,height);
			var actionFormat:ImageActionForamt = new ImageActionForamt();
			actionFormat.row = row;
			actionFormat.col = col;
			actionFormat.addY = addY;
			//切割图片
			var bitmapDatas:Array = new Array();
			for(var i:int = 0; i < 5; i++)
			{
				var temp:Array = new Array();
				for(var j:int = 0; j < col; j++)
				{
					var bit:BitmapData;
					rect.x = j * width;
					if(i == 1)
					{
						rect.y = 0;
						bit = new BitmapData(width,height,true,0);//false,0)
						bit.copyPixels(bitmapData,rect,point);
					}
					else if(i==3)
					{
						rect.y = height;
						bit = new BitmapData(width,height,true,0);//false,0)
						bit.copyPixels(bitmapData,rect,point);
					}
						temp.push(bit);
				}
				bitmapDatas.push(temp);
			}
			//释放掉原来的资源
			bitmapData.dispose();
			actionFormat.bitmapDatas = bitmapDatas;
			
			return actionFormat;
		}
		/**
		 * 切割大雨宽于2880 的图像  
		 * @param sprite
		 * @param row
		 * @param col
		 * @param addY
		 * @return 
		 * 
		 */		
		public static function createBigTwoFiveAction(sprite:Sprite,row:int,col:int,addY:int = 0):ImageActionForamt
		{
			width = sprite.width / col;
			height = sprite.height / row;		
			var rect:Rectangle = new Rectangle(0,0,width,height);
			var actionFormat:ImageActionForamt = new ImageActionForamt();
			actionFormat.row = row;
			actionFormat.col = col;
			actionFormat.addY = addY;
			//切割图片
			var bitmapDatas:Array = new Array();
			for(var i:int = 0; i < 5; i++)
			{
				var temp:Array = new Array();
				for(var j:int = 0; j < col; j++)
				{
					var bit:BitmapData;
					if(i == 1)
					{
						bit = new BitmapData(width,height,true,0);
						bit.draw(sprite,new Matrix(1,0,0,1,(-j * width),0),null,null,rect);
					}
					else if(i==3)
					{
						bit = new BitmapData(width,height,true,0);//false,0)
						bit.draw(sprite,new Matrix(1,0,0,1,(-j * width),-rect.height),null,null,rect);
					}
					temp.push(bit);
				}
				bitmapDatas.push(temp);
			}
			actionFormat.bitmapDatas = bitmapDatas;
			
			return actionFormat;
		}
		public static function createTwoAction(bitmapData:BitmapData,col:int):ImageActionForamt
		{
			var actionFormat:ImageActionForamt = createImageAction(bitmapData,2,col);
			//重新调整显示对象
			var datas:Array = new Array();
			datas[0] = actionFormat.bitmapDatas[0];
			datas[1] = actionFormat.bitmapDatas[0];
			datas[2] = actionFormat.bitmapDatas[0];
			datas[3] = actionFormat.bitmapDatas[1];
			datas[4] = actionFormat.bitmapDatas[1];
			actionFormat.bitmapDatas = datas;
			
			return actionFormat;
		}
		public static function createThreeAction(bitmapData:BitmapData,col:int):ImageActionForamt
		{
			var actionFormat:ImageActionForamt = createImageAction(bitmapData,3,col);
			//重新调整显示对象
			var datas:Array = new Array();
			datas[0] = actionFormat.bitmapDatas[0];
			datas[1] = actionFormat.bitmapDatas[1];
			datas[2] = actionFormat.bitmapDatas[1];
			datas[3] = actionFormat.bitmapDatas[1];
			datas[4] = actionFormat.bitmapDatas[2];
			actionFormat.bitmapDatas = datas;
		
			return actionFormat;
		}
		/**
		 * 叠加多个显示对象到一个显示对象里，并返回该对象 
		 * @param childs
		 * @return 
		 * 
		 */		
		public static function mergerSprite(childs:Array):Sprite
		{
			var sprite:Sprite = new Sprite();
			for(var i:int = 0; i < childs.length; i++)
			{
				sprite.addChild(childs[i]);
			}
			return sprite;
		}

	}
}
