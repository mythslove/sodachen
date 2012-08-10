/**
 * @(#)MemoryManager.as
 * @author soda.C
 * @version  1.0
 * <br>Copyright (C), 2007 soda.C
 * <br>This program is protected by copyright laws.
 * <br>Program Name:GameHall
 * @data 2008-2-26
 */
package com.asframe.utils 
{	import flash.net.LocalConnection;
	public class MemoryManager 
	{
		/**
		 * 强行性让flash播放机制执行内存回收
		 */
		public static function GC():void
		{
//			try
//			{
//				var gc1:LocalConnection = new LocalConnection();
//				var gc2:LocalConnection = new LocalConnection();
//				gc1.connect("com.asframe.memory.gc1");
//				gc2.connect("com.asframe.memory.gc1");
//			}
//			catch(error:Error)
//			{
//				trace("强制执行内存清理:" + error);
//			}
		}	}}