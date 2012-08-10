/**
 * @Subject.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-4-12
 */
package com.asframe.pattern.observer
{
	import com.asframe.collections.lists.ArrayList;
	import com.asframe.collections.lists.IList;

	/**
	 * 主题的默认实现对象
	 * @author sodaChen
	 * @Date:2012-4-12
	 */
	public class Subject implements ISubject
	{
		private var observerList		:IList;
		private var len				:int;
		
		public function Subject()
		{
			observerList = new ArrayList();
		}
		/**
		 * 获取到监听该主题的观察者的长度 
		 * @return 
		 * 
		 */		
		public function length():int
		{
			return len;
		}
		public function addObserver(observer:IObserver):void
		{
			observerList.add(observer);
			len ++;
		}
		
		public function removeObserver(observer:IObserver):void
		{
			observerList.remove(observer);
			len --;
		}
		
		public function sendNotice(notice:*, ...args):void
		{
			var observerAry:Array = observerList.toArray();
			var observer:IObserver = null;
			for (var i:int = 0; i < len; i++) 
			{
				observer = observerList.get(i);
				if(args.length == 1)
				{
					observer.replyNotice(notice,args[0]);
				}
				else
				{
					observer.replyNotice(notice,args);
				}
			}
//			for each (var observer:IObserver in observerAry) 
//			{
//				observer.replyNotice(notice,args);
//			}
		}
	}
}
