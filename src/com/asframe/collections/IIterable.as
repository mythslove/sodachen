/**
 * @IIterable.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Collections
 * <br>Date:2012-1-3
 */
package com.asframe.collections
{
	/**
	 * 实现这个接口允许对象成为 "foreach" 语句的目标。
	 * @author sodaChen
	 * @Date:2012-1-3
	 */
	public interface IIterable
	{
		/**
		 * 返回一个在一组任意类型的元素上进行迭代的迭代器。 
		 * @return ：一个迭代器。
		 * 
		 */		
		function iterator():IIterator;
	}
}
