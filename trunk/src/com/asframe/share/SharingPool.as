/**
 * @SharingPool.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-8-22
 */
package com.asframe.share
{
	import com.asframe.ASF;
	import com.asframe.utils.DestroyUtils;
	
	import flash.utils.Dictionary;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;

	/**
	 * 共享对象池，提供引用次数的计算
	 * @author sodaChen
	 * #Date:2013-8-22
	 */
	public class SharingPool
	{
		private static var refMap			:Dictionary = new Dictionary();
		private static var targetMap		:Dictionary = new Dictionary();
		/**
		 * 添加一个引用共享对象 
		 * @param key 唯一key
		 * @param target 共享对象
		 * @param isRefer 是否马上增加一次引用
		 * 
		 */		
		public static function addRefer(key:String,target:*,isRefer:Boolean = true):void
		{
			var referData:ReferData = refMap[key];
			if (referData != null)
			{
				throw new Error(key + "重复添加Refer");	
			}
			if (target == null)
			{
				throw new Error("target为空！");	
			}
//			referData = PoolManager.borrowObject(ReferData);
			referData = new ReferData();
			refMap[key] = referData;
			targetMap[target] = referData;
			referData.key = key;
			referData.target = target;
			if(isRefer)
			{
				referData.refCount++;
			}
		}
		/**
		 * 指定的key是否存在共享对象的引用 
		 * @param key 唯一
		 * @return true则表示存在，否则不存在
		 * 
		 */		
		public static function hasRefer(key:String):Boolean
		{
			return refMap[key] != null;
		}
		/**
		 * 指定key取得一个公共引用对象（对象的引用次数会增加1） 如果没有对象则会抛出异常
		 * @param key 唯一字符串
		 * @return 公共对象
		 * 
		 */		
		public static function refer(key:String):*
		{
			var referData:ReferData = refMap[key];
			if (referData == null)
			{
				throw new Error(key + "没有对应的Refer，请先添加");	
			}
			referData.refCount++;
			if(referData.timeId != 0)
			{
				clearTimeout(referData.timeId);
				referData.timeId = 0;
			}
			return referData.target;
		}
		/**
		 * 取消一次公共对象的引用 
		 * @param keyOrTarget 唯一key或者共享对象实例
		 * @param isDestroy 立刻销毁对象，否则是引用次数为0时30秒后销毁
		 * 
		 */		
		public static function unrefer(keyOrTarget:*,isDestroy:Boolean = false):void
		{
			//优先从key取值
			var referData:ReferData = refMap[keyOrTarget];
			if (referData == null)
			{
				referData = targetMap[keyOrTarget];
				if (referData == null)
				{
					return ;
				}
			}
			referData.refCount--;
			if (referData.refCount == 0)
			{
				if(isDestroy)
				{
					//强制销毁，没有延迟
					recover(referData);
				}
				else
				{
					//ASF.sharingPoolDelay后清除资源
					referData.timeId = setTimeout(recover,ASF.sharingPoolDelay,referData);
				}
			}
		}
		private static function recover(referData:ReferData):void
		{
			clearTimeout(referData.timeId);
			if (referData.refCount > 0)
			{
				return;
			}
			//资源进行销毁
			delete refMap[referData.key];
			delete targetMap[referData.target];
			//判断是否销毁实例
			var target:* = referData.target;
			referData.destroy();
			DestroyUtils.destroyObj(target);
		}
	}
}



class ReferData
{
//	public static var map:HashMap = new HashMap();
//	public static var count:int;
	public var timeId:Number;
	public var key:String;
	public var target:*;
	public var refCount:int;
//	public var index:int;
	
	public function ReferData()
	{
//		count++;
//		index = count;
	}
	
	public function destroy():void
	{
		key = null;
		target = null;
		refCount = 0;
//		trace(index + "销毁了"); 
//		map.put(index,this);
//		PoolManager.returnObject(this,ReferData);
	}
}
