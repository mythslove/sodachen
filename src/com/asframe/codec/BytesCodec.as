/**
 * @BytesCodec.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-10-24
 */
package com.asframe.codec
{
	import flash.utils.ByteArray;

	/**
	 * 直接的加密解密
	 * @author sodaChen
	 * #Date:2011-10-24
	 */
	public class BytesCodec
	{
		/**
		 * 针对字节进行字节的加和减的加密 
		 * @param key:加密解密钥匙
		 * @param bytes:字节
		 * @param value:加还是减
		 * @return 
		 * 
		 */		
		public static function bytesAddCut(key:String,bytes:ByteArray,value:int = 1):ByteArray
		{
			if(key == null)
			{
				return bytes;
			}
			var newBytes:ByteArray = new ByteArray();
			var len:int = bytes.length;
			var flag:int = 0;
			var keyLen:int = key.length;
			for(var i:int = 0; i < len ; i++ ,flag++)
			{	
				if(flag >= keyLen)
				{
					flag = 0;
				}
				newBytes.writeByte(bytes[i] + value * key.charCodeAt(flag));
			} 
			return newBytes;
		}
		/**
		 * 解码 
		 * @param key
		 * @param bytes
		 * @return 
		 * 
		 */		
		public static function decoder(key:String,bytes:ByteArray):ByteArray
		{
			if(key == null)
			{
				return bytes;
			}
			var newBytes:ByteArray = new ByteArray();
			var len:int = bytes.length;
			var flag:int = 0;
			var keyLen:int = key.length;
			for(var i:int = 0; i < len ; i++ ,flag++)
			{	
				if(flag >= keyLen)
				{
					flag = 0;
				}
				newBytes.writeByte(bytes[i] - key.charCodeAt(flag));
			} 
			return newBytes;
		}
		/**
		 * 编码
		 * @param key
		 * @param bytes
		 * @return 
		 * 
		 */		
		public static function encoder(key:String,bytes:ByteArray):ByteArray
		{
			if(key == null)
			{
				return bytes;
			}
			var newBytes:ByteArray = new ByteArray();
			var len:int = bytes.length;
			var flag:int = 0;
			var keyLen:int = key.length;
			for(var i:int = 0; i < len ; i++ ,flag++)
			{	
				if(flag >= keyLen)
				{
					flag = 0;
				}
				newBytes.writeByte(bytes[i] + key.charCodeAt(flag));
			} 
			return newBytes;
		}
	}
}
