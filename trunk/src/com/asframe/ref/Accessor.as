/**
 * @Accessor.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-2-17
 */
package com.asframe.ref
{
	import flash.system.ApplicationDomain;

	/**
	 *
	 * @author sodaChen
	 * @Date:2012-2-17
	 */
	public class Accessor extends Field
	{
		public var access:String;
		
		public function Accessor(name:String,access:String,type:String,declaredBy:String,isStatic:Boolean,applicationDomain:ApplicationDomain)
		{
			super(name,type,isStatic,applicationDomain);
			this.access = access;
		}
	}
}
