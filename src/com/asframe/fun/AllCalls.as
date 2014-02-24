/**
 * @AllCalls.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame EasyPlane
 * <br>Date:2012-11-11
 */
package com.asframe.fun
{
	import com.asframe.collections.maps.HashMap;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-11-11
	 */
	public class AllCalls
	{
		private var funMap:HashMap;
		
		public function AllCalls()
		{
			funMap = new HashMap();
		}
		
		public function addFunction(funName:String,fun:Function):void
		{
			if(funMap.hasKey(funName))
			{
				throw new Error("AllCalls.addFunction出现相同的函数名称：" + funName);
			}
		}
	}
}
