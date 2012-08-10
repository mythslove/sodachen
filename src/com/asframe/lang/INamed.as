/**
 * @INamed.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-14
 */
package com.asframe.lang
{
	/**
	 * 获取和设置名称的接口，主要是为了符合AS3现在的一些对象的名称设置方法。例如sprite等
	 * @author sodaChen
	 * @Date:2012-1-14
	 */
	public interface INamed
	{
		function get name():String;
		function set name(_name:String):void;
	}
}
