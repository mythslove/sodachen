/**
 * @Named.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-20
 */
package com.asframe.lang.impl
{
	import com.asframe.lang.INamed;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2012-2-20
	 */
	public class Named implements INamed
	{
		private var _name:String;
		
		public function get name():String
		{
			return _name;
		}
		public function set name(_name:String):void
		{
			this._name = _name;
		}
	}
}
