/**
 * @IEquals.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-5-4
 */
package com.asframe.lang
{
	/**
	 * 指示其他某个对象是否与此对象“相等”。 
	 * equals 方法在非空对象引用上实现相等关系： 
	 * 自反性：对于任何非空引用值 x，x.equals(x) 都应返回 true。 
	 * 对称性：对于任何非空引用值 x 和 y，当且仅当 y.equals(x) 返回 true 时，x.equals(y) 才应返回 true。 
	 * 传递性：对于任何非空引用值 x、y 和 z，如果 x.equals(y) 返回 true，并且 y.equals(z) 返回 true，那么 x.equals(z) 应返回 true。 
	 * 一致性：对于任何非空引用值 x 和 y，多次调用 x.equals(y) 始终返回 true 或始终返回 false，
	 * 前提是对象上 equals 比较中所用的信息没有被修改。 
	 * 对于任何非空引用值 x，x.equals(null) 都应返回 false。 
	 * Object 类的 equals 方法实现对象上差别可能性最大的相等关系；即，对于任何非空引用值 x 和 y，当且仅当 x 和 y 引用同一个对象时，
	 * 此方法才返回 true（x == y 具有值 true）。 
	 *（模仿java语言的equals功能）
	 * @author sodaChen
	 * @Date:2011-5-4
	 */
	public interface IEquals
	{
		/**
		 * 指示其他某个对象是否与此对象“相等”。 
		 * equals 方法在非空对象引用上实现相等关系： 
		 * 自反性：对于任何非空引用值 x，x.equals(x) 都应返回 true。 
		 * 对称性：对于任何非空引用值 x 和 y，当且仅当 y.equals(x) 返回 true 时，x.equals(y) 才应返回 true。 
		 * 传递性：对于任何非空引用值 x、y 和 z，如果 x.equals(y) 返回 true，并且 y.equals(z) 返回 true，那么 x.equals(z) 应返回 true。 
		 * 一致性：对于任何非空引用值 x 和 y，多次调用 x.equals(y) 始终返回 true 或始终返回 false，
		 * 前提是对象上 equals 比较中所用的信息没有被修改。 
		 * 对于任何非空引用值 x，x.equals(null) 都应返回 false。 
		 * Object 类的 equals 方法实现对象上差别可能性最大的相等关系；即，对于任何非空引用值 x 和 y，当且仅当 x 和 y 引用同一个对象时，
		 * 此方法才返回 true（x == y 具有值 true）。 
		 *
		 * @param equals:要与之比较的引用对象
		 * @return 如果此对象与 obj 参数相同，则返回 true；否则返回 false
		 * 
		 */		
		function equals(equals:IEquals):Boolean;
	}
}
