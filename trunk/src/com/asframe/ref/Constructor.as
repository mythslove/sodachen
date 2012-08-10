/**
 * @Constructor.as
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
	import flash.system.ApplicationDomain;

	/**
	 * 构造器
	 * @author sodaChen
	 * @Date:2012-2-18
	 */
	public class Constructor
	{
		public var applicationDomain:ApplicationDomain;
		public var fullName:String;
		/** 构造需要的参数 **/
		public var parameters:Array;
		
		public function Constructor(fullName:String,parameters:Array,applicationDomain:ApplicationDomain)
		{
			this.fullName = fullName;
			this.parameters = parameters;
			this.applicationDomain = applicationDomain;
		}
	}
}
