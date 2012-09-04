/**
 * @UrlVersion.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-3-4
 */
package com.asframe.lang.impl
{
	import com.asframe.lang.IUrlVersion;
	
	import flash.utils.ByteArray;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-3-4
	 */
	public class UrlVersion implements IUrlVersion
	{
		protected var urlHead:String;
		protected var version:String;
		
		public function UrlVersion()
		{
			urlHead = ""; 
			version = ""; 
		}
		public function setUrlVersion(urlHead:String,version:String):void
		{
			if(urlHead != null && urlHead != "")
			{
				if(urlHead.indexOf("/") != (urlHead.length - 1))
				{
					urlHead = urlHead + "/";
				}
				this.urlHead = urlHead;
			}
			if(version != null && version != "")
			{
				if(version.indexOf("?=") == -1)
				{
					version = "?=" + version;
				}
				this.version = version;
			}
		}
		public function getFullUrl(url:String):String
		{
			return urlHead + url + version;
		}
//		public function set urlHead(_urlHead:String):void
//		{
//			this._urlHead = _urlHead;
//		}
//		
//		public function get urlHead():String
//		{
//			return _urlHead;
//		}
//		
//		public function set version(_version:String):void
//		{
//			this.version = version;
//		}
//		
//		public function get version():String
//		{
//			return _version;
//		}
	}
}
