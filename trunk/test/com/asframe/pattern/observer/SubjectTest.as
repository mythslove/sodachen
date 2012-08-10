/**
 * @SubjectTest.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-5-9
 */
package com.asframe.pattern.observer
{
	import flexunit.framework.Assert;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-5-9
	 */
	public class SubjectTest
	{	
		private var subject:ISubject;
		
		[Before]
		public function setUp():void
		{
			subject = new Subject();
		}
		
		
		[Test]
		public function testAddObserver():void
		{
			var mock2:ObserverMock2 = new ObserverMock2();
			subject.addObserver(new ObserverMock1());
			Assert.assertEquals(subject.length(),1);
			subject.addObserver(mock2);
			Assert.assertEquals(subject.length(),2);
			subject.removeObserver(mock2);
			Assert.assertEquals(subject.length(),1);
		}
		
		[Test]
		public function testSendNotice():void
		{
			var mock1:ObserverMock1 = new ObserverMock1();
			subject.addObserver(mock1);
			subject.sendNotice("soda","www.asframe.com");
			subject.removeObserver(mock1);
			
			subject.addObserver(new ObserverMock2());
			subject.sendNotice("www.asframe.com","suving",18);
		}
	}
}

import com.asframe.pattern.observer.IObserver;

import flexunit.framework.Assert;

import org.hamcrest.collection.array;

class ObserverMock1 implements IObserver
{
	/**
	 * 相应观察者 
	 * @param notice 触发此次相应的通知
	 * @param args 相关参数（当参数只有一个时，args为单一对象，如果参数是多个的话，则args为数组） 
	 * 
	 */		
	public function replyNotice(notice:*,args:* = null):void
	{
		Assert.assertEquals("soda",notice);
		Assert.assertEquals("www.asframe.com",args);
	}
}

class ObserverMock2 implements IObserver
{
	/**
	 * 相应观察者 
	 * @param notice 触发此次相应的通知
	 * @param args 相关参数（当参数只有一个时，args为单一对象，如果参数是多个的话，则args为数组） 
	 * 
	 */		
	public function replyNotice(notice:*,args:* = null):void
	{
		Assert.assertEquals(notice,"www.asframe.com");
		Assert.assertTrue(args is Array);
		Assert.assertEquals("suving",args[0]);
		Assert.assertEquals(18,args[1]);
	}
}
