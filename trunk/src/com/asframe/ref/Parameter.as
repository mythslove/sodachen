/**
 * @Parameter.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-2-13
 */
package com.asframe.ref
{
	import flash.system.ApplicationDomain;

	/**
	 * 参数
	 * @author sodaChen
	 * @Date:2012-2-13
	 */
	public class Parameter
	{
		public var applicationDomain		:ApplicationDomain;
		/** 位置 **/
		public var index					:int;
		/** 类型 **/
		public var type					:String;
		/** 是否有默认值 **/
		public var optional				:Boolean;
		
		public function Parameter(index:int,type:String,optional:Boolean,applicationDomain:ApplicationDomain)
		{
			this.index = index;
			this.type = type;
			this.optional = optional;
			this.applicationDomain = applicationDomain;
		}
	}
}
