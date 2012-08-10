/**
 * @ExecuteTickTest.as
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
	import com.asframe.tick.ITick;
	import com.asframe.tick.TickMock;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertEquals;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-6-20
	 */
	public class ExecuteTickTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testExecute():void
		{
			var tickList:Vector.<ITick> = new Vector.<ITick>();
			var tickMock:TickMock = new TickMock();
			tickList.push(tickMock);
			var executerTick:ExecuteTick = new ExecuteTick();
			executerTick.setTickList(tickList,new Vector.<ITick>()); 
			executerTick.execute();
			assertEquals(tickMock.count,1);
		}
	}
}
