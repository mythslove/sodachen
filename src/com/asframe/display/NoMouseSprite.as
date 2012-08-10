/**
 * @NoMouseSprite.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-6-26
 */
package com.asframe.display
{
	import flash.display.Sprite;
	
	/**
	 * 默认禁止了鼠标和Tab事件的Sprite基类
	 * @author sodaChen
	 * @Date:2012-6-26
	 */
	public class NoMouseSprite extends Sprite
	{
		public function NoMouseSprite()
		{
			super();
			enabledMouseEvent(false);
			enabledTabEvent(false);
		}
		/**
		 * 是否开启对象的鼠标以及子类的鼠标事件 
		 * @param isdan
		 * 
		 */		
		public function enabledMouseEvent(isdan:Boolean):void
		{
			mouseChildren = isdan;
			mouseEnabled = isdan;
		}
		public function enabledTabEvent(isdan:Boolean):void
		{
			tabChildren = isdan;
			tabEnabled = isdan;
		}
	}
}
