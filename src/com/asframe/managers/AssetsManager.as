/**
 * @AssetsManager.as.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:AVGGame
 * <br>Date:2013-9-2
 */
package com.asframe.managers
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.utils.MovieClipUtils;
	import com.asframe.utils.RefUtils;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	/**
	 * 资源管理器
	 * @author sodaChen
	 * Date:2013-9-2
	 */
	public class AssetsManager
	{
		/** 资源集合 **/
		private static var assetsMap:HashMap = new HashMap();
		public static function putAsset(key:String,asset:*):void
		{
			if(asset is Class)
			{
				asset = new asset();
			}
			else if(asset is String)
			{
				//直接反射
				asset = RefUtils.refImage(asset);
			}
			else if(asset is MovieClip)
			{
				MovieClip(asset).stop();
			}
			assetsMap.put(key,asset);
		}
		public static function removeAsset(key:String):*
		{
			return assetsMap.remove(key);
		}
		public static function destoryAsset(key:String):*
		{
			var asset:* = assetsMap.remove(key);
			if(asset is Bitmap)
			{
				Bitmap(asset).bitmapData.dispose();
			}
			else if(asset is BitmapData)
			{
				BitmapData(asset).dispose();
			}
			else if(asset is MovieClip)
			{
				MovieClipUtils.mcStopFrame(asset);
			}
			return asset;
		}
		public static function getBitmap(key:String):Bitmap
		{
			var asset:* = assetsMap.get(key);
			if(asset is BitmapData)
			{
				return new Bitmap(asset);
			}
			return asset;
		}
		public static function getBitmapData(key:String):BitmapData
		{
			var asset:* = assetsMap.get(key);
			if(asset is Bitmap)
			{
				return Bitmap(asset).bitmapData;
			}
			return asset;
		}
		public static function getSprite(key:String):Sprite
		{
			return assetsMap.get(key);
		}
		public static function getMovieClip(key:String):MovieClip
		{
			var movieClip:MovieClip = assetsMap.get(key);
			movieClip.gotoAndStop(1);
			return movieClip;
		}
	}
}
