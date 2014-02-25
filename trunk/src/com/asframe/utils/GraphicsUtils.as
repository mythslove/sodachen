package com.asframe.utils
{
	import flash.display.Graphics;

	public class GraphicsUtils
	{
		/**
		 * 绘制90°的网格 
		 * @param graphics 绘制对象
		 * @param row 行
		 * @param col 纵
		 * @param tileWidth 区块的宽
		 * @param tileHeight 区块的高
		 * 
		 */		
		public static function draw90Grid(graphics:Graphics,row:int,col:int,tileWidth:int,tileHeight:int):void
		{
			var width:int = col * tileWidth;
			var height:int = row * tileHeight;
			for(var i:int = 0; i < row; i++)
			{
				//画横线
				graphics.moveTo(0,i * tileHeight);
				graphics.lineTo(width,i * tileHeight);
				for(var j:int = 0; j < col; j++)
				{
					graphics.moveTo(j * tileWidth,0);
					graphics.lineTo(j * tileWidth,height);
				}
			}
			graphics.endFill();
		}
	}
}