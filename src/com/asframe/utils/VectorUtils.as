/**
 * @VectirUtils.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-6-20
 */
package com.asframe.utils
{
	/**
	 *
	 * @author sodaChen
	 * Date:2012-6-20
	 */
	public class VectorUtils
	{
		/**
		 * 从此 Vector 中移除指定元素的单个实例，如果存在的话（可选操作）。
		 * 如果此 Vector 包含指定的元素（或者此 Vector 由于调用而发生更改），则返回 true 。  
		 * @param o:要从此 Vector 中移除的元素（如果存在）。
		 * @return :如果此调用将移除一个元素，则返回 true
		 */
		public static function removeItem(vector:Object,item:Object):Boolean
		{
			var index : int = vector.indexOf(item);
			if (index == -1)
			{
				return false;
			}
			vector.splice(index, 1);
			return true;
		}
		/**
		 * 清除Vector里的所有对象
		 * @param vector
		 * 
		 */		
		public static function clear(vector:Vector):void
		{
			vector.splice(0, vector.length);
		}
	}
}
