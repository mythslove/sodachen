/**
 * @TickManagerTest.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-6-20
 */
package com.asframe.tick
{
	import flexunit.framework.Assert;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-6-20
	 */
	public class TickManagerTest
	{		
		
		[Test]
		public function testGetTickExecuter():void
		{
			//创建一个默认的心跳管理器
			TickManager.createTickExecuter();
		}
		
		[Test]
		public function testCreateTickExecuter():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testInitTickExecuter():void
		{
			Assert.fail("Test method Not yet implemented");
		}
		
		[Test]
		public function testRemoveTick():void
		{
			Assert.fail("Test method Not yet implemented");
		}
	}
}
