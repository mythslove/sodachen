/**
 * @IResMetadata.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-7-4
 */
package com.asframe.metadata.res
{
	/**
	 * 资源加载标签
	 * @author sodaChen
	 * Date:2012-7-4
	 */
	public interface IResMetadata
	{
		/**
		 * 资源加载好之后调用的回调方法 
		 * @param data 加载后的资源
		 * @param url 配置的url路径
		 */			
		function initRes(data:*,url:String):void;
	}
}
