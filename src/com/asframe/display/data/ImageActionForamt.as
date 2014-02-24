package com.asframe.display.data
{
	import flash.display.BitmapData;

	/**
	 * 图片包含单种动作的格式描述
	 *  
	 * @author Soda.Chen
	 * #date 2009-2-2
	 * 
	 */		
	public class ImageActionForamt
	{
		/** 图像动画名称 **/
		public var name		:String;
		public var row			:int;
		public var col			:int;
		public var bitmapDatas	:Array;
		public var addY		:int;
		
		public function ImageActionForamt()
		{
		}
		public function dispose():void
		{
			var len:int = bitmapDatas.length;
			var len1:int;
			for(var i :int = 0;i<len;i++)
			{
				var bitmapData:BitmapData;
				if(bitmapDatas[i] is Array)
				{
					len1 = bitmapDatas[i].length;
					for(var j :int = 0;j<len1;j++)
					{
						bitmapData = bitmapDatas[i][j] as BitmapData;
						if(bitmapData)
						{
							bitmapData.dispose();
							bitmapData = null;
						}
					}
					bitmapDatas[i] = [];
				}				
			}
			this.bitmapDatas = [];
			
		}
	}
}
