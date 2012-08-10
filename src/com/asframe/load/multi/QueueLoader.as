/**
 * @QueueLoader.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-21
 */
package com.asframe.load.multi
{
	import com.asframe.load.ILoader;
	import com.asframe.load.LoadData;
	import com.asframe.load.LoadUtils;
	import com.asframe.load.LoaderFactory;
	import com.asframe.load.byte.ByteLoader;
	import com.asframe.loading.ILoading;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;

	/**
	 * 队列加载器
	 * @author sodaChen
	 */
	public class QueueLoader extends AbstraceMultiLoader
	{
		public function QueueLoader()
		{
		}
		public override function getClass():Class
		{
			return QueueLoader;
		}
		protected override function startMultiLoad():void
		{
			super.startMultiLoad();
			nextLoader.nextLoad(urls.shift(),currentMultiBean.target,onOneComplete);
		}
		/**
		 * 获取到资源加载器(默认是取出单个)
		 * @param url
		 * @return 
		 * 
		 */
		protected override function getLoader(loadType:String):ILoader
		{
			if(isByteLoad)
			{
				return getByteLoader();
			}
			var loader:ILoader = loaderMap.get(loadType);
			if(loader == null)
			{
				loader = LoaderFactory.createLoader(loadType);
				loader.setUrlVersion(urlHead,version);
				loaderMap.put(loadType,loader);
			}
			return loader;
		}
		protected function getByteLoader():ILoader
		{
			var loader:ILoader = loaderMap.get("byteLoader");
			if(loader == null)
			{
				loader = new ByteLoader();
				loader.setUrlVersion(urlHead,version);
				loaderMap.put("byteLoader",loader);
			}
			return loader;
		}
	}
}
