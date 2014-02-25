/**
 * @KeyManager.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame EasyPlane
 * <br>Date:2012-10-20
 */
package com.asframe.managers
{
	import com.asframe.collections.maps.HashMap;
	
	import flash.display.Stage;
	import flash.events.KeyboardEvent;

	/**
	 * 键盘管理器，方便使用。
	 * 默认情况，是可以不用做任何按键的监听，直接用过检测isKeyDown方法来得知当前按下了那个按键
	 * @author sodaChen
	 * Date:2012-10-20
	 */
	public class KeyManager
	{
		public static const KEY_DOWN_EVENT:String = "keyDownEvent";
		public static const KEY_UP_EVENT:String = "keyUpEvent";
		public static const KEY_DOWN_UP_EVENT:String = "keyDownupEvent";
		
		/** 是否有按下键盘的动作 **/
		public static var keyDown:Boolean;
		/** 对象 **/
		private static const VALUE:Object = new Object();
		private static var stage:Stage;
		private static var downMap:HashMap;
		private static var downFunMap:HashMap;
		private static var upFunMap:HashMap;
		
		/**
		 * 初始化键盘管理器 ，注册键盘监听事件
		 * @param stage 舞台对象
		 * 
		 */		
		public static function init(stage:Stage):void
		{
			KeyManager.stage = stage;
			downMap = new HashMap();
			downFunMap = new HashMap();
			upFunMap = new HashMap();
			stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
		}
		/**
		 * 指定的key是否已经按下 
		 * @param key 指定按键的数字
		 * @return 是否按下
		 * 
		 */		
		public static function isKeyDown(key:uint):Boolean
		{
			return downMap.hasKey(key);
		}
		/**
		 * 添加监听的按键 
		 * @param key 按键
		 * @param fun 监听的回调函数
		 * @param type 事件类型，默认是按下
		 * 
		 */		
		public static function addListennerEvent(key:uint,fun:Function,type:String = "keyDownEvent"):void
		{
			if(type == KEY_DOWN_EVENT)
			{
				downFunMap.put(key,fun);
			}
			else if(type == KEY_UP_EVENT)
			{
				upFunMap.put(key,fun);
			}
			else
			{
				downFunMap.put(key,fun);
				upFunMap.put(key,fun);
			}
		}
		/**
		 * 删除指定的按键监听事件 
		 * @param key 按键
		 * @param type 事件类型，默认是按下
		 */		
		public static function removeListennerEvent(key:uint,type:String = "keyDownEvent"):void
		{
			if(type == KEY_DOWN_EVENT)
			{
				downFunMap.remove(key);
			}
			else if(type == KEY_UP_EVENT)
			{
				upFunMap.remove(key);
			}
			else
			{
				downFunMap.remove(key);
				upFunMap.remove(key);
			}
		}
		private static function onKeyDown(event:KeyboardEvent):void
		{
			keyDown = true;
			downMap.put(event.keyCode,VALUE);
			handleFun(downFunMap,event);
		}
		public static function onKeyUp(event:KeyboardEvent):void
		{
			keyDown = false;
			downMap.remove(event.keyCode);
			handleFun(upFunMap,event);
		}
		private static function handleFun(map:HashMap,event:KeyboardEvent):void
		{
			var fun:Function = map.get(event.keyCode);
			if(fun != null)
			{
				fun(event);
			}
		}
	}
}
