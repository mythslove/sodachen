/**
 * @ISpriteContainer.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-10-6
 */
package com.asframe.display
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * 具备Sprite作为容器的接口对象
	 * @author sodaChen
	 * Date:2012-10-6
	 */
	public interface ISpriteContainer
	{
		/**
		 * 将一个 DisplayObject 子实例添加到该 DisplayObjectContainer 实例中。
		 * 如果添加一个已将其它显示对象容器作为父项的子对象，则会从其它显示对象容器的子列表中删除该对象。 
		 * @param child 要作为该 DisplayObjectContainer 实例的子项添加的 DisplayObject 实例。
		 * @return 在 child 参数中传递的 DisplayObject 实例。 
		 * 
		 */		
		function addChild(child:DisplayObject):DisplayObject;
		/**
		 * 将一个 DisplayObject 子实例添加到该 DisplayObjectContainer 实例中。
		 * @param child 要作为该 DisplayObjectContainer 实例的子项添加的 DisplayObject 实例。
		 * @param index 指定的位置
		 * @return 
		 * 
		 */		
		function addChildAt(child:DisplayObject, index:int):DisplayObject
		/**
		 * 确定指定显示对象是 DisplayObjectContainer 实例的子项还是该实例本身。 
		 * @param child
		 * @return 
		 * 
		 */		
		function contains(child:DisplayObject):Boolean;
		/**
		 * 返回位于指定索引处的子显示对象实例。 
		 * @param index
		 * @return 
		 * 
		 */		
		function getChildAt(index:int):DisplayObject;
		/**
		 * 从 DisplayObjectContainer 实例的子列表中删除指定的 child DisplayObject 实例。 
		 * @param child
		 * @return 
		 * 
		 */		
		function removeChild(child:DisplayObject):DisplayObject;
		/**
		 * 从 DisplayObjectContainer 的子列表中指定的 index 位置删除子 DisplayObject。 
		 * @param index
		 * @return 
		 * 
		 */		
		function removeChildAt(index:int):DisplayObject;
		/**
		 * 更改现有子项在显示对象容器中的位置。 
		 * @param child
		 * @param index
		 * 
		 */		
		function setChildIndex(child:DisplayObject, index:int):void;
		/**
		 * 交换两个指定子对象的 Z 轴顺序（从前到后顺序）。 
		 * @param child1
		 * @param child2
		 * 
		 */		
		function swapChildren(child1:DisplayObject, child2:DisplayObject):void;
		/**
		 * 在子级列表中两个指定的索引位置，交换子对象的 Z 轴顺序（前后顺序）。 
		 * @param index1
		 * @param index2
		 * 
		 */		
		function swapChildrenAt(index1:int, index2:int):void
		/**
		 * 获取一个Sprite容器
		 * @return 
		 * 
		 */		
		function getContainer():Sprite;
	}
}
