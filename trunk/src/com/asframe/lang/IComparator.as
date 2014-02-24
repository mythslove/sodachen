/**
 * @IComparator.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-4-12
 */
package com.asframe.lang
{
	/**
	 * 强行对某个对象 collection 进行整体排序 的比较函数。
	 * 可以将 Comparator 传递给 sort 方法（如 Collections.sort 或 Arrays.sort），
	 * 从而允许在排序顺序上实现精确控制。
	 * 还可以使用 Comparator 来控制某些数据结构（如有序 set或有序映射）的顺序，
	 * 或者为那些没有自然顺序的对象 collection 提供排序。
	 * @author sodaChen
	 * Date:2012-4-12
	 */
	public interface IComparator
	{
		/**
		 * 比较用来排序的两个参数。根据第一个参数小于、等于或大于第二个参数分别返回负整数、零或正整数。 
		 * @param obj1 要比较的第一个对象。
		 * @param obj2 要比较的第二个对象。
		 * @return 根据第一个参数小于、等于或大于第二个参数分别返回负整数、零或正整数。
		 * @throws TypeError 如果参数的类型不允许此 Comparator 对它们进行比较。
		 */		
		function compare(obj1:*, obj2:*):int;
	}
}
