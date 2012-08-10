/**
 * @TextByteCode.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Load
 * <br>Date:2012-2-26
 */
package com.asframe.load.byte
{
	import flash.utils.ByteArray;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-2-26
	 */
	public class TextByteCode extends BaseByteCode
	{
		/** 字符集，默认是UTF-8 **/
		public var charSet:String;
		
		public function TextByteCode()
		{
			charSet = "UTF-8";
		}
		
		protected override function onByteCode(byteArray:ByteArray, sucessResult:Function):*
		{
			return byteArray.readMultiByte(byteArray.length,charSet);
		}
	}
}
