/**
 * @ByteObj.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-12
 */
package com.asframe.lang
{
	import com.asframe.lang.abstract.AbstractNumber;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-1-12
	 */
	public class ByteObj extends AbstractNumber
	{
		/**
		 * 一个字节的最小值 <code>byte</code> 能有-2<sup>7</sup>.
		 */
		public static const MIN_VALUE:int = -128;
		
		/**
		 * 一个字节的最大值 <code>byte</code> 能有 2<sup>7</sup>-1.
		 */
		public static const MAX_VALUE:int = 127;
		
		/**
		 * 这个<code>Class</code> 实例的类型
		 * <code>byte</code>.
		 */
		public static const TYPE:Class = ByteObj;
		
		public function ByteObj()
		{
			super();
		}
	}
}
