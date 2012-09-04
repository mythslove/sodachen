/**
 * @FunctionUtils.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-2-1
 */
package com.asframe.utils
{
	import com.asframe.slf4j.Logger;

	/**
	 *
	 * @author sodaChen
	 * @Date:2012-2-1
	 */
	public class FunctionUtils
	{
		public static function execute(fun:Function,params:Array = null,errorFun:Function = null):void
		{
			if(fun != null)
			{
				try
				{
					fun.apply(null,params);
				}
				catch(error:Error)
				{
					if(errorFun != null)
					{
						errorFun(error);
					}
					Logger.error(FunctionUtils,error.getStackTrace());
				}
			}
		}
	}
}
