/**
 * @TickExecuterTest.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-6-20
 */
package com.asframe.tick.executer
{
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import com.asframe.tick.TickMock;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-6-20
	 */
	public class TickExecuterTest
	{		
		private var tickExecuter:TickExecuter;
		
		[Before]
		public function setUp():void
		{
			tickExecuter = new TickExecuter();
		}
		
		[Test]
		public function testAddTick():void
		{
			var tickMock:TickMock = new TickMock();
			assertTrue(tickExecuter.addTick(tickMock));
			assertFalse(tickExecuter.addTick(tickMock));
			assertTrue(tickExecuter.addTick(new TickMock()));
		}
		
		[Test]
		public function testClear():void
		{
			assertTrue(tickExecuter.addTick(new TickMock()));
			tickExecuter.clear();
			assertEquals(tickExecuter.size(),0);
		}
		
		[Test]
		public function testRemoveTick():void
		{
			var tickMock:TickMock = new TickMock();
			assertTrue(tickExecuter.addTick(tickMock));
			assertTrue(tickExecuter.addTick(new TickMock()));
			assertTrue(tickExecuter.addTick(new TickMock()));
			assertEquals(tickExecuter.size(),3);
			tickExecuter.removeTick(tickMock);
			assertEquals(tickExecuter.size(),2);
		}
	}
}
