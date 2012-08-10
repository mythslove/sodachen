/** 
 * 数组数组处理
 * @version 1.0
 * @author jiyun raojiyun@163.com
 * <br>Program Name{ TribeGame }
 * <br>Date{2010-10-05}
 */
package com.asframe.utils
{
	public class ArrayTool
	{
		public function ArrayTool()
		{
		}
		/**
		 * 查找元素对应给出值 的位置
		 * @param arr		：数组		
		 * @param value		:元素值
		 * @return 
		 * 
		 */
		public static function getKey(arr:Array,value:*):int
		{
			var len:int = arr.length;
			for(var i :int = 0;i<len;i++)
			{
				if(arr[i] == value)
				{
					return i;
				}
			}
			return -1;
		}		
		/**
		 * 查找元素中"变量"对应"给出值"的位置 
		 * @param arr		：数组
		 * @param param		:元素变量名
		 * @param value		:元素变量值
		 * @return 			:-1=不存在
		 * 
		 */		
		public static function getKeyByParam(arr:Array,param:String,value:*):int
		{
			var len:int = arr.length;
			for(var i :int = 0;i<len;i++)
			{
				if(arr[i])
				{
					if(arr[i][param] == value)
					{
						return i;
					}
				}
			}
			return -1;
		}
		/**
		 * 删除数组元素 
		 * @param arr		：数组
		 * @param param		:元素变量名
		 * @param value		:元素变量值
		 * @return 			:删除成功与否
		 * 
		 */		
		public static function deleteItemByParamValue(arr:Array,param:String,value:*):Boolean
		{
			var key:int = getKeyByParam(arr,param,value);
			if(key != -1)
			{
				arr.splice(key,1);
				return true
			}
			else
			{
				return false;
			}
		}
	}
}