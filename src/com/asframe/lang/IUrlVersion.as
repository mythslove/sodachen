/**
 * @IUrlVersion.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-3-4
 */
package com.asframe.lang
{
	/**
	 * 网络路径的版本接口
	 * @author sodaChen
	 * Date:2012-3-4
	 */
	public interface IUrlVersion
	{
		/**
		 * 设置URL的参数 
		 * @param urlHead:路径头
		 * @param version:版本号(路径末)
		 * 
		 */
		function setUrlVersion(urlHead:String,version:String):void;
	}
}
