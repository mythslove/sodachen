/**
 * @UIManager.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-10-11
 */
package com.asframe.managers
{
	import flash.display.Sprite;

	/**
	 * UI管理器，实现UI的拖动，置顶，深度交换，焦点置顶，同组排斥，异组排斥
	 * @author sodaChen
	 * Date:2012-10-11
	 */
	public class UIManager
	{
		private static var uiContainer:Sprite;
		
		public static function setUIContainer(uiContainer:Sprite):void
		{
			UIManager.uiContainer = uiContainer;
		}
		
		public static function addUI(	uiName:String,
										ui:Sprite,
										isDrag:Boolean = true,
										isSwap:Boolean = true,
										isAlone:Boolean = false,
										group:String = "group",
										depth:int = 0,
										mutexViews:Array = null,
										mutexGroups:Array = null
										):void
		{
			
		}
		public static function removeUI():void
		{
			
		}
	}
}
