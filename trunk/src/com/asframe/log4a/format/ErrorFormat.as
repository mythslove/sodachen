/**
 * @ErrorFormat.as.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-9-7
 */
package com.asframe.log4a.format
{
	import com.asframe.log4a.Log4aConst;

	/**
	 *
	 * @author sodaChen
	 * Date:2011-9-7
	 */
	public class ErrorFormat implements IObjectFormat
	{
		public function ErrorFormat()
		{
		}
		
		public function getType():String
		{
			return Log4aConst.ERROR;
		}
		
		public function toFormatString(object:Object):String
		{
			if(object == null)
			{
				return "error is null";
			}
			try
			{
				var error:Error = Error(object);
				return error.getStackTrace();
			}
			catch(e:Error)
			{
				return object + e.getStackTrace();
			}
			return "";
		}
	}
}
