package com.asframe.display.data
{
	import com.asframe.collections.maps.HashMap;

	/**
	 * 图片的影片格式
	 *  
	 * @author Soda.Chen
	 * #date 2009-2-2
	 * 
	 */	
	public class ImageMovieForamt
	{
		public var width			:int;
		public var height			:int;
		public var rowMax			:int;
		public var colMax			:int;
		public var actionMap		:HashMap;
		public var defaultAction	:String;
		/** 该对象被引用的数量 **/
		public var citeCount		:int;
		public var key				:String;
		
		public function ImageMovieForamt()
		{
			actionMap = new HashMap();
		}
		/**
		 * 是否有指定动作名称的图像格式 
		 * @param actionName
		 * @return 
		 * 
		 */		
		public function hasAction(actionName:String):Boolean
		{
			return actionMap.hasKey(actionName);
		}
		public function addImageActionForamt(imageFormat:ImageActionForamt):void
		{
			actionMap.put(imageFormat.name,imageFormat);
		}
		/**
		 * 获取到指定动作名称的图像格式 
		 * @param actionName
		 * @return 
		 * 
		 */		
		public function getImageActionForamt(actionName:String):ImageActionForamt
		{
			return actionMap.get(actionName) as ImageActionForamt;
		}
		/**销毁**/
		public function dispose():void
		{
			var keyList:Array = this.actionMap.keysToArray();
			var len:int = keyList.length;
			for(var i :int = 0;i<len;i++)
			{
				var imageFormat:ImageActionForamt = this.actionMap.get(keyList[i]) as ImageActionForamt;
				imageFormat.dispose();
			}
			this.actionMap.clear();
		}		
	}
}
