/**
 * @ObjectUtils.as
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
	 *
	 * @author sodaChen
	 * Date:2012-1-14
	 */
	public final class ObjectUtils
	{
		public static function hasValue( o:Object, member:* ):Boolean
		{
			for( var m:* in o )
			{
				if( o[m] == member )
				{
					return true;
				}
			}
			return false;
		}
		
		public static function hasKey( o:Object, member:* ):Boolean
		{
			for( var m:* in o )
			{
				if( m == member )
				{
					return true;
				}
			}
			return false;
		}
		public static function clone(o:Object):*
		{
			var buffer:ByteArray = new ByteArray();
			buffer.writeObject( o );
			buffer.position = 0;
			return buffer.readObject();
		}
		public static function copy( o:Object):Object
		{
			var copy:Object = {};
			for( var member:String in o )
			{
				copy[ member ] = o[ member ];
			}
			return copy;
		}
		public static function isExplicitInstanceOf(object:Object, clazz:Class):Boolean 
		{
			var c:Class = ClassUtils.forInstance(object);
			return (c === clazz);
		}
		/**
		 * Returns the class name of the given object.
		 */
		public static function getClassName(object:Object):String {
			return ClassUtils.getClassName(ClassUtils.forInstance(object));
		}
		
		/**
		 * Returns the fully qualified class name of the given object.
		 */
		public static function getFullyQualifiedClassName(object:Object, replaceColons:Boolean = false):String {
			return ClassUtils.getFullyQualifiedName(ClassUtils.forInstance(object), replaceColons);
		}
	}
}
