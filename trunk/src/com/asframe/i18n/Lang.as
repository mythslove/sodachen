/**
 * @Lang.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:HomePage
 * <br>Date:2012-8-12
 */
package com.asframe.i18n
{
	import com.asframe.conf.ConfigManager;
	

	/**
	 * 国际化语言对象
	 * @author sodaChen
	 * Date:2012-8-12
	 */
	public class Lang
	{
		/** 存放内容的对象 **/
		public static var contents:Object;
		
		private static var onComplete:Function;
		
		public static function init(value:*,onComplete:Function = null):void
		{
			if(value is String)
			{
				Lang.onComplete = onComplete;
				ConfigManager.loadConfig(value,onLoader);
			}
			else
			{
				contents = value;
			}
		}
		
		private static function onLoader(contents:Object):void
		{
			Lang.contents = contents;
			if(Lang.onComplete != null)
			{
				Lang.onComplete();
				Lang.onComplete = null;
			}
		}
		/**
		 * 获取到语言内容 
		 * @param key 指定的key
		 * @return 返回和key对应的内容
		 * 
		 */		
		public static function getLang(key:String):String
		{
			return contents[key];
		}
	}
}
