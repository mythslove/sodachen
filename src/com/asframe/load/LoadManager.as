/**
 * @LoadManager.as
 * 
 * @author sodaChen mail:asframe@163.com
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
	import com.asframe.load.multi.SameLoader;
	import com.asframe.loading.ILoading;

	/**
	 * 加载管理，负责加载一些常用的数据，直接进行加载.一般简单的加载，可以采用，直接加载，方便实用.目前只是采用一个默认的同步加载器
	 * @author sodaChen
	 * @Date:2012-2-29
	 */
	public class LoadManager
	{
		/** 默认loading界面 **/
		public static var defaulteLoading:ILoading;
		/** 默认是同步加载器 **/
		public static var mutilLoader:IMultiLoader = new SameLoader();
		
		private static var loadMap:HashMap = new HashMap();
		/**
		 * 加载资源(可以传入字符串或者字符串数字)
		 * 
		 * @param url:路径
		 * @param sucessResult:成功回调函数
		 * @param loading:loading条
		 * 
		 */		
		public static function load(url:*,sucessResult:Function = null,target:* = null,loading:ILoading = null):void
		{
			if(loading == null)
			{
				loading = defaulteLoading;
			}
			mutilLoader.load(url,sucessResult,target,loading);
		}
		
		public static function loadByNew(url:String,sucessResult:Function = null,target:* = null,loading:ILoading = null):void
		{
			if(loading == null)
			{
				loading = defaulteLoading;
			}
			//每次都是重新new 一个新的loader
			var loader:ILoader = LoaderFactory.createLoaderByUrl(url);
			loadMap.put(loader,loader);
			loader.load(url,function(loadData:LoadData):void
							{
								loadMap.remove(loadData.loader);
								sucessResult(loadData);
								loadData.loader.dispose();
							},target,loading);
		}
	}
}
