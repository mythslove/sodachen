/**
 * @ICollection.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Collections
 * <br>Date:2012-1-3
 */
package com.asframe.collections
{
	/**
	 * Collection 层次结构 中的根接口。
	 * Collection 表示一组对象，这些对象也称为 collection 的元素。
	 * 一些 collection 允许有重复的元素，而另一些则不允许。一些 collection 是有序的，而另一些则是无序的。
	 * @author sodaChen
	 * Date:2012-1-3
	 */
	public interface ICollection extends IIterable
	{
		/**
		 * 确保此 collection 包含指定的元素（可选操作）。如果此 collection 由于调用而发生更改，则返回 true。
		 *（如果此 collection 不允许有重复元素，并且已经包含了指定的元素，则返回 false。）
		 * <p>支持此操作的 collection 可以限制哪些元素能添加到此 collection 中来。需要特别指出的是，一些 collection 拒绝添加 null 元素，
		 * 其他一些 collection 将对可以添加的元素类型强加限制。Collection 类应该在其文档中清楚地指定能添加哪些元素方面的所有限制。
		 * <p>如果 collection 由于某些原因（已经包含该元素的原因除外）拒绝添加特定的元素，那么它必须 抛出一个异常（而不是返回 false）。
		 * 这确保了在此调用返回后，collection 总是包含指定的元素。
		 * @param e:确定此 collection 中是否存在的元素
		 * @return 如果此 collection 由于调用而发生更改，则返回 true 
		 * 
		 */		
		function add(o:*) : Boolean;
		/**
		 * 移除此 collection 中的所有元素（可选操作）。 
		 * 
		 */		
		function clear() : void;
		/**
		 * 如果此 collection 包含指定的元素，则返回 true。更确切地讲，当且仅当此 collection 至少包含一个满足 (o==null ? e==null : o.equals(e)) 的元素 e 时，返回 true。  
		 * @param o:测试在此 collection 中是否存在的元素。
		 * @return 如果此 collection 包含指定的元素，则返回 true 
		 * 
		 */		
		function has(o:*):Boolean;
		/**
		 * 如果此 collection 不包含元素，则返回 true。 
		 * @return :如果此 collection 不包含元素，则返回 true 
		 * 
		 */		
		function isEmpty() :Boolean;
		/**
		 * 从此 collection 中移除指定元素的单个实例，如果存在的话（可选操作）。
		 * 更确切地讲，如果此 collection 包含一个或多个满足 (o==null ? e==null : o.equals(e)) 的元素 e，则移除这样的元素。
		 * 如果此 collection 包含指定的元素（或者此 collection 由于调用而发生更改），则返回 true 。  
		 * @param o:要从此 collection 中移除的元素（如果存在）。
		 * @return :如果此调用将移除一个元素，则返回 true
		 * @throw :ClassCastException ,NullPointerException,UnsupportedOperationException 
		 * 
		 */		
		function remove(o:*) : Boolean;
		/**
		 * 按适当顺序（从第一个到最后一个元素）返回包含此列表中所有元素的数组。 
		 * 由于此列表不维护对返回数组的任何引用，，因而它将是“安全的”。（换句话说，此方法必须分配一个新的数组）。因此，调用者可以自由地修改返回的数组。
		 *
		 * @return :包含此列表中所有元素的数组（按适当顺序）
		 * 
		 */		
		function toArray() : Array;
		/**
		 * 返回此列表中的元素数。
		 * @return 
		 * 
		 */		
		function size() : int;
	}
}
