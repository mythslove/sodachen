/**
 * @IComparable.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-12
 */
package com.asframe.lang
{
	/**
	 *
	 * 此接口强行对实现它的每个类的对象进行整体排序。这种排序被称为类的自然排序，类的 compareTo 方法被称为它的自然比较方法。<br>
	 *	
	 * 实现此接口的对象列表（和数组）可以通过 Collections.sort（和 Arrays.sort）进行自动排序。
	 * 实现此接口的对象可以用作有序映射中的键或有序集合中的元素，无需指定比较器。<br>
	 * 
	 * 对于类 C 的每一个 e1 和 e2 来说，当且仅当 e1.compareTo(e2) == 0 与 e1.equals(e2) 具有相同的 boolean 值时，类 C 的自然排序才叫做与 equals 一致。
	 * 注意，null 不是任何类的实例，即使 e.equals(null) 返回 false，e.compareTo(null) 也将抛出 NullPointerException。<br>
	 *	
	 * 建议（虽然不是必需的）最好使自然排序与 equals 一致。这是因为在使用自然排序与 equals 不一致的元素（或键）时，
	 * 没有显式比较器的有序集合（和有序映射表）行为表现“怪异”。尤其是，这样的有序集合（或有序映射表）违背了根据 equals 方法定义的集合（或映射表）的常规协定。<br>
	 *	
	 * 例如，如果将两个键 a 和 b 添加到没有使用显式比较器的有序集合中，使 (!a.equals(b) && a.compareTo(b) == 0)，
	 * 那么第二个 add 操作将返回 false（有序集合的大小没有增加），因为从有序集合的角度来看，a 和 b 是相等的。<br>
	 *	
	 * 从数学上讲，定义给定类 C 上自然排序的关系式 如下：<br>
	 *	
	 *	     {(x, y)|x.compareTo(y) <= 0}。
	 * 整体排序的商 是：<br>
	 *	     {(x, y)|x.compareTo(y) == 0}。
	 * 它直接遵循 compareTo 的协定，商是 C 的等价关系，自然排序是 C 的整体排序。
	 * 当说到类的自然排序与 equals 一致 时，是指自然排序的商是由类的 equals(Object) 方法定义的等价关系。<br>
	 *	   {(x, y)|x.equals(y)}。	 * @author sodaChen
	 * @Date:2012.04.12
	 */
	public interface IComparable
	{
		/**
		 * 比较此对象与指定对象的顺序。如果该对象小于、等于或大于指定对象，则分别返回负整数、零或正整数。 
		 * 实现类必须确保对于所有的 x 和 y 都存在 sgn(x.compareTo(y)) == -sgn(y.compareTo(x)) 的关系。
		 * （这意味着如果 y.compareTo(x) 抛出一个异常，则 x.compareTo(y) 也要抛出一个异常。） <br>
  		 *
		 * @param other 要比较的对象。
		 * @return 负整数、零或正整数，根据此对象是小于、等于还是大于指定对象。
		 * @throws TypeError 如果参数的类型不允许此 Comparator 对它们进行比较。
		 * 
		 */		
		function compareTo(other : Object) : int;
	}
}
