/**
 * @IResHandler.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-7-5
 */
package com.asframe.metadata.res
{
	import com.asframe.loading.ILoading;
	import com.asframe.ref.Type;
	
	import flash.events.IEventDispatcher;

	/**
	 * 资源处理接口
	 * @author sodaChen
	 * @Date:2012-7-5
	 */
	public interface IResHandler extends IEventDispatcher
	{
		function parseRes(metadataTarget:Object,loading:ILoading = null, type:Type = null):void;
	}
}
