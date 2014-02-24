/**
 * @UrlVersion.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-3-4
 */
package com.asframe.lang.impl
{
	import com.asframe.lang.IUrlVersion;
	import com.asframe.utils.URLUtils;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2012-3-4
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
			this.urlHead = URLUtils.getUrlHead(urlHead);
			this.version = URLUtils.getVersion(version);
		}
		public function getFullUrl(url:String):String
		{
			return urlHead + url + version;
		}
	}
}
