/**
 * @Arg.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Res
 * <br>Date:2012-2-18
 */
package com.asframe.ref
{
	import com.asframe.utils.RefUtils;

	/**
	 * 参数，主要是Metadata需要使用到的参数
	 * @author sodaChen
	 * @Date:2012-2-18
	 */
	public class Arg
	{
		/** 键值 **/
		public var key:String;
		/** 值 **/
		public var value:String;
		
		public function Arg(key:String,value:String)
		{
			this.key = key;
			this.value = value;
		}
		/**
		 * 设置参数，根据实例进行赋值 
		 * @param instance
		 * @param type
		 * 
		 */		
		public function invoke(instance:*,type:Type):void
		{
			instance[key] = RefUtils.valueByType(key,value,type);
		}
	}
}
