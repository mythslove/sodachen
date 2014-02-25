/**
 * @Method.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-13
 */
package com.asframe.ref
{
	import flash.system.ApplicationDomain;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;

	/**
	 * 方法的相关数据
	 * @author sodaChen
	 * Date:2012-2-13
	 */
	public class Method extends Field
	{
		public var fullName		:String;
		public var returnType		:String;
		public var params			:Array;
		
		public function Method(	fullName:String,
							   		name:String,
									isStatic:Boolean,
									params:Array,
									returnType:String,
									applicationDomain:ApplicationDomain)
		{
			super(name,null,isStatic,applicationDomain);
			this.params = params;
			this.returnType = returnType;
		}
		/**
		 * 根据目标实例和参数进行执行该方法
		 * @param target 需要执行方法的目标
		 * @param args 方法所需要的参数数组
		 * @return 返回方法执行后的方法返回参数
		 */
		public function invoke(target:*, args:Array = null):* 
		{
			var result:*;
			var f:Function;
			f = target[name];
			if (f != null) 
			{
				result = f.apply(target, args);
			} 
			else 
			{
				if (target is Proxy) 
				{
					args = [name].concat(args);
					result = Proxy(target).flash_proxy::callProperty.apply(target, args);
				}
			}
			
			return result;
		}
		public function toString():String 
		{
			return "[Method(name:'" + name + "', isStatic:" + isStatic + ")]";
		}
	}
}
