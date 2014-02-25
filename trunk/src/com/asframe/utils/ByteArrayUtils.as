/**
 * @ByteArrayUtils.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-14
 */
package com.asframe.utils
{
	import flash.utils.ByteArray;

	/**
	 * 字节数组的工具类
	 * @author sodaChen
	 * Date:2012-1-14
	 */
	public class ByteArrayUtils
	{
		/**
		 * 字节转换为字符字符串 
		 * @param bytes
		 * @param charSet
		 * @return 
		 * 
		 */		
		public static function bytesToStr(bytes:*,charSet:String = "utf-8"):String
		{
			var byteArray:ByteArray = convertBytes(bytes);
			return byteArray.readMultiByte(byteArray.length,charSet);
		}
		public static function convertBytes(bytes:*):ByteArray
		{
			if(bytes is Class)
			{
				bytes = new bytes();
			}
			return bytes;
		}
		public static function clone( byteArray:ByteArray ):ByteArray
		{
			var old:uint = byteArray.position;
			var clone:ByteArray = new ByteArray();
			byteArray.position = 0;
			byteArray.readBytes(clone);
			byteArray.position = old ;
			clone.position = old ;
			return clone ;
		}
		
		public static function copy( from:ByteArray , fromOffset:int, to:ByteArray, toOffset:int, length:int ):void
		{
			if (length <= 0)
			{
				return ;
			}
			to.position = toOffset ;
			to.writeBytes(from, fromOffset, length) ;
		}
		
		public static function equals( first:ByteArray, second:ByteArray):Boolean
		{
			var pos1:uint   = first.position  ;
			var pos2:uint   = second.position ;
			first.position  = 0 ;
			second.position = 0 ;
			if( first.bytesAvailable != second.bytesAvailable )
			{
				first.position  = pos1 ;
				second.position = pos2 ;
				return false;
			}
			while( first.bytesAvailable > 0 )
			{
				if( first.readByte() != second.readByte())
				{
					first.position  = pos1 ;
					second.position = pos2 ;
					return false;
				}
			}
			first.position  = pos1 ;
			second.position = pos2 ;
			return true;
		}
	}
}
