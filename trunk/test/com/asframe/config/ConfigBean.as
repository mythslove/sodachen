/**
 * @ConfigBean.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-2-21
 */
package com.asframe.config
{
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-2-21
	 */
	public class ConfigBean
	{
		public var name:String;
		public var count:int;
		public var color:uint;
		public var number:Number;
		public var bool:Boolean;
		public var ary:Array;
		public var configBean:ConfigBean;
		
		[Class("com.asframe.config.ConfigBean")]
		public var configs:Array;
		
		public function ConfigBean()
		{
		}
	}
}
