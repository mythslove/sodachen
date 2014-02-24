/**
 * @LoadTarget.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASpring
 * <br>Date:2012-5-8
 */
package com.asframe.load
{
	import com.asframe.loading.ILoading;

	/**
	 * 加载目标的相关数据
	 * @author sodaChen
	 * Date:2012-5-8
	 */
	public class LoadTarget
	{
		public var url:String;
		public var target:*;
		public var sucessResult:Function;
		
		public function LoadTarget(url:String = null,target:* = null,sucessResult:Function = null)
		{
			this.url = url;
			this.target = target;
			this.sucessResult = sucessResult;
		}
	}
}
