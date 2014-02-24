/**
 * @ByteQueueLoader.as.as
 * 
 * @author sodaChen mail:asframe#qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-3-29
 */
package com.asframe.load
{
	import com.asframe.lang.impl.UrlVersion;
	import com.asframe.loading.ILoading;
	
	import flash.net.URLLoader;
	import flash.system.ApplicationDomain;
	
	/**
	 * 以队列的方式来加载二进制数据，单纯地加载，性能得以保障
	 * @author sodaChen
	 * Date:2013-3-29
	 */
	public class ByteQueueLoader extends UrlVersion
	{
		private var loader:URLLoader;
		
		public function ByteQueueLoader()
		{
			loader = new URLLoader();
		}
		
		public function setApplicationDomain(app:ApplicationDomain):void
		{
		}
		
		public function setLoading(loading:ILoading):void
		{
		}
		
		public function isLoading():Boolean
		{
			return false;
		}
		
		public function addFailResult(failResult:Function):void
		{
		}
		
		public function load(url:*, sucessResult:Function=null, target:*=null):void
		{
		}
		
		public function dispose(o:*=null):void
		{
		}
		
		public override function setUrlVersion(urlHead:String, version:String):void
		{
		}
	}
}