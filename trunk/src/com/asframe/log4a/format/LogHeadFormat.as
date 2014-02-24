/**
 * @LogHeadFormat.as.as
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
	import com.asframe.log4a.Level;
	
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2011-9-5
	 */
	public class LogHeadFormat implements ILogHeadFormat
	{
		private var classMap:Dictionary;
		
		public function toHeadFormat(targetPath:String,level:Level):String
		{
//			var msg:String = classMap[target] as String;
//			if(msg == null)
//			{
//				var className:String = getQualifiedClassName(target);
//				className = className.substring(className.indexOf("::") + 2);
//				msg = "[" + className + "]";
//				classMap[target] = msg;
//			}
			return "[" + level.levelName + "][" + targetPath + "]";
		}
	}
}
