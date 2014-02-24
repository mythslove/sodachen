/**
 * @LoadData.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-22
 */
package com.asframe.load
{
	import com.asframe.lang.IDestory;

	/**
	 * 加载对象使用的到数据,存放了加载结果
	 * @author sodaChen
	 */
	public class LoadData implements IDestory
	{
		/** 路径 **/
		public var url:String;
		/** 资源类型(后缀) **/
		public var resType:String;
		/** 具体的资源 **/
		public var data:*;
		/** 加载器 **/ 
		public var loader:ILoader;
		/** 目标对象 **/
		public var target:*;
//		public var loading:ILoading;
		
		public function destroy(o:* = null):void
		{
			url = null;
			resType = null;
			data = null;
			loader = null;
			target = null;
//			loading = null;
		}
	}
}
