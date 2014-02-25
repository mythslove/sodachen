/**
 * @NetEvent.as
 * @author soda.C
 * @version  1.0
 * <br>Copyright (C), 2007 soda.C
 * <br>This program is protected by copyright laws.
 * <br>Program Name:GameHall
 * @data 2008-3-5
 */
package com.asframe.net
{
	import flash.events.Event;
	
	/**
	 * 自定义网络通讯的所有基础事件
	 */
	public class NetEvent extends Event
	{
		public static var PROGRESS:String = "netProgress";
		/** 多文件加载器全部加载成功后调用该事件 **/
		public static var MORE_COMPLETE:String = "moreComplete";
		/** 关闭网络连接时响应该事件 **/
		public static var SERVICES_CLOSE:String = "servicesClose";
		
		public var msg:String;
		public var bytesTotal:int;
		public var bytesLoaded:int;
		public function NetEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}
