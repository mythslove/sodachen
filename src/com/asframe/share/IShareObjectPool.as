/**
 * @ISharePool.as.as
 * 
 * @author sodaChen mail:asframe#qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-3-31
 */
package com.asframe.share
{
	/**
	 * 共享池接口对象，提供共享对象存放，生成，销毁的统一管理
	 * @author sodaChen
	 * Date:2013-3-31
	 */
	public interface IShareObjectPool extends IShareObjectOver
	{
		function addShareObject(shareObject:IShareObject):void;
		function getShareObject(shareName:String):*;
		function removeShareObject(shareObject:IShareObject,isDispose:Boolean = true):void;
	}
}