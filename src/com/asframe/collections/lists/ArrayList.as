/**
 * @ArrayList.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Collections
 * <br>Date:2012-1-7
 */
package com.asframe.collections.lists
{
	import com.asframe.collections.IIterator;
	import com.asframe.lang.Assert;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2012-1-7
	 */
	public class ArrayList implements IList
	{
		protected var array:Array;
		
		public function ArrayList(array:Array = null)
		{
			this.array = array;
			if(array == null)
			{
				this.array = [];
			}
		}
		
		/**
		 * 在列表的指定位置插入指定元素（可选操作）。将当前处于该位置的元素（如果有的话）和所有后续元素向右移动（在其索引中加 1）。  
		 * @param index:要在其中插入指定元素处的索引
		 * @param element:要插入的元素
		 * 
		 */
		public function addAt(index:int, element:*):void
		{
			array.splice(index, 0, element);
		}
		
		/**
		 * 返回列表中指定位置的元素。 
		 * @param index:要返回的元素的索引
		 * @return :列表中指定位置的元素
		 * 
		 */
		public function get(index:int):*
		{
			if(index < 0 || index >= array.length)
			{
				return null;
			}
			return array[index];
		}
		
		/**
		 * 返回此列表中第一次出现的指定元素的索引；如果此列表不包含该元素，则返回 -1。
		 * 更确切地讲，返回满足 (element==null ? get(i)==null : element.equals(get(i))) 的最低索引 i；如果没有这样的索引，则返回 -1。
		 * @param element:要搜索的元素
		 * @return :此列表中第一次出现的指定元素的索引，如果列表不包含该元素，则返回 -1
		 * 
		 */
		public function indexOf(element:*):int
		{
			return array.indexOf(element);
		}
		
		/**
		 * 返回此列表中最后出现的指定元素的索引；如果列表不包含此元素，则返回 -1。
		 * 更确切地讲，返回满足 (element==null ? get(i)==null : element.equals(get(i))) 的最高索引 i；如果没有这样的索引，则返回 -1。  
		 * @param element:要搜索的元素
		 * @return :列表中最后出现的指定元素的索引；如果列表不包含此元素，则返回 -1
		 * 
		 */
		public function lastIndexOf(element:*):int
		{
			return array.lastIndexOf(element);
		}
		
		/**
		 * 用指定元素替换列表中指定位置的元素（可选操作）。  
		 * @param index:要替换的元素的索引
		 * @param element:要在指定位置存储的元素
		 * @return :以前在指定位置的元素
		 * 
		 */
		public function set(index:int, element:*):*
		{
			if(index < 0 || index >= size())
			{
				return null;
			}
			else
			{		
				var oldObj:* = array[index];
				array[index] = element;		
				return oldObj;
			}
		}
		
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
		public function add(o:*):Boolean
		{
			array.push(o);
			return true;
		}
		
		/**
		 * 移除此 collection 中的所有元素（可选操作）。 
		 * 
		 */
		public function clear():void
		{
			array = [];
		}
		/**
		 * 如果此 collection 包含指定的元素，则返回 true。更确切地讲，当且仅当此 collection 至少包含一个满足 (o==null ? e==null : o.equals(e)) 的元素 e 时，返回 true。  
		 * @param o:测试在此 collection 中是否存在的元素。
		 * @return 如果此 collection 包含指定的元素，则返回 true 
		 * 
		 */
		public function has(o:*):Boolean
		{
			return array.indexOf(o) > -1;
		}
		
		/**
		 * 如果此 collection 不包含元素，则返回 true。 
		 * @return :如果此 collection 不包含元素，则返回 true 
		 * 
		 */
		public function isEmpty():Boolean
		{
			return array.length == 0;
		}
		
		/**
		 * 从此 collection 中移除指定元素的单个实例，如果存在的话（可选操作）。
		 * 更确切地讲，如果此 collection 包含一个或多个满足 (o==null ? e==null : o.equals(e)) 的元素 e，则移除这样的元素。
		 * 如果此 collection 包含指定的元素（或者此 collection 由于调用而发生更改），则返回 true 。  
		 * @param o:要从此 collection 中移除的元素（如果存在）。
		 * @return :如果此调用将移除一个元素，则返回 true
		 * @throw :ClassCastException ,NullPointerException,UnsupportedOperationException 
		 * 
		 */
		public function remove(o:*):Boolean
		{
			var index : int = array.indexOf(o);
			if (index == -1)
			{
				return false;
			}
			array.splice(index, 1);
			return true;
		}
		
		/**
		 * 按适当顺序（从第一个到最后一个元素）返回包含此列表中所有元素的数组。 
		 * 由于此列表不维护对返回数组的任何引用，，因而它将是“安全的”。（换句话说，此方法必须分配一个新的数组）。因此，调用者可以自由地修改返回的数组。
		 *
		 * @return :包含此列表中所有元素的数组（按适当顺序）
		 * 
		 */	
		public function toArray():Array
		{
			return array.concat();
		}
		
		/**
		 * 返回此列表中的元素数。
		 * @return 
		 * 
		 */
		public function size():int
		{
			return array.length;
		}
		
		/**
		 * 返回一个在一组任意类型的元素上进行迭代的迭代器。 
		 * @return ：一个迭代器。
		 * 
		 */
		public function iterator():IIterator
		{
			return new ArrayListIterator(array.concat());
		}
		
	   /**
		* 移除此列表中指定位置上的元素。向左移动所有后续元素（将其索引减 1）。  
		* @param index:要移除的元素的索引
		* @return :从列表中移除的元素
		* 
		*/		
		public function removeAt(index:int):*
		{
			return array.splice(index, 1)[0];
		}
		
		public function swap( index1: *, index2 : *):void
		{
			var indexNum1:* = array.indexOf(index1);
			if(indexNum1 != -1)
			{
				var indexNum2:* = array.indexOf(index2);
				if(indexNum2 != -1)
				{
					swapAt(indexNum1,indexNum2);
				}
			}
		}
		
		public function swapAt( i: int, j : int):void
		{
			Assert.isIndexOutOfBounds(i,array.length,"ArrayList ");
			Assert.isIndexOutOfBounds(i,array.length,"ArrayList ");
			var temp:* = array[i];
			array[i] = array[j];
			array[j] = temp;
		}
		/**
		 * @inheritDoc
		 */		
		public function getContainer():Array
		{
			return array;
		}
		
		public function forEach(fun:Function):void
		{
			var len:int = array.length;
			for (var i:int = 0; i < len; i++) 
			{
				fun(array[i]);
			}
		}
		/**
		 * 复制一个完全一样的ArrayList
		 * @return 
		 * 
		 */		
		public function clone():ArrayList
		{
			return new ArrayList(array.concat());
		}
	}
}
