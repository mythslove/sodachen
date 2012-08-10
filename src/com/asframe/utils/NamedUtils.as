/**
 * @NamedUtil.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-2-19
 */
package com.asframe.utils
{
	/**
	 * 具备name属性的处理程序
	 * @author sodaChen
	 * @Date:2012-2-19
	 */
	public class NamedUtils
	{
		/**
		 * 根据查找指定的名称找出第一个符合的对象
		 * @param ary 查找的数组
		 * @param name 查找的名称
		 * @return 
		 * 
		 */		
		public static function findIteam(ary:Array,name:String):*
		{
			if(ary == null || ary.length == 0 || name == null)
			{
				return null;
			}
			for each (var named:Object in ary) 
			{
				if(named.name == name)
				{
					return named;
				}
			}
			return null;
		}
		/**
		 * 根据查找指定的名称找出所有符合的对象
		 * @param ary 查找的数组
		 * @param name 查找的名称
		 * @return 数组
		 * 
		 */		
		public static function findIteams(ary:Array,name:String):Array
		{
			if(ary == null || ary.length == 0 || name == null)
			{
				return null;
			}
			var results:Array = [];
			for each (var named:Object in ary) 
			{
				if(named.name == name)
				{
					results.push(named);
				}
			}
			return ary;
		}
	}
}
