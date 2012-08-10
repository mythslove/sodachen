/** 
 * 数组数组处理,元素是以统一model为基本元素
 * @version 1.0
 * @author jiyun raojiyun@163.com
 * <br>Program Name{ TribeGame }
 * <br>Date{2010-10-21}
 */
package com.asframe.utils
{
	/**
	 * 以统一model为基本元素的数组处理
	 * @author Administrator raojiyun
	 * @key			:position
	 * @value		:model[key] = value
	 * @param		:model[key][param]
	 * @paramValue	:model[key][param] = paramValue
	 */	
	public class ModelArrayTool
	{		
		//取对应KEY的值
		public static function getValueByParam(arr:Array,param:String,value:*):Object
		{
			var len:int = arr.length;
			for(var i :int = 0;i<len;i++)
			{
				if(arr[i][param] == value)
				{
					return arr[i];
				}
			}
			return null;
		}		
		//对应值的位置
		public static function getKeyByParam(arr:Array,param:String,value:*):int
		{
			var len:int = arr.length;
			for(var i :int = 0;i<len;i++)
			{
				if(arr[i][param] == value)
				{
					return i;
				}
			}
			return -1;
		}
		//按键排列
		public static function sortByIntParam(arr:Array,param:String):Array
		{
			var len:int = arr.length;
			for(var i :int = 0;i<len;i++)
			{
				for(var j :int = i+1;j<len;j++)
				{
					if(arr[i][param] < arr[j][param])
					{
						var temp:Object = arr[i];
						arr[i] = arr[j];
						arr[j] = temp;
					}
				}				
			}
			return arr;
		}
	}
}