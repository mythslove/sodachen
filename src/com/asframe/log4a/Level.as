/**
 * @Level.as.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-9-4
 */
package com.asframe.log4a
{
	/**
	 * 日志级别对象
	 * @author sodaChen
	 * Date:2011-9-4
	 */
	public class Level
	{
		public static const TRACE:Level = new Level(1000,"trace");
		public static const DEBUG:Level = new Level(10000,"debug");
		public static const INFO:Level = new Level(10000,"info");
		public static const WARN:Level = new Level(100000,"warn");
		public static const ERROR:Level = new Level(100000,"error");
		/** 级别数值 **/
		public var level:int;
		/** 级别名称 **/
		public var levelName:String;
		
		public function Level(level:int,levelName:String)
		{
			this.level = level;
			this.levelName = levelName;
		}
		public function toString():String
		{
			return "[level=" + level + " levelName=" + levelName + "]";
		}
	}
}
