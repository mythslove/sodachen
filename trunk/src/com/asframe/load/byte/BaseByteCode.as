/**
 * @BaseByteCode.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-7-6
 */
package com.asframe.load.byte
{
	import flash.utils.ByteArray;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2012-7-6
	 */
	public class BaseByteCode implements IByteCode
	{
		protected var compress:Boolean;
		
		public function BaseByteCode()
		{
		}
		
		public function isCompress(compress:Boolean):void
		{
			this.compress = compress;
		}
		
		public function byteCode(byteArray:ByteArray, sucessResult:Function=null):*
		{
			if(compress)
			{
				byteArray.uncompress();
			}
			return onByteCode(byteArray,sucessResult);
		}
		/**
		 * 具体的界面动作，可以由子类进行重写 
		 * @param byteArray
		 * @param sucessResult
		 * @return 
		 * 
		 */		
		protected function onByteCode(byteArray:ByteArray, sucessResult:Function):*
		{
			return null;
		}
	}
}
