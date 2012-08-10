/**
 * @LoaderFactory.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-24
 */
package com.asframe.load
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
	import com.asframe.load.byte.ByteLoader;

	/**
	 *
	 * @author sodaChen
	 */
	public final class LoaderFactory
	{
		private static var loadClassMap:IMap = new HashMap();
		private static var isInit:Boolean;
		
		/**
		 * 初始化默认的Loader加载器 
		 * 
		 */		
		public static function initLoader():void
		{
			isInit = true;
			loadClassMap.put(LoadConst.DISPLAY_LOAD_TYPE,DisplayLoader);
			parseLoader(LoadConst.BITMAP_LOAD_TYPE,DisplayLoader);
			parseLoader(LoadConst.TEXT_LOAD_TYPE,TextLoader);
		}
		private static function parseLoader(types:String,clazz:Class):void
		{
			var ary:Array = types.split(",");
			for each (var i:String in ary) 
			{
				loadClassMap.put(i,clazz);
			}
			
		}
		public static function addLoader(type:String,loderClass:Class):void
		{
			loadClassMap.put(type,loderClass);
		}
		public static function createLoaderByUrl(url:String):ILoader
		{
			return createLoader(LoadUtils.getUrlType(url));
		}
		/**
		 * 创建一个新的加载器 
		 * @param url
		 * @return 
		 * 
		 */		
		public static function createLoader(loadType:String):ILoader
		{
			if(!isInit)
			{
				initLoader();
			}
			var loader:ILoader = null;
			var cl:Class = loadClassMap.get(loadType) as Class;
			if(cl != null)
			{
				loader = new cl() as ILoader;
			}
			else
			{
				loader = new ByteLoader();
			}
			loader.setType(loadType);
			return loader;
		}
	}
}
