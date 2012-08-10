/**
 * @AbstractIterator.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Collections
 * <br>Date:2012-1-7
 */
package com.asframe.collections
{
	/**
	 * 抽象迭代器
	 * @author sodaChen
	 * @Date:2012-1-7
	 */
	public class AbstractIterator implements IIterator
	{
		protected var array:Array;
		protected var nextValue:int;
		protected var len:int;
		protected var current:int;
		
		public function AbstractIterator(array:Array)
		{
			this.array = array;
			len = array.length;
		}
		
		public function hasNext():Boolean
		{
			return nextValue < len;
		}
		
		public function next():*
		{
			current = nextValue;
			nextValue++;
			return array[current];
		}
		
		public function remove():void
		{
		}
	}
}
