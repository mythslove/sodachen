/**
 * @IList.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Collections
 * <br>Date:2012-1-4
 */
package com.asframe.collections.lists
{
	import com.asframe.collections.ICollection;

	/**
	 *
	 * @author sodaChen
	 * @Date:2012-1-4
	 */
	public interface IList extends ICollection
	{
		/**
		 * 在列表的指定位置插入指定元素（可选操作）。将当前处于该位置的元素（如果有的话）和所有后续元素向右移动（在其索引中加 1）。  
		 * @param index:要在其中插入指定元素处的索引
		 * @param element:要插入的元素
		 * 
		 */		
		function addAt(index : int,element : *) : void;
		/**
		 * 返回列表中指定位置的元素。 
		 * @param index:要返回的元素的索引
		 * @return :列表中指定位置的元素
		 * 
		 */		
		function get(index : int) : *;
		/**
		 * 返回此列表中第一次出现的指定元素的索引；如果此列表不包含该元素，则返回 -1。
		 * 更确切地讲，返回满足 (element==null ? get(i)==null : element.equals(get(i))) 的最低索引 i；如果没有这样的索引，则返回 -1。
		 * @param element:要搜索的元素
		 * @return :此列表中第一次出现的指定元素的索引，如果列表不包含该元素，则返回 -1
		 * 
		 */		
		function indexOf(element : *) : int;
		/**
		 * 返回此列表中最后出现的指定元素的索引；如果列表不包含此元素，则返回 -1。
		 * 更确切地讲，返回满足 (element==null ? get(i)==null : element.equals(get(i))) 的最高索引 i；如果没有这样的索引，则返回 -1。  
		 * @param element:要搜索的元素
		 * @return :列表中最后出现的指定元素的索引；如果列表不包含此元素，则返回 -1
		 * 
		 */		
		function lastIndexOf(element : *) : int;
		/**
		 * 用指定元素替换列表中指定位置的元素（可选操作）。  
		 * @param index:要替换的元素的索引
		 * @param element:要在指定位置存储的元素
		 * @return :以前在指定位置的元素
		 * 
		 */		
		function set(index:int, element : *) : *;
		/**
		 * 移除此列表中指定位置上的元素。向左移动所有后续元素（将其索引减 1）。  
		 * @param index:要移除的元素的索引
		 * @return :从列表中移除的元素
		 * 
		 */		
		function removeAt(index:int):*;
		
		function swap( index: *, index2 : *):void;
		
		function swapAt( index1: int, index2 : int):void;
		/**
		 * 获取到list的数组容器，注意，该方法一般不要使用，也不要太多共同使用。
		 * 除非是对性能要求非常高，而且需要确保不会直接修改该数组
		 * @return 
		 * 
		 */		
		function getContainer():Array;
	}
}
