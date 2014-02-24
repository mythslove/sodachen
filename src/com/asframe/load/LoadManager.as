/**
 * @LoadManager.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Load
 * <br>Date:2012-2-29
 */
package com.asframe.load
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.load.multi.IMultiLoader;
	import com.asframe.load.multi.QueueLoader;
	import com.asframe.loading.ILoading;

	/**
	 * 加载管理，负责加载一些常用的数据，直接进行加载.一般简单的加载，可以采用，直接加载，方便实用.目前只是采用一个默认的同步加载器
	 * @author sodaChen
	 * Date:2012-2-29
	 */
	public class LoadManager
	{
		/** 版本号 **/
		private static var version:String = "";
		/*private 资源头路径 **/
		private static var headPath:String = "";
		/** 默认loading界面 **/
		public static var defaulteLoading:ILoading;
		/** 默认是同步加载器 **/
//		public static var mutilLoader:IMultiLoader = new SameLoader();
		public static var mutilLoader:IMultiLoader = new QueueLoader();
		
		private static var loadMap:HashMap = new HashMap();
		
		public static function setHeadVersion(headPath:String,version:String):void
		{
			LoadManager.headPath = headPath;
			LoadManager.version = version;
			mutilLoader.setUrlVersion(headPath,version);
		}
		/**
		 * 加载资源(可以传入字符串或者字符串数字)
		 * 
		 * @param url:路径
		 * @param sucessResult:成功回调函数
		 * @param loading:loading条
		 * 
		 */		
		public static function load(url:*,
									sucessResult:Function = null,
									target:* = null,
									type:String = null):void
		{
			mutilLoader.setType(type);
//			mutilLoader.setUrlVersion(headPath,version);
			var isOne:Boolean = url is Array;
			if(!(url is Array))
			{
				url = [url];
			}
			var fun:Function = function(results:Array):void
			{
				var data:* = results[0];
				if(isOne)
				{
					data = results;
				}
				if(target == null)
				{
					sucessResult(data);
				}
				else
				{
					sucessResult(data,target);
				}
			}
			mutilLoader.load(url,fun,null);
		}
		/**
		 * 每次加载都会重新初始化一个新的ILoader对象(自动根据资源的后缀选择适合的loader) 
		 * @param url
		 * @param sucessResult
		 * @param target
		 * @param loading
		 * 
		 */		
		public static function loadByNew(url:String,
										 sucessResult:Function = null,
										 target:* = null,
										 loadType:String = null):void
		{
			//每次都是重新new 一个新的loader
			var loader:ILoader = null;
			if(loadType == null)
			{
				loader = LoaderFactory.createLoaderByUrl(url);
			}
			else
			{
				loader = LoaderFactory.createLoader(loadType);
			}
			var obj:Object = {};
			obj.loader = loader;
//			url = headPath + url + version;
			loader.setUrlVersion(headPath,version);
			loadMap.put(loader,loader);
			var fun:Function = function(data:*):void
			{
				loadMap.remove(loader);
				if(target == null)
				{
					sucessResult(data);
				}
				else
				{
					sucessResult(data,target);
				}
			};
			loader.load(url,fun);
		}
	}
}
