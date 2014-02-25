/**
 * @IBytesPolicy.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-12
 */
package com.asframe.res
{
	import flash.utils.ByteArray;

	/**
	 * 字节资源管理策略，负责字节的添加，删除，以及自动回收
	 * @author sodaChen
	 * #Date:2012-2-12
	 */
	public interface IBytesPolicy
	{
		function addBytes(url:String,byte:ByteArray):void;
		/**
		 * 根据url获取到对应的byes，如果没有则返回null 
		 * @param url
		 * @return 二进制数据bytes
		 * 
		 */		
		function getBytes(url:String):ByteArray;
		function destoryBytes(url:String):void;
	}
}
