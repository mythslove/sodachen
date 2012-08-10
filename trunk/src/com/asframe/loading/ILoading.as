/**
 * @ILoading.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-4-26
 */
package com.asframe.loading
{
	import flash.display.Sprite;

	/**
	 * loading接口
	 * @author sodaChen
	 * @Date:2011-4-26
	 */
	public interface ILoading
	{
		/**
		 * loading显示的提示信息(当前单个loading的提示信息)
		 * @param tip:提示内容
		 * @param isHtml:是否采用HTML的形式显示tips文本 
		 */
		function setTip(tip:String,isHtml:Boolean = false):void;
		/**
		 * 设置loading的背景动画 
		 * @param background
		 * 
		 */		
		function setBackground(background:*):void;
		/**
		 * 返回Loading的显示容器 
		 * @return 
		 * 
		 */		
		function getContainer():Sprite;
		/**
		 * 加载过程中的数据呈现 
		 * @param resName:资源名称
		 * @param current:当前加载的字节量
		 * @param max:文件的最大字节量
		 * 
		 */		
		function progress(current:int,max:int):void; 
	}
}
