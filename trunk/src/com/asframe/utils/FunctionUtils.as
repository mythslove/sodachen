/**
 * @FunctionUtils.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-1
 */
package com.asframe.utils
{
	import com.asframe.slf4j.Logger;
	
	import flash.display.Sprite;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-2-1
	 */
	public class FunctionUtils
	{
		public static function callFuncTarget(data:*,func:Function,target:*):void
		{
			if(target == null)
			{
				func(data);
			}
			else
			{
				func(data,target);
			}
		}
		/**
		 * 获取函数的名称 
		 * @param fun
		 * @return 
		 * 
		 */		
		public static function getFuncName(fun:Function):String
		{
			try
			{
				Sprite(fun);
			}
			catch(err:Error)
			{
				var fn:String = err.message.replace(/.+::(\w+\/\w+)\(\)\}\@.+/,"$1");
				return fn==err.message?(err.message.replace(/.+ (function\-\d+) .+/i,"$1")):fn;
			}
			return null;
		}
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
					Logger.error("执行" + fun + "方法有错误：" + 
							FunctionUtils,error.getStackTrace());
				}
			}
		}
	}
}
