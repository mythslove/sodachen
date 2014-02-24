/**
 * @ObjectFormat.as.as
 * 
 * @author sodaChen mail:asframe#163.com
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
	 * Object基类的输出格式
	 * @author sodaChen
	 * Date:2011-9-5
	 */
	public class ObjectFormat implements IObjectFormat
	{
		public function ObjectFormat()
		{
		}
		
		public function getType():String
		{
			return Log4aConst.OBJECT;
		}
		
		public function toFormatString(object:Object):String
		{
			var msg:String = "\n/////////////////[Object]////////////////\n{\n";
			var flag:Boolean = true;
			for(var key:Object in object)
			{
				flag = false;
				msg = msg + "	[key:" + key + "]	[value:" + object[key].toString() + "]\n";
			}
			msg = msg + "}\n///////////////////////////////////////////";
			if(flag)
			{
				msg = object.toString();
			}
			return msg;
		}
	}
}
