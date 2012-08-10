/**
 * @TextLoaderTest.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-6-10
 */
package com.asframe.load
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.async.Async;
	import org.flexunit.events.AsyncEvent;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-6-10
	 */
	public class TextLoaderTest
	{		
		private var textLoader:TextLoader;
		
		[Before]
		public function setUp():void
		{
			textLoader = new TextLoader();
		}
		
		[Test(async, timeout=5000)]
		public function testGetString():void
		{
			var mHandler:Function = Async.asyncHandler( this, onLoader,5000, {num:4,type:"m"}, timeoutHandler );
//			textLoader.load("com.asframe.load.TextFile.txt",mHandler);
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE,mHandler);
			loader.load(new URLRequest("com/asframe/load/TextFile.txt"));
		}
		private function onLoader( e:Event, token:AsyncEvent):void
		{
			trace("---");
		}
		private function timeoutHandler():void
		{
			trace("---");
		}
		[Test]
		public function testGetXML():void
		{
			Assert.fail("Test method Not yet implemented");
		}
	}
}
