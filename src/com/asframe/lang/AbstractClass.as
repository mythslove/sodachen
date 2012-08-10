/**
 * @AbstractClass.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-7-20
 */
package com.asframe.lang
{
	import com.asframe.lang.error.AbstractClassError;
	
	import flash.utils.getQualifiedClassName;

	/**
	 * 抽象类
	 * @author sodaChen
	 * @Date:2012-7-20
	 */
	public class AbstractClass
	{
		public function AbstractClass()
		{
		}
		
		protected function checkAbstract(clazz:String):void
		{
			if (getQualifiedClassName(this) == clazz)
			{
				throw new AbstractClassError(clazz + "是抽象类，不能实例化!");
			}
		}
	}
}
