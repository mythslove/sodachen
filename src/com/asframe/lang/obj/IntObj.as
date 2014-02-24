/**
 * @IntObj.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-3
 */
package com.asframe.lang.obj
{
	import com.asframe.lang.IComparable;
	import com.asframe.lang.abstract.AbstractNumber;
	import com.asframe.lang.error.IllegalArgumentError;
	import com.asframe.lang.error.NumberFormatError;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-1-3
	 */
	public final class IntObj extends AbstractNumber implements IComparable
	{
		/**
		 * A constant holding the minimum value an <code>int</code> can
		 * have, -2<sup>31</sup>.
		 */
		public static const MIN_VALUE					:int = 0x80000000;
		
		/**
		 * A constant holding the maximum value an <code>int</code> can
		 * have, 2<sup>31</sup>-1.
		 */
		public static const  MAX_VALUE				:int = 0x7fffffff;
		
		public static const TYPE						:Class = IntObj;
		
		/**
		 * All possible chars for representing a number as a String
		 */
		private static const digits:Array = [
			'0' , '1' , '2' , '3' , '4' , '5' ,
			'6' , '7' , '8' , '9' , 'a' , 'b' ,
			'c' , 'd' , 'e' , 'f' , 'g' , 'h' ,
			'i' , 'j' , 'k' , 'l' , 'm' , 'n' ,
			'o' , 'p' , 'q' , 'r' , 's' , 't' ,
			'u' , 'v' , 'w' , 'x' , 'y' , 'z'
		];
		
		
		/**
		 * Returns a string representation of the integer argument as an
		 * unsigned integer in base&nbsp;16.
		 * <p>
		 * The unsigned integer value is the argument plus 2<sup>32</sup>
		 * if the argument is negative; otherwise, it is equal to the
		 * argument.  This value is converted to a string of ASCII digits
		 * in hexadecimal (base&nbsp;16) with no extra leading
		 * <code>0</code>s. If the unsigned magnitude is zero, it is
		 * represented by a single zero character <code>'0'</code>
		 * (<code>'&#92;u0030'</code>); otherwise, the first character of
		 * the representation of the unsigned magnitude will not be the
		 * zero character. The following characters are used as
		 * hexadecimal digits:
		 * <blockquote><pre>
		 * 0123456789abcdef
		 * </pre></blockquote>
		 * These are the characters <code>'&#92;u0030'</code> through
		 * <code>'&#92;u0039'</code> and <code>'&#92;u0061'</code> through
		 * <code>'&#92;u0066'</code>. If uppercase letters are
		 * desired, the {@link java.lang.String#toUpperCase()} method may
		 * be called on the result:
		 * <blockquote><pre>
		 * Integer.toHexString(n).toUpperCase()
		 * </pre></blockquote>
		 *
		 * @param   i   an integer to be converted to a string.
		 * @return  the string representation of the unsigned integer value
		 *          represented by the argument in hexadecimal (base&nbsp;16).
		 * @since   JDK1.0.2
		 */
//		public static function toHexString(i:int) {
//			return toUnsignedString(i, 4);
//		}
		
		/**
		 * Returns a string representation of the integer argument as an
		 * unsigned integer in base&nbsp;8.
		 * <p>
		 * The unsigned integer value is the argument plus 2<sup>32</sup>
		 * if the argument is negative; otherwise, it is equal to the
		 * argument.  This value is converted to a string of ASCII digits
		 * in octal (base&nbsp;8) with no extra leading <code>0</code>s.
		 * <p>
		 * If the unsigned magnitude is zero, it is represented by a
		 * single zero character <code>'0'</code>
		 * (<code>'&#92;u0030'</code>); otherwise, the first character of
		 * the representation of the unsigned magnitude will not be the
		 * zero character. The following characters are used as octal
		 * digits:
		 * <blockquote><pre>
		 * 01234567
		 * </pre></blockquote>
		 * These are the characters <code>'&#92;u0030'</code> through
		 * <code>'&#92;u0037'</code>.
		 *
		 * @param   i   an integer to be converted to a string.
		 * @return  the string representation of the unsigned integer value
		 *          represented by the argument in octal (base&nbsp;8).
		 * @since   JDK1.0.2
		 */
//		public static function toOctalString(i:int) 
//		{
//			return toUnsignedString(i, 3);
//		}
		
		/**
		 * Returns a string representation of the integer argument as an
		 * unsigned integer in base&nbsp;2.
		 * <p>
		 * The unsigned integer value is the argument plus 2<sup>32</sup>
		 * if the argument is negative; otherwise it is equal to the
		 * argument.  This value is converted to a string of ASCII digits
		 * in binary (base&nbsp;2) with no extra leading <code>0</code>s.
		 * If the unsigned magnitude is zero, it is represented by a
		 * single zero character <code>'0'</code>
		 * (<code>'&#92;u0030'</code>); otherwise, the first character of
		 * the representation of the unsigned magnitude will not be the
		 * zero character. The characters <code>'0'</code>
		 * (<code>'&#92;u0030'</code>) and <code>'1'</code>
		 * (<code>'&#92;u0031'</code>) are used as binary digits.
		 *
		 * @param   i   an integer to be converted to a string.
		 * @return  the string representation of the unsigned integer value
		 *          represented by the argument in binary (base&nbsp;2).
		 * @since   JDK1.0.2
		 */
//		public static function toBinaryString(i:int) {
//			return toUnsignedString(i, 1);
//		}
		
//		/**
//		 * Convert the integer to an unsigned number.
//		 */
//		private static function toUnsignedString(i:int, int shift):String
//		{
//			var buf:Array = [];
//			var charPos:int = 32;
//			var radix:int = 1 << shift;
//			var mask:int = radix - 1;
//			do 
//			{
//				buf[--charPos] = digits[i & mask];
//				i >>>= shift;
//			}
//			while (i != 0);
//			
//			return new String(buf, charPos, (32 - charPos));
//		}
//		
		
		private static const DigitTens:Array = [
			'0', '0', '0', '0', '0', '0', '0', '0', '0', '0',
			'1', '1', '1', '1', '1', '1', '1', '1', '1', '1',
			'2', '2', '2', '2', '2', '2', '2', '2', '2', '2',
			'3', '3', '3', '3', '3', '3', '3', '3', '3', '3',
			'4', '4', '4', '4', '4', '4', '4', '4', '4', '4',
			'5', '5', '5', '5', '5', '5', '5', '5', '5', '5',
			'6', '6', '6', '6', '6', '6', '6', '6', '6', '6',
			'7', '7', '7', '7', '7', '7', '7', '7', '7', '7',
			'8', '8', '8', '8', '8', '8', '8', '8', '8', '8',
			'9', '9', '9', '9', '9', '9', '9', '9', '9', '9',
		] ; 
		
		private static const DigitOnes:Array = [ 
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
		] ;

		/**
		 * Parses the string argument as a signed integer in the radix 
		 * specified by the second argument. The characters in the string 
		 * must all be digits of the specified radix (as determined by 
		 * whether {@link java.lang.Character#digit(char, int)} returns a 
		 * nonnegative value), except that the first character may be an 
		 * ASCII minus sign <code>'-'</code> (<code>'&#92;u002D'</code>) to 
		 * indicate a negative value. The resulting integer value is returned. 
		 * <p>
		 * An exception of type <code>NumberFormatException</code> is
		 * thrown if any of the following situations occurs:
		 * <ul>
		 * <li>The first argument is <code>null</code> or is a string of
		 * length zero.
		 * <li>The radix is either smaller than 
		 * {@link java.lang.Character#MIN_RADIX} or
		 * larger than {@link java.lang.Character#MAX_RADIX}. 
		 * <li>Any character of the string is not a digit of the specified
		 * radix, except that the first character may be a minus sign
		 * <code>'-'</code> (<code>'&#92;u002D'</code>) provided that the
		 * string is longer than length 1.
		 * <li>The value represented by the string is not a value of type
		 * <code>int</code>. 
		 * </ul><p>
		 * Examples:
		 * <blockquote><pre>
		 * parseInt("0", 10) returns 0
		 * parseInt("473", 10) returns 473
		 * parseInt("-0", 10) returns 0
		 * parseInt("-FF", 16) returns -255
		 * parseInt("1100110", 2) returns 102
		 * parseInt("2147483647", 10) returns 2147483647
		 * parseInt("-2147483648", 10) returns -2147483648
		 * parseInt("2147483648", 10) throws a NumberFormatException
		 * parseInt("99", 8) throws a NumberFormatException
		 * parseInt("Kona", 10) throws a NumberFormatException
		 * parseInt("Kona", 27) returns 411787
		 * </pre></blockquote>
		 *
		 * @param      s   the <code>String</code> containing the integer 
		 * 			representation to be parsed
		 * @param      radix   the radix to be used while parsing <code>s</code>.
		 * @return     the integer represented by the string argument in the
		 *             specified radix.
		 * @exception  NumberFormatException if the <code>String</code>
		 * 		   does not contain a parsable <code>int</code>.
		 */
		public static function parseInt(s:String):int
		{
			if (s == null) 
			{
				throw new NumberFormatError("null");
			}
			return 0;
		}
		
		/**
		 * Returns a <tt>Integer</tt> instance representing the specified
		 * <tt>int</tt> value.
		 * If a new <tt>Integer</tt> instance is not required, this method
		 * should generally be used in preference to the constructor
		 * {@link #Integer(int)}, as this method is likely to yield
		 * significantly better space and time performance by caching
		 * frequently requested values.
		 *
		 * @param  i an <code>int</code> value.
		 * @return a <tt>Integer</tt> instance representing <tt>i</tt>.
		 * @since  1.5
		 */
		public static function valueOf(i:int) :IntObj
		{
			return new IntObj(i);
		}
		
		
		/**
		 * Constructs a newly allocated <code>Integer</code> object that
		 * represents the <code>int</code> value indicated by the
		 * <code>String</code> parameter. The string is converted to an
		 * <code>int</code> value in exactly the manner used by the
		 * <code>parseInt</code> method for radix 10.
		 *
		 * @param      s   the <code>String</code> to be converted to an
		 *                 <code>Integer</code>.
		 * @exception  NumberFormatException  if the <code>String</code> does not
		 *               contain a parsable integer.
		 * @see        java.lang.Integer#parseInt(java.lang.String, int)
		 */
		public function IntObj(value : *) :void
		{
			if(value is int)
			{
				this.value = value;
			}
			else if(value is String)
			{
				this.value = parseInt(value);
			}
			else
			{
				throw new NumberFormatError("参数不是int或者字符串");
			}
		}
		
		/**
		 * Returns the value of this <code>Integer</code> as a
		 * <code>byte</code>.
		 */
		public function byteValue() :int
		{
			return value;
		}
		
		/**
		 * Returns the value of this <code>Integer</code> as a
		 * <code>short</code>.
		 */
		public function shortValue() :int
		{
			return value;
		}
		
		/**
		 * Returns the value of this <code>Integer</code> as an
		 * <code>int</code>.
		 */
		public override function intValue() :int
		{
			return value;
		}
		
		/**
		 * Returns the value of this <code>Integer</code> as a
		 * <code>long</code>.
		 */
		public override function longValue() :Number
		{
			return Number(value);
		}
		
		/**
		 * Returns the value of this <code>Integer</code> as a
		 * <code>float</code>.
		 */
		public function floatValue() :Number
		{
			return Number(value);
		}
		
		/**
		 * Returns the value of this <code>Integer</code> as a
		 * <code>double</code>.
		 */
		public override function doubleValue() :Number
		{
			return Number(value);
		}
		
		/**
		 * Returns a <code>String</code> object representing this
		 * <code>Integer</code>'s value. The value is converted to signed
		 * decimal representation and returned as a string, exactly as if
		 * the integer value were given as an argument to the {@link
		 * java.lang.Integer#toString(int)} method.
		 *
		 * @return  a string representation of the value of this object in
		 *          base&nbsp;10.
		 */
		public function toString() :String
		{
			return value.toString();
		}
		
		
		/**
		 * Compares this object to the specified object.  The result is
		 * <code>true</code> if and only if the argument is not
		 * <code>null</code> and is an <code>Integer</code> object that
		 * contains the same <code>int</code> value as this object.
		 *
		 * @param   obj   the object to compare with.
		 * @return  <code>true</code> if the objects are the same;
		 *          <code>false</code> otherwise.
		 */
		public function equals(o : *) :Boolean
		{
			if (o != null && o is IntObj) 
			{
				return value == IntObj(o).intValue();
			}
			return false;
		}
		
		
		
		
		
		/**
		 * Decodes a <code>String</code> into an <code>Integer</code>.
		 * Accepts decimal, hexadecimal, and octal numbers given
		 * by the following grammar:
		 *
		 * <blockquote>
		 * <dl>
		 * <dt><i>DecodableString:</i>
		 * <dd><i>Sign<sub>opt</sub> DecimalNumeral</i>
		 * <dd><i>Sign<sub>opt</sub></i> <code>0x</code> <i>HexDigits</i>
		 * <dd><i>Sign<sub>opt</sub></i> <code>0X</code> <i>HexDigits</i>
		 * <dd><i>Sign<sub>opt</sub></i> <code>#</code> <i>HexDigits</i>
		 * <dd><i>Sign<sub>opt</sub></i> <code>0</code> <i>OctalDigits</i>
		 * <p>
		 * <dt><i>Sign:</i>
		 * <dd><code>-</code>
		 * </dl>
		 * </blockquote>
		 *
		 * <i>DecimalNumeral</i>, <i>HexDigits</i>, and <i>OctalDigits</i>
		 * are defined in <a href="http://java.sun.com/docs/books/jls/second_edition/html/lexical.doc.html#48282">&sect;3.10.1</a> 
		 * of the <a href="http://java.sun.com/docs/books/jls/html/">Java 
		 * Language Specification</a>.
		 * <p>
		 * The sequence of characters following an (optional) negative
		 * sign and/or radix specifier (&quot;<code>0x</code>&quot;,
		 * &quot;<code>0X</code>&quot;, &quot;<code>#</code>&quot;, or
		 * leading zero) is parsed as by the <code>Integer.parseInt</code>
		 * method with the indicated radix (10, 16, or 8).  This sequence
		 * of characters must represent a positive value or a {@link
		 * NumberFormatException} will be thrown.  The result is negated
		 * if first character of the specified <code>String</code> is the
		 * minus sign.  No whitespace characters are permitted in the
		 * <code>String</code>.
		 *
		 * @param     nm the <code>String</code> to decode.
		 * @return    a <code>Integer</code> object holding the <code>int</code>
		 *		   value represented by <code>nm</code>
		 * @exception NumberFormatException  if the <code>String</code> does not
		 *            contain a parsable integer.
		 * @see java.lang.Integer#parseInt(java.lang.String, int)
		 */
//		public static function decode(nm:String) :int 
//		{
//			var radix:int = 10;
//			var index:int = 0;
//			var negative:Boolean = false;
//			var result:IntObj = null;
//			
//			// Handle minus sign, if present  startsWith
//			if (nm.indexOf("-") != -1) 
//			{
//				negative = true;
//				index++;
//			}
//			
//			// Handle radix specifier, if present
//			if (nm.indexOf("0x", index) || nm.indexOf("0X", index)) 
//			{
//				index += 2;
//				radix = 16;
//			}
//			else if (nm.indexOf("#", index)) 
//			{
//				index ++;
//				radix = 16;
//			}
//			else if (nm.indexOf("0", index) && nm.length() > 1 + index) 
//			{
//				index ++;
//				radix = 8;
//			}
//			
//			if (nm.indexOf("-", index))
//			{
//				throw new NumberFormatError("Negative sign in wrong position");
//			}
//	
//			try 
//			{
//				result = IntObj.valueOf(nm.substring(index), radix);
//				result = negative ? IntObj.valueOf(-result.intValue()) : result;
//			} 
//			catch (error:NumberFormatError) 
//			{
//				// If number is Integer.MIN_VALUE, we'll end up here. The next line
//				// handles this case, and causes any genuine format error to be
//				// rethrown.
//				var constant:String = negative ? "-" + nm.substring(index) : nm.substring(index);
//				result = IntObj.valueOf(constant, radix);
//			}
//			return result;
//		}
		
		/**
		 * Compares two <code>Integer</code> objects numerically.
		 *
		 * @param   anotherInteger   the <code>Integer</code> to be compared.
		 * @return	the value <code>0</code> if this <code>Integer</code> is
		 * 		equal to the argument <code>Integer</code>; a value less than
		 * 		<code>0</code> if this <code>Integer</code> is numerically less
		 * 		than the argument <code>Integer</code>; and a value greater 
		 * 		than <code>0</code> if this <code>Integer</code> is numerically
		 * 		 greater than the argument <code>Integer</code> (signed
		 * 		 comparison).
		 * @since   1.2
		 */
		public function compareTo(o : Object) :int
		{
			if(o is IntObj)
			{
				var thisVal:int = this.value;
				var anotherVal:int = o.value;
				return (thisVal < anotherVal ? -1 : (thisVal == anotherVal ? 0 : 1));
			}
			throw new IllegalArgumentError("compareTo的参数不是IntObj");
		}
		
		
		// Bit twiddling
		
		/**
		 * The number of bits used to represent an <tt>int</tt> value in two's
		 * complement binary form.
		 *
		 * @since 1.5
		 */
		public static const SIZE:int = 32;
		
		/**
		 * Returns an <tt>int</tt> value with at most a single one-bit, in the
		 * position of the highest-order ("leftmost") one-bit in the specified
		 * <tt>int</tt> value.  Returns zero if the specified value has no
		 * one-bits in its two's complement binary representation, that is, if it
		 * is equal to zero.
		 *
		 * @return an <tt>int</tt> value with a single one-bit, in the position
		 *     of the highest-order one-bit in the specified value, or zero if
		 *     the specified value is itself equal to zero.
		 * @since 1.5
		 */
		public static function highestOneBit(i:int) :int
		{
			// HD, Figure 3-1
			i |= (i >>  1);
			i |= (i >>  2);
			i |= (i >>  4);
			i |= (i >>  8);
			i |= (i >> 16);
			return i - (i >>> 1);
		}
		
		/**
		 * Returns an <tt>int</tt> value with at most a single one-bit, in the
		 * position of the lowest-order ("rightmost") one-bit in the specified
		 * <tt>int</tt> value.  Returns zero if the specified value has no
		 * one-bits in its two's complement binary representation, that is, if it
		 * is equal to zero.
		 *
		 * @return an <tt>int</tt> value with a single one-bit, in the position
		 *     of the lowest-order one-bit in the specified value, or zero if
		 *     the specified value is itself equal to zero.
		 * @since 1.5
		 */
		public static function lowestOneBit(i:int) :int
		{
			// HD, Section 2-1
			return i & -i;
		}
		
		/**
		 * Returns the number of zero bits preceding the highest-order
		 * ("leftmost") one-bit in the two's complement binary representation
		 * of the specified <tt>int</tt> value.  Returns 32 if the
		 * specified value has no one-bits in its two's complement representation,
		 * in other words if it is equal to zero.
		 *
		 * <p>Note that this method is closely related to the logarithm base 2.
		 * For all positive <tt>int</tt> values x:
		 * <ul>
		 * <li>floor(log<sub>2</sub>(x)) = <tt>31 - numberOfLeadingZeros(x)</tt>
		 * <li>ceil(log<sub>2</sub>(x)) = <tt>32 - numberOfLeadingZeros(x - 1)</tt>
		 * </ul>
		 *
		 * @return the number of zero bits preceding the highest-order
		 *     ("leftmost") one-bit in the two's complement binary representation
		 *     of the specified <tt>int</tt> value, or 32 if the value
		 *     is equal to zero.
		 * @since 1.5
		 */
		public static function numberOfLeadingZeros(i:int) :int
		{
			// HD, Figure 5-6
			if (i == 0)
				return 32;
			var n:int = 1;
			if (i >>> 16 == 0) { n += 16; i <<= 16; }
			if (i >>> 24 == 0) { n +=  8; i <<=  8; }
			if (i >>> 28 == 0) { n +=  4; i <<=  4; }
			if (i >>> 30 == 0) { n +=  2; i <<=  2; }
			n -= i >>> 31;
			return n;
		}
		
		/**
		 * Returns the number of zero bits following the lowest-order ("rightmost")
		 * one-bit in the two's complement binary representation of the specified
		 * <tt>int</tt> value.  Returns 32 if the specified value has no
		 * one-bits in its two's complement representation, in other words if it is
		 * equal to zero.
		 *
		 * @return the number of zero bits following the lowest-order ("rightmost")
		 *     one-bit in the two's complement binary representation of the
		 *     specified <tt>int</tt> value, or 32 if the value is equal
		 *     to zero.
		 * @since 1.5
		 */
		public static function numberOfTrailingZeros(i:int) :int
		{
			// HD, Figure 5-14
			var y:int;
			if (i == 0) return 32;
			var n:int = 31;
			y = i <<16; if (y != 0) { n = n -16; i = y; }
			y = i << 8; if (y != 0) { n = n - 8; i = y; }
			y = i << 4; if (y != 0) { n = n - 4; i = y; }
			y = i << 2; if (y != 0) { n = n - 2; i = y; }
			return n - ((i << 1) >>> 31);
		}
		
		/**
		 * Returns the number of one-bits in the two's complement binary
		 * representation of the specified <tt>int</tt> value.  This function is
		 * sometimes referred to as the <i>population count</i>.
		 *
		 * @return the number of one-bits in the two's complement binary
		 *     representation of the specified <tt>int</tt> value.
		 * @since 1.5
		 */
		public static function bitCount(i:int) :int
		{
			// HD, Figure 5-2
			i = i - ((i >>> 1) & 0x55555555);
			i = (i & 0x33333333) + ((i >>> 2) & 0x33333333);
			i = (i + (i >>> 4)) & 0x0f0f0f0f;
			i = i + (i >>> 8);
			i = i + (i >>> 16);
			return i & 0x3f;
		}
		
		/**
		 * Returns the value obtained by rotating the two's complement binary
		 * representation of the specified <tt>int</tt> value left by the
		 * specified number of bits.  (Bits shifted out of the left hand, or
		 * high-order, side reenter on the right, or low-order.)
		 *
		 * <p>Note that left rotation with a negative distance is equivalent to
		 * right rotation: <tt>rotateLeft(val, -distance) == rotateRight(val,
		 * distance)</tt>.  Note also that rotation by any multiple of 32 is a
		 * no-op, so all but the last five bits of the rotation distance can be
		 * ignored, even if the distance is negative: <tt>rotateLeft(val,
		 * distance) == rotateLeft(val, distance & 0x1F)</tt>.
		 *
		 * @return the value obtained by rotating the two's complement binary
		 *     representation of the specified <tt>int</tt> value left by the
		 *     specified number of bits.
		 * @since 1.5
		 */
		public static function rotateLeft(i:int, distance:int) :int
		{
			return (i << distance) | (i >>> -distance);
		}
		/**
		 * Returns the value obtained by rotating the two's complement binary
		 * representation of the specified <tt>int</tt> value right by the
		 * specified number of bits.  (Bits shifted out of the right hand, or
		 * low-order, side reenter on the left, or high-order.)
		 *
		 * <p>Note that right rotation with a negative distance is equivalent to
		 * left rotation: <tt>rotateRight(val, -distance) == rotateLeft(val,
		 * distance)</tt>.  Note also that rotation by any multiple of 32 is a
		 * no-op, so all but the last five bits of the rotation distance can be
		 * ignored, even if the distance is negative: <tt>rotateRight(val,
		 * distance) == rotateRight(val, distance & 0x1F)</tt>.
		 *
		 * @return the value obtained by rotating the two's complement binary
		 *     representation of the specified <tt>int</tt> value right by the
		 *     specified number of bits.
		 * @since 1.5
		 */
		public static function rotateRight(i:int, distance:int) :int
		{
			return (i >>> distance) | (i << -distance);
		}
		
		/**
		 * Returns the value obtained by reversing the order of the bits in the
		 * two's complement binary representation of the specified <tt>int</tt>
		 * value.
		 *
		 * @return the value obtained by reversing order of the bits in the
		 *     specified <tt>int</tt> value.
		 * @since 1.5
		 */
		public static function reverse(i:int):int
		{
			// HD, Figure 7-1
			i = (i & 0x55555555) << 1 | (i >>> 1) & 0x55555555;
			i = (i & 0x33333333) << 2 | (i >>> 2) & 0x33333333;
			i = (i & 0x0f0f0f0f) << 4 | (i >>> 4) & 0x0f0f0f0f;
			i = (i << 24) | ((i & 0xff00) << 8) |
				((i >>> 8) & 0xff00) | (i >>> 24);
			return i;
		}
		/**
		 * Returns the signum function of the specified <tt>int</tt> value.  (The
		 * return value is -1 if the specified value is negative; 0 if the
		 * specified value is zero; and 1 if the specified value is positive.)
		 *
		 * @return the signum function of the specified <tt>int</tt> value.
		 * @since 1.5
		 */
		public static function signum(i:int):int
		{
			// HD, Section 2-7
			return (i >> 31) | (-i >>> 31);
		}
		
		/**
		 * Returns the value obtained by reversing the order of the bytes in the
		 * two's complement representation of the specified <tt>int</tt> value.
		 *
		 * @return the value obtained by reversing the bytes in the specified
		 *     <tt>int</tt> value.
		 * @since 1.5
		 */
		public static function reverseBytes(i:int):int
		{
			return ((i >>> 24)           ) |
				((i >>   8) &   0xFF00) |
				((i <<   8) & 0xFF0000) |
				((i << 24));
		}
	}
}
