/**
 * @ResSharing.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-12
 */
package com.asframe.res
{
	import com.asframe.ASF;
	import com.asframe.collections.maps.HashMap;
	import com.asframe.lang.data.LoadBackData;
	import com.asframe.share.SharingPool;
	import com.asframe.utils.FunctionUtils;

	/**
	 * 资源共享管理对象.相同的url只会返回相同的资源。
	 * 注意该类的使用，当使用ResSharing获得的对象不需要使用时，一定要调用unResRefer方法进行回收
	 * 如果是正在加载中话，则需要调用unLoad进行卸载
	 * @author sodaChen
	 * #Date:2012-2-12
	 */
	public final class ResSharing implements IResSharing
	{
		/** 
		 * 资源管理对象,默认是ASF.resManager 
		 * @see com.asframe.ASF
		 */
		public var resManager			:IResManager = ASF.resManager;
		
		private static var instance		:ResSharing;
		
		private var resDataMap			:HashMap
		private var resShareHandle		:IResShareHandle;
		
		public function ResSharing(resShareHandle:IResShareHandle = null)
		{
			resDataMap = new HashMap();
			this.resShareHandle = resShareHandle;
		}
		/**
		 * 获得到资源共享的实例对象(调用的方法等同与ResSharing直接调用的静态方法) 
		 * @return 
		 * 
		 */		
		public static function getInstance():IResSharing
		{
			if(instance == null)
			{
				instance = new ResSharing();
			}
			return instance;
		}
		/**
		 * 加载资源 
		 * @param url 路径
		 * @param complete 成功回调函数
		 * @param target 目标参数，通过complete回调回来
		 * @param error 失败函数
		 * @param level 优先级 -1为直接加载，0为最低。越高越优先加载
		 * 
		 */		
		public static function load(url:String,
									complete:Function = null,
									target:* = null,
									error:Function = null,
									level:int = 0):void
		{
			getInstance().load(url,complete,target,error,level);
		}
		/**
		 * 取消资源的引用(对象不使用该资源时传入这里进行自动回收) 
		 * @param url
		 * 
		 */		
		public static function unResRefer(urlOrTarget:*,isDestory:Boolean = false):void
		{
			SharingPool.unrefer(urlOrTarget,isDestory);
		}
		
		/**
		 * 卸载掉还没加载完成的资源 
		 * @param url 资源路径
		 * @param complete 成功回调函数
		 */	
		public static function unLoad(url:String,complete:Function):void
		{
			getInstance().unLoad(url,complete);
		}
		public function setResShareHandle(resShareHandle:IResShareHandle):void
		{
			this.resShareHandle = resShareHandle;
		}
		/**
		* 加载资源 
		* @param url 路径
		* @param complete 成功回调函数
		* @param target 目标参数，通过complete回调回来
		* @param error 失败函数
		* @param level 优先级 -1为直接加载，0为最低。越高越优先加载
		* 
		*/		
		public function load(url:String,
									  complete:Function = null,
									  target:* = null,
									  error:Function = null,
									  level:int = 0):void
		{
			if(SharingPool.hasRefer(url))
			{
				return FunctionUtils.callFuncTarget(SharingPool.refer(url),complete,target);
			}
			var loadBackData:LoadBackData = resDataMap.get(url);
			if(loadBackData == null)
			{
//				loadBackData = PoolManager.borrowObject(LoadBackData);
				loadBackData = new LoadBackData();
				resDataMap.put(url,loadBackData);
				loadBackData.completes.push(complete);
				loadBackData.targets.push(target);
				loadBackData.errors.push(error);
				loadBackData.url = url;
				//这里如果resManager已经有资源，则是直接回调。所以需要预先加入complete
				resManager.load(url,onResLoad,url,onResError);
			}
			else
			{
				loadBackData.completes.push(complete);
				loadBackData.targets.push(target);
				loadBackData.errors.push(error);
			}
		}
		/**
		 * 卸载掉还没加载完成的资源 
		 * @param url 资源路径
		 * @param complete 成功回调函数
		 */
		public function unLoad(url:String,complete:Function):void
		{
			var loadBackData:LoadBackData = resDataMap.get(url);
			if(loadBackData == null)
			{
				return ;
			}
			loadBackData.remove(complete);
			if(loadBackData.completes.length == 0)
			{
				resManager.cancel(url,onResLoad);
				resDataMap.remove(url);
				loadBackData.destory();
			}
		}
		/**
		 * 取消资源的引用(对象不使用该资源时传入这里进行自动回收) 
		 * @param urlOrTarget 路径或者实例对象
		 */
		public function unResRefer(urlOrTarget:*,isDestroy:Boolean = false):void
		{
			SharingPool.unrefer(urlOrTarget,isDestroy);
		}
		private function onResLoad(data:*,url:String):void
		{
			var loadBackData:LoadBackData = resDataMap.remove(url);
			//进行数据转换
			if(resShareHandle != null)
				data = resShareHandle.getResShare(url,data);
			//添加但不引用
			SharingPool.addRefer(url,data,false);
			for (var i:int = 0; i < loadBackData.completes.length; i++) 
			{
				FunctionUtils.callFuncTarget(SharingPool.refer(url),loadBackData.completes[i],
					loadBackData.targets[i]);
			}
			loadBackData.destory();
		}
		private static function onResError():void
		{
			
		}
	}
}
class ResShareData
{
	public var url:String;
	public var complete:Function;
	public var target:*;
	
	public function destroy():void
	{
		url = null;
		complete = null;
		target = null;
	}
}
