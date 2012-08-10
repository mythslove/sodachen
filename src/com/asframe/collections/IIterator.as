/**
 * @IIterator.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Collections
 * <br>Date:2012-1-3
 */
package com.asframe.collections
{
	/**
	 * 对 collection 进行迭代的迭代器。迭代器取代了 Java Collections Framework 中的 Enumeration。迭代器与枚举有两点不同： 
	 * 迭代器允许调用者利用定义良好的语义在迭代期间从迭代器所指向的 collection 移除元素。
	 * @author sodaChen
	 * @Date:2012-1-3
	 */
	public interface IIterator
	{
		/**
		 * 如果仍有元素可以迭代，则返回 true。
		 * @return :如果迭代器具有多个元素，则返回 true。
		 * 
		 */		
		function hasNext():Boolean;
		/**
		 * 返回迭代的下一个元素。 
		 * @return :迭代的下一个元素。
		 * @throw :NoSuchElementException - 没有元素可以迭代。
		 * 
		 */		
		function next():*;
		/**
		 * 从迭代器指向的 collection 中移除迭代器返回的最后一个元素（可选操作）。每次调用 next 只能调用一次此方法。
		 * 如果进行迭代时用调用此方法之外的其他方式修改了该迭代器所指向的 collection，则迭代器的行为是不确定的。  
		 * 
		 */		
		function remove():void;
	}
}
