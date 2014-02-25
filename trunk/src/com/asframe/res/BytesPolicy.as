/**
 * @BytesPolicy.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-8-24
 */
package com.asframe.res
{
	import com.asframe.res.data.ByteDatas;
	import com.asframe.time.TimeMoveut;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * 二进制资源的策略
	 * @author sodaChen
	 * #Date:2012-2-12
	 */
	public class BytesPolicy implements IBytesPolicy
	{
		/** 最新加载的二进制数据缓存。新生代满了之后，会把全部数据移动老年代中 **/
		public static var YOUND_MAX:int = 1024 * 1024 * 32 //32MB;
		/** 老的加载的二进制数据缓存。当新生代数据来时，会清除全部老年代的数据 **/
		public static var OLD_MAX:int = 1024 * 1024 * 32 //32MB;
		
		/** 整体存放字节的集合 **/
		private var byteDic:Dictionary;
		/** 缓存列表 **/
		private var cacaeList:Vector.<Dictionary>;
		/** 新生代数据 **/
		private var youngDatas:ByteDatas;
		/** 老年代数据，年轻代满了之后，会合并到这里来，同时清空年轻代**/
		private var oldDatas:ByteDatas;
		
		public function BytesPolicy()
		{
			byteDic = new Dictionary();
			cacaeList = new Vector.<Dictionary>();
			youngDatas = new ByteDatas();
			oldDatas = new ByteDatas();
		}
		public function addBytes(url:String,byte:ByteArray):void
		{
			//全部，方便获取
			byteDic[url] = byte;
			//放进新的
			youngDatas.addBytes(url,byte);
			//删除老的引用
			oldDatas.removeBytes(url);
			//判断年轻的是否已经满了。这里如果太消耗性能，以后会用异步来处理
			if(youngDatas.byteLength >= YOUND_MAX)
			{
				TimeMoveut.startTime();
				//释放老年代.这里的绝对不会有新生代的url
				var urls:Array = oldDatas.clear();
				//销毁二进制数据
				for each (var tempUrl:String in urls) 
				{
					byte = byteDic[tempUrl];
					if(byte != null)
					{
						byte.clear();
						delete byteDic[tempUrl];
					}
				}
				var temp:ByteDatas = oldDatas;
				//老年代和新生代进行交换
				oldDatas = youngDatas;
				youngDatas = temp;
				TimeMoveut.traceTimeMoveut("BytesPolicy的年轻代缓存已满，释放资源花费时间是：");
			}
		}
		/**
		 * 根据url获取到对应的byes，如果没有则返回null 
		 * @param url
		 * @return 二进制数据bytes
		 * 
		 */		
		public function getBytes(url:String):ByteArray
		{
			var bytes:ByteArray = byteDic[url];
			if(bytes != null)
			{
				//放进新的
				youngDatas.addBytes(url,bytes);
				//删除老的引用
				oldDatas.removeBytes(url);
			}
			return bytes;
		}
		public function destoryBytes(url:String):void
		{
			var byte:ByteArray = byteDic[url];
			if(byte != null)
			{
				byte.clear();
			}
			delete byteDic[url];
		}
	}
}
