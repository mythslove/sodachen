/**
 * @IShareObject.as.as
 * 
 * @author sodaChen mail:asframe#qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-3-31
 */
package com.asframe.share
{
	import com.asframe.lang.IDisposable;

	/**
	 * 共享对象接口，一个对象需要在被多个对象引用使用时的
	 * @author sodaChen
	 * Date:2013-3-31
	 */
	public interface IShareObject extends IDisposable
	{
		function setName(name:String):void;
		function getName():String;
		/**
		 * 设置引用次数为0时的回调处理接口 
		 * @param objectOver
		 * 
		 */		
		function setObjectOver(objectOver:IShareObjectOver):void;
		/**
		 * 使用，每调用一次该方法，引用次数会加1
		 */		
		function access():void;
		/**
		 * 放弃使用该对应，每调用一次，引用次数会减1，为0时则不会再减。
		 * 当city为0时。会调用内部的sharePool的objectOver方法。
		 * 有具体的实现决定是否对没有引用次数的对象做销毁或者其他动作。
		 * 当sharePool为空时，则会直接调用共享对象的dispose方法进行销毁，请注意。
		 */		
		function getout():void;
	}
}