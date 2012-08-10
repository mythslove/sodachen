/**
 * @RootObject.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-5-4
 */
package com.asframe.lang
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	/**
	 * 实现了基础接口的对象
	 * @author sodaChen
	 * @Date:2011-5-4
	 */
	public class ObjectImpl implements IObject
	{
		protected var classObj:Class;
		
		public function ObjectImpl()
		{
		}
		
		public function toString():String
		{
			return "{com.asframe.lang.RootObject}";
		}
		
		public function getClass():Class
		{
			if(classObj != null)
			{
				return classObj;
			}
			classObj = getDefinitionByName(getQualifiedClassName(this)) as Class;
			return classObj;
		}
		
		public function equals(equals:IEquals):Boolean
		{
			if(equals == null)
			{
				return false;
			}
			return this == equals;
		}
		public function hashCode():int
		{
			return 0;
		}
	}
}
