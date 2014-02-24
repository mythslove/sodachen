/**
 * @INextLoader.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-6-29
 */
package com.asframe.load.multi
{
	import com.asframe.loading.ILoading;

	/**
	 * 下一个加载的处理接口，一些特殊处理需要做下一个加载的，比方说有自定义格式的数据做下一个加载.
	 * 方便扩展
	 * @author sodaChen
	 * Date:2012-6-29
	 */
	public interface INextLoader
	{
		/**
		 * 设置下一个 
		 * @param multiLoader
		 * 
		 */		
		function setMultiLoader(multiLoader:IMultiLoader):void;
		/**
		 * 进行下一个加载 
		 * @param bean
		 * @param target
		 * @param complete
		 * 
		 */		
		function nextLoad(bean:*,target:*,complete:Function,loading:ILoading = null):void;
	}
}
