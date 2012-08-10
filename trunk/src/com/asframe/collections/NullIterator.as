/**
 * @NullIterator.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame AStruts2
 * <br>Date:2012-4-1
 */
package com.asframe.collections
{
	import com.asframe.lang.error.UnsupportedOperationError;

	/**
	 * 空迭代器，什么事也没做
	 * @author sodaChen
	 * @Date:2012-4-1
	 */
	public class NullIterator implements IIterator
	{
		public function NullIterator()
		{
		}
		
		public function hasNext():Boolean
		{
			return false;
		}
		
		public function next():*
		{
			return null;
		}
		
		public function remove():void
		{
			throw new UnsupportedOperationError("空迭代器不能进行删除！");
		}
	}
}
