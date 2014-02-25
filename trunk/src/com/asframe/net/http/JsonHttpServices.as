/**
 * @JsonHttpServices.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-10-20
 */
package com.asframe.net.http
{
	import com.asframe.net.http.data.JsonHttpData;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-10-20
	 */
	public class JsonHttpServices extends URLoaderHttp
	{
		private static var jsonHttpData:JsonHttpData = new JsonHttpData();
		
		public function JsonHttpServices(urlHead:String=null)
		{
			super(jsonHttpData, urlHead);
		}
	}
}
