/**
 * @AutoLoadRes.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-7-5
 */
package com.asframe.metadata.res
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.ByteArray;

	/**
	 *
	 * @author sodaChen
	 * @Date:2012-7-5
	 */
	[Res(url="res/bitmap.png",type="bmp",callBack="testMethod")]
	[Res(url="res/mc.swf",type="mc")]
	[Res(url="res/bytes.byte",type="byte")]
	public class AutoLoadRes implements IResInit,IResMetadata
	{
		[Res(url="res/bitmap.png")]
		public var bitmap:Bitmap;
		[Res(url="res/mc.swf")]
		public var sprite:Sprite;
		[Res(url="res/bytes.byte")]
		public var bytes:ByteArray;
		
		public function AutoLoadRes()
		{
			trace(bitmap);
			trace(sprite);
			trace(bytes);
		}
		/**
		 *  初始化完成的回调接口
		 */		
		public function resInit():void
		{
			//只有系统调用了该方法之后，配置的Res属性才有值
			trace("==================全部资源加载完成了==================");
			trace(bitmap);
			trace(sprite);
//			trace(bytes);
		}
		public function testMethod(data:*,url:String):void
		{
			if(data is ByteArray)
			{
				trace("initRes dta:ByteArray url:" + url);
			}
			else
			{
				trace("initRes dta:" + data + " url:" + url);
			}
		}
		/**
		 * 资源加载好之后调用的回调方法 
		 * @param data 加载后的资源
		 * @param url 配置的url路径
		 */			
		public function initRes(data:*,url:String):void
		{
			if(data is ByteArray)
			{
				trace("initRes dta:ByteArray url:" + url);
			}
			else
			{
				trace("initRes dta:" + data + " url:" + url);
			}
		}
	}
}
