/**
 * @CallFunctions.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame EasyPlane
 * <br>Date:2012-11-5
 */
package com.asframe.fun
{
	import com.asframe.utils.VectorUtils;

	/**
	 * 对Function数组进行回调
	 * @author sodaChen
	 * Date:2012-11-5
	 */
	public class CallFunctions
	{
		private var funList:Vector.<Function>;
		private var len:int;
		public function CallFunctions()
		{
			funList = new Vector.<Function>();
		}
		public function addFunction(fun:Function):void
		{
			funList.push(fun);
			len++;
		}
		public function removeFunction(fun:Function):void
		{
			VectorUtils.removeItem(Vector(funList),fun);
			len = funList.length;
		}
		public function calls():void
		{
			if(len > 0)
			{
				for (var i:int = 0; i < len; i++) 
				{
					funList[i]();
				}
			}
		}
	}
}
