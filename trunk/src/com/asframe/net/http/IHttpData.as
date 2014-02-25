/**
 * @IHttpData.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-9-6
 */
package com.asframe.net.http
{
	/**
	 * Http数据格式的接口
	 * @author sodaChen
	 * Date:2012-9-6
	 */
	public interface IHttpData
	{
		/**
		 * 解码 
		 * @param context
		 * @return 
		 * 
		 */		
		function decode(context:*):*;
		/**
		 * 编码 
		 * @param context
		 * @return 
		 * 
		 */		
		function encode(context:*):*;
	}
}
