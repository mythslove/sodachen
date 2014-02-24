/**
 * @IByteCode.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012  asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-26
 */
package com.asframe.load.byte
{
	import flash.utils.ByteArray;

	/**
	 * 字节解码
	 * @author sodaChen
	 */
	public interface IByteCode
	{
		/**
		 * 是否有压缩（默认是使用ByteArray自带的compress进行解压缩）
		 * @param compress
		 * 
		 */		
		function isCompress(compress:Boolean):void;
		/**
		 * 进行解码 
		 * @param byteArray
		 * @param sucessResult:成功时返回的回调函数(不是必须的,如果不是异步,则不需要,直接返回结果)
		 * @return 
		 * 
		 */		
		function byteCode(byteArray:ByteArray,sucessResult:Function = null):*
	}
}
