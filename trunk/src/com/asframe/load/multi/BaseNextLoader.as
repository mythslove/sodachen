/**
 * @BaseNextLoader.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-6-29
 */
package com.asframe.load.multi
{
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-6-29
	 */
	public class BaseNextLoader implements INextLoader
	{
		protected var multiLoader:IMultiLoader;
		
		public function BaseNextLoader()
		{
		}
		
		public function setMultiLoader(multiLoader:IMultiLoader):void
		{
			this.multiLoader = multiLoader;
		}
		
		public function nextLoad(bean:*, target:*, complete:Function):void
		{
		}
	}
}
