/**
 * @ITotalLoading.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-4-28
 */
package com.asframe.loading
{
	/**
	 * 总体的loading接口，具体显示多个资源的大小，以及当前资源加载的进度
	 * @author sodaChen
	 * Date:2011-4-28
	 */
	public interface IMultilLoading extends ILoading
	{
		/**
		 * 全部资源的加载大小 
		 * @param allSize:
		 * 
		 */		
		function setTotalSize(totalSize:int):void;
		/**
		 * 总的显示 
		 * @param allTip:总的一个提示信息
		 * 
		 */		
		function setTotalTip(totalTip:String,isHtml:Boolean = false):void;
	}
}
