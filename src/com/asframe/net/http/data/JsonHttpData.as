/**
 * @JsonHttpData.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-9-7
 */
package com.asframe.net.http.data
{
	import com.asframe.net.http.IHttpData;
	
	/**
	 * Json的格式解析和封装
	 * @author sodaChen
	 * Date:2012-9-7
	 */
	public class JsonHttpData implements IHttpData
	{
		public function decode(context:*):*
		{
			return JSON.parse(context);
		}
		
		public function encode(context:*):*
		{
			return JSON.stringify(context);
		}
	}
}
