/**
 * @ShortObj.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-12
 */
package com.asframe.lang.obj
{
	import com.asframe.lang.abstract.AbstractNumber;
	
	/**
	 * 短整型的数据对象
	 * @author sodaChen
	 * Date:2012-1-12
	 */
	public class ShortObj extends AbstractNumber
	{
		/**
		 * A constant holding the minimum value a <code>short</code> can
		 * have, -2<sup>15</sup>.
		 */
		public static const MIN_VALUE:int = -32768;
		
		/**
		 * A constant holding the maximum value a <code>short</code> can
		 * have, 2<sup>15</sup>-1.
		 */
		public static const MAX_VALUE:int = 32767;
		
		/**
		 * The <code>Class</code> instance representing the primitive type
		 * <code>short</code>.
		 */
		public static const TYPE:Class = ShortObj;
		
		
		public function ShortObj(value:int = 0)
		{
			super(value);
		}
		public function shortValue():int
		{
			return value;
		}
	}
}
