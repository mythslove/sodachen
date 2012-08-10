/**
 * @MultiLoadBean.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is public by copyright laws.
 * <br>Program Name:ASFrame Load
 * <br>Date:2012-2-5
 */
package com.asframe.load.multi
{
	import com.asframe.loading.ILoading;

	/**
	 * 多加载的数据结构
	 * @author sodaChen
	 * @Date:2012-2-5
	 */
	public class MultiLoadBean
	{
		/** 多个URL **/
		public var urls:Array;
		/** 全部加载完成的回调函数 **/
		public var allComplete:Function;
		/** 加载的结果 **/
		public var resultAry:Array;
		/** 单个成功回调函数 **/
		public var oneSucessResult:Function;
		/** 单个失败回调函数 **/
		public var oneFailResult:Function;
		/** loading **/
		public var loading:ILoading;
		/** 目标对象，加载时传入的目标对象 **/
		public var target:*;
	}
}
