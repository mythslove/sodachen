/**
 * @SameLoader.as
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
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
	import com.asframe.load.ILoader;
	import com.asframe.load.LoadConst;
	import com.asframe.load.LoadData;
	import com.asframe.load.LoadUtils;
	import com.asframe.load.LoaderFactory;
	import com.asframe.load.byte.ByteLoader;
	import com.asframe.loading.ILoading;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;

	/**
	 * 并发加载器
	 * @author sodaChen
	 */
	public class SameLoader extends AbstraceMultiLoader
	{
		/** 同时加载的数量 **/
		private var sameLoadCount			:int;
		/** 加载器的集合 **/
		private var sameLoadMap				:IMap;
		
		public function SameLoader(sameLoadCount:int = 0)
		{
			sameLoadMap = new HashMap();
			if(sameLoadCount == 0)
			{
				sameLoadCount = LoadConst.DEFAULT_SAME_LOADER_COUNT;
			}
			this.sameLoadCount = sameLoadCount;
		}
		public override function getClass():Class
		{
			return SameLoader;
		}
		public function setSameLoadCount(sameLoadCount:int):void
		{
			this.sameLoadCount = sameLoadCount;
		}

		protected override function startMultiLoad():void
		{
			super.startMultiLoad();
			var len:int = urls.length;
			if(len > sameLoadCount)
			{
				len = sameLoadCount;
			}
			for (var i:int = 0; i < len; i++) 
			{
//				nextLoad(urls.shift());
				nextLoader.nextLoad(urls.shift(),currentMultiBean.target,onOneComplete);
			}
		}
		/**
		 * 重写单个加载成功 
		 * @param event
		 * 
		 */		
		protected override function onOneComplete(loadData:LoadData):void
		{
			sameLoadMap.remove(loadData.loader);
			super.onOneComplete(loadData);
		}
		protected override function onOneIoError(loadData:LoadData):void
		{
			sameLoadMap.remove(loadData.loader);
			super.onOneIoError(loadData);
		}
		protected override function hasNext():Boolean
		{
			//没有需要加载的url和当前没有存放加载loader了(全部加载完成)
			if(urls.length == 0 && sameLoadMap.size() == 0)
			{
				return false;
			}
			return true;
		}
		/**
		 * 并发的时候,在获取到加载器的时候进行处理
		 * @param loadType
		 * @return 
		 * 
		 */		
		protected override function getLoader(loadType:String):ILoader
		{
			if(isByteLoad)
			{
				loadType = "byteLoader";
			}
			var loader:ILoader = null;
			var ary:Array = loaderMap.get(loadType);
			if(ary == null || ary.length == 0)
			{
				if(isByteLoad)
				{
					loader = new ByteLoader();
				}
				else
				{
					loader =  LoaderFactory.createLoader(loadType);
				}
				loader.setUrlVersion(urlHead,version);
			}
			else
			{
				loader = ary.pop();
			}
			sameLoadMap.put(loader,value);
			return loader;
		}
		/**
		 * 返回时用的加载器,达到循环时用的目的 
		 * @param loader
		 * 
		 */		
		private function returnLoader(loader:ILoader):void
		{
			var ary:Array = loaderMap.get(loader.getType());
			if(ary == null)
			{
				ary = [];
				loaderMap.put(loader.getType(),ary);
			}
			ary.push(loader);
		}
	}
}
