/**
 * @URLUtils.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:HomePage
 * <br>Date:2012-10-25
 */
package com.asframe.utils
{
	/**
	 *
	 * @author sodaChen
	 * Date:2012-10-25
	 */
	public class URLUtils
	{
		public static function getUrlHead(urlHead:String):String
		{
			if(urlHead != null && urlHead != "")
			{
				if(urlHead.indexOf("/") != (urlHead.length - 1))
				{
					urlHead = urlHead + "/";
				}
				return urlHead;
			}
			return "";
		}
		public static function getVersion(version:String):String
		{
			if(version != null && version != "")
			{
				if(version.indexOf("?v=") == -1)
				{
					version = "?v=" + version;
				}
				return version;
			}
			return "";
		}
	}
}
