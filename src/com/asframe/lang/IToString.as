/**
 * @IToString.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-8-24
 */
package com.asframe.lang
{
	/**
	 *
	 * @author sodaChen
	 * Date:2011-8-24
	 */
	public interface IToString
	{
		/**
		 * 返回该对象的字符串表示。通常，toString 方法会返回一个“以文本方式表示”此对象的字符串。结果应是一个简明但易于读懂的信息表达式。
		 * 建议所有子类都重写此方法。 
		 * Object 类的 toString 方法返回一个字符串，该字符串由类名（对象是该类的一个实例）、此对象哈希码的无符号十六进制表示组成。
		 * 换句话说，该方法返回一个字符串，它的值等于：getClass().getName() + Integer.toHexString(hashCode())
		 * 
		 * @return 该对象的字符串表示形式
		 * 
		 */		
		function toString():String;
	}
}
