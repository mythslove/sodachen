/**
 * @LoadData.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Lion3D
 * <br>Date:2013-10-24
 */
package com.asframe.res.data
{
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;

	/**
	 *
	 * @author sodaChen
	 * #Date:2013-10-24
	 */
	public class LoadByteData
	{
		public var loader:URLLoader;
		public var request:URLRequest;
		
		public function LoadByteData()
		{
			loader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.BINARY;
			request = new URLRequest();
		}
	}
}
