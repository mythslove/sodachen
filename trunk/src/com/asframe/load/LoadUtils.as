/**
 * @LoadUtils.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-23
 */
package com.asframe.load
{
	/**
	 * load相关使用到的一些辅助工具
	 * @author sodaChen
	 */
	public class LoadUtils
	{
		public static function hasLoadType(type:String,url:String):Boolean
		{
			return url.indexOf(type) != -1;
		}
		public static function getUrlType(url:String):String
		{
			var strs:Array = url.split(".");
			return strs[1].split("?")[0];
		}
	}
}
