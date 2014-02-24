/**
 * @BasicSingleton.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-10-28
 */
package com.asframe.lang
{
	import com.asframe.utils.ClassUtils;
	
	import flash.errors.IllegalOperationError;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-10-28
	 */
	public class BasicSingleton
	{
		private var hasInstace:Boolean;
		
		public function BasicSingleton()
		{
			if(hasInstace)
			{
				throw new IllegalOperationError(ClassUtils.getClassName(this) + "是单例对象，不能进行多次实例化");
			}
			hasInstace = true;
		}
	}
}
