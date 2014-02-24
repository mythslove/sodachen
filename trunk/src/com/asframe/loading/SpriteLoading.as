/**
 * @SpriteLoading.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:SimpleLion
 * <br>Date:2013-5-22
 */
package com.asframe.loading
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 *
	 * @author sodaChen
	 * #Date:2013-5-22
	 */
	public class SpriteLoading extends Sprite implements ILoading
	{
		/** 最大帧数 **/
		public var maxFrame					:int;
		/**
		 * 背景影片对象 
		 */		
		protected var backgroundMC			:MovieClip;
		/** 提示信息文本框 **/
		protected var tipText				:TextField;
		
		public function SpriteLoading()
		{
			maxFrame = 100;
		}
		/**
		 * 设置提示文本的提示信息 
		 * @param text:提示文本对象
		 * @param tip:提示信息
		 * @param isHtml:是否以html的格式显示
		 * 
		 */		
		protected function setTextTip(text:TextField,tip:String, isHtml:Boolean):void
		{
			if(text != null)
			{
				if(isHtml)
				{
					text.htmlText = tip;
				}
				else
				{
					text.text = tip;
				}
			}
		}
		public function setTip(tip:String, isHtml:Boolean = false):void
		{
			setTextTip(tipText,tip,isHtml);
		}
		
		public function setBackground(background:*):void
		{
			if(background is MovieClip)
			{
				this.backgroundMC = background;
				if(background["tipText"] != null)
				{
					tipText = background["tipText"];
				}
				if(backgroundMC.parent == null)
				{
					addChild(background);
				}
			}
		}
		
		public function getContainer():Sprite
		{
			return this;
		}
		
		public function progress(current:int, max:int):void
		{
			//默认是100帧的动画
			var step:int = Math.floor(current / max) * maxFrame;
			if(backgroundMC != null)
			{
				if(backgroundMC.framesLoaded >= step)
					backgroundMC.gotoAndStop(step);
			}
		}
	}
}
