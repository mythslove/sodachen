/**
 * @PublicObjectManager.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-6-22
 */
package com.asframe.share
{
	import com.asframe.collections.maps.MultiKeyMap;

	/**
	 * 公共对象管理器
	 * @author sodaChen
	 * #Date:2013-6-22
	 */
	public class PublicObject
	{
		private static var objMap:MultiKeyMap = new MultiKeyMap();
		/**
		 * 放到公共管理中 
		 * @param key 唯一标识
		 * @param obj 实例对象
		 * @param isPool 不使用时是否放回池中
		 * 
		 */		
		public static function putPublic(key:String,obj:*,isPool:Boolean):void
		{
			if(!objMap.hasKey(key))
			{
				var data:PublicData = new PublicData(key,obj,isPool);
				objMap.puts(data,key,obj);
			}
		}
		public static function borrow(key:String):*
		{
			var data:PublicData = objMap.get(key);
			if(data == null)
			{
				throw new Error(key + "没有对应的公共对象");
			}
			data.time++;
			return data.obj;
		}
		public static function giveback(obj:*):void
		{
			var data:PublicData = objMap.get(obj);
			if(data == null)
			{
				throw new Error(obj + "没有对应的公共对象数据");
			}
			data.time--;
			if(data.time <= 0)
			{
				if(data.isPool)
				{
					//放回对象池
				}
			}
		}
	}
}
class PublicData
{
	public var key:String;
	public var obj:*;
	public var isPool:Boolean;
	public var time:int;
	public function PublicData(key:String,obj:*,isPool:Boolean)
	{
		this.key = key;
		this.obj = obj;
		this.isPool = isPool;
	}
}
