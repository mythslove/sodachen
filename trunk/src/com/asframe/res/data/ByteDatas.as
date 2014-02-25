/**
 * @ByteDatas.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-11-7
 */
package com.asframe.res.data
{
	import com.asframe.lang.IDestory;
	import com.asframe.res.BytesPolicy;
	
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	/**
	 * 字节数据内容
	 * @author sodaChen
	 * Date:2013-11-7
	 */
	public class ByteDatas
	{
		public var byteLength:int;
		public var byteDic:Dictionary;
		
		public function ByteDatas()
		{
			byteDic = new Dictionary();
		}
		/**
		 * 添加一个二进制数据（bytes），通过url绑定 
		 * @param url
		 * @param bytes
		 * 
		 */		
		public function addBytes(url:String,bytes:ByteArray):void
		{
			if(byteDic[url] == null)
			{
				byteDic[url] = bytes;
				byteLength += bytes.length;
			}
		}
//		/**
//		 * 接收的ByteDatas对象二进制数据，如果内存大于老年代的，则返回掉多余的二进制数据url数组
//		 * @param byteDatas 需要整合的ByteDatas,这里为新生代数据
//		 * @return 
//		 * 
//		 */		
//		public function concat(byteDatas:ByteDatas):Array
//		{
//			var urls:Array = clear();
//			//新的全部并入老的里面
//			var bytes:ByteArray = null;
//			for (var url:String in byteDatas.byteDic) 
//			{
//				if(byteLength >= BytesPolicy.OLD_MAX)
//				{
//					//老年代的已经满了，直接放在urls里进行销毁了
//					urls.push(url);
//					continue;
//				}
//				bytes = byteDatas.byteDic[url];
//				addBytes(url,bytes);
//			}
//			//新生代（传入对象）成为新的
//			byteDatas.byteDic = new Dictionary();
//			byteDatas.byteLength = 0;
//			return urls;
//		}
		/**
		 * 删除指定url的字节的引用，但是不会释放字节的内存空间 
		 * @param url
		 * 
		 */		
		public function removeBytes(url:String):void
		{
			var bytes:ByteArray = byteDic[url];
			if(bytes != null)
			{
				byteLength -= bytes.length;
				byteDic[url] = null;
				delete byteDic[url];
			}
		}
		/**
		 * 清除掉对url的引用，并返回url的数组。同时会把byte的长度归零。
		 * @return 
		 * 
		 */		
		public function clear():Array
		{
			var urls:Array = [];
			for (var url:String in byteDic) 
			{
				urls.push(urls);
				byteDic[url] = null;
				delete byteDic[url];
			}
//			byteDic = new Dictionary();
			byteLength = 0;
			return urls;
		}
	}
}
