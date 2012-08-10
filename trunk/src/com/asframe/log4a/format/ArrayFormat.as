/**
 * @ArrayFormat.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-9-5
 */
package com.asframe.log4a.format
{
	import com.asframe.log4a.Log4aConst;

	/**
	 *
	 * @author sodaChen
	 * @Date:2011-9-5
	 */
	public class ArrayFormat implements IObjectFormat
	{
		public function ArrayFormat()
		{
		}
		
		public function getType():String
		{
			return Log4aConst.ARRAY;
		}
		
		public function toFormatString(object:Object):String
		{
			var ary:Array = object as Array;
			if(ary == null)
			{
				return "array is null";
			}
			var msg:String = "\n/////////////////[Array]////////////////\n{\n";
			var len:int = ary.length;
			msg + "长度:" + len + "\n";
			var obj:Object = null;
			for(var i:int = 0; i < len; i++)
			{
				msg = msg + "[value:" + ary[i] + "]\n";
			}
			msg = msg + "}\n///////////////////////////////////////////";
			return msg;
		}
	}
}
