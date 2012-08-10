/**
 * @Assert.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Collections
 * <br>Date:2012-1-7
 */
package com.asframe.lang
{

	import com.asframe.lang.error.AbstractClassError;
	import com.asframe.lang.error.IllegalArgumentError;
	import com.asframe.lang.error.IllegalStateError;
	import com.asframe.lang.error.IndexOutOfBoundsError;
	import com.asframe.utils.ClassUtils;
	import com.asframe.utils.StringUtils;
	
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;

	/**
	 * 断言对象 
	 * @author sodaChen
	 * 
	 */	
	public final class Assert 
	{
		/**
		 * 断言值是为<code>true</code>.
		 * <pre class="code">Assert.isTrue(value, "该表达式必须是为真");</pre>
		 * @param expression 一个布尔值表达式
		 * @param message 当表达式不对时给出的提示信息
		 * @param isThrowError 是否抛出异常，默认为false。传true时抛出异常
		 * @throws com.asframe.lang.error.IllegalArgumentError 如果表达式的值不为<code>true</code>
		 */
		public static function isTrue(expression:Boolean, message:String = ""):void 
		{
			if (!expression) 
			{
				isThrowIllegalArgumentError(message,"[Assert.isTrue] - 该表达式必须是为真。");
			}
		}
		
		/**
		 * 断言该对象不为 <code>null</code>.
		 * <pre class="code">Assert.notNull(value, "参数不能为空");</pre>
		 * @param object 检测对象
		 * @param message 错误时的提示信息
		 * @param isThrowError 是否抛出异常，默认为false。传true时抛出异常
		 * @throws @throws com.asframe.lang.error.IllegalArgumentError 如果表达式的值为<code>null</code>
		 */
		public static function notNull(object:Object, message:String = ""):void 
		{
			if (object == null) 
			{
				isThrowIllegalArgumentError(message,"[Assert.notNull] - 参数不能为空。");
			}
		}
		/**
		 * 断言该对象是属于type类
		 * <pre class="code">Assert.isInstanceOf(value, type, "vlaue必须type类或者他的子类");</pre>
		 * @param object 检测对象
		 * @param message 错误时的提示信息
		 * @param isThrowError 是否抛出异常，默认为false。传true时抛出异常
		 * @throws @throws com.asframe.lang.error.IllegalArgumentError 如果value不属于type时抛出
		 */
		public static function isInstanceOf(object:*, type:Class, message:String = ""):void 
		{
			if (!(object is type)) 
			{
				isThrowIllegalArgumentError(message,"[Assert.isInstanceOf] - vlaue必须type类或者他的子类。");
			}
		}
		/**
		 * 检测对象是否为抽象类，抽象是不能进行实例化的 
		 * @param object
		 * @param clazz
		 * 
		 */		
		public static function isAbstractClass(object:Object,clazz:String):void
		{
			if (getQualifiedClassName(object) == clazz)
			{
				throw new AbstractClassError(clazz + "是抽象类，不能实例化!");
			}
		}
		/**
		 * 是否索引越界了，小于等0或者i大于等于len 
		 * @param i
		 * @param len
		 * @param message
		 * 
		 */		
		public static function isIndexOutOfBounds(i:int, len:int,message:String = ""):void
		{
			if (i < 0 || i >= len)
			{
				throw new IndexOutOfBoundsError(message + "越界了，传入的是:" + i + "，实际长度是:" + len);
			}
		}
		
		private static function isThrowIllegalArgumentError(message:String,defMessage:String):void
		{
			if (message == null || message.length == 0) 
			{
				message = defMessage;
			}
			throw new IllegalArgumentError(message);
		}
	}
}
