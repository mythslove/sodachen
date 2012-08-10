/**
 * @MetadataConst.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame AStruts2
 * <br>Date:2012-4-7
 */
package com.asframe.metadata
{
	/**
	 * 元数据标签相关的常量
	 * @author sodaChen
	 * @Date:2012-4-7
	 */
	public class MetadataConst
	{
		/** 引用，自动注入 **/
		public static const REF_METADATA:String = "Ref"; 
		/** View对象 **/
		public static const VIEW_METADATA:String = "View"; 
		/** Mediator对象 **/
		public static const MEDIATOR_METADATA:String = "Mediator"; 
		/** 感兴趣事件（自动为方法注入该感兴趣事件） **/
		public static const NOTICE_METADATA:String = "Notice"; 
		/** 资源的标签配置 **/
		public static const RES_METADATA:String = "Res"; 
	}
}
