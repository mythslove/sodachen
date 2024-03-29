/**
 * @IMap.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Collections
 * <br>Date:2012-1-4
 */
package com.asframe.collections.maps
{
	import com.asframe.collections.ICollection;
	import com.asframe.collections.IIterator;
	
	import flash.utils.Dictionary;

	/**
	 * 将键映射到值的对象。一个映射不能包含重复的键；每个键最多只能映射到一个值。 
	 * Map 接口提供三种collection 视图，允许以键集、值集或键-值映射关系集的形式查看某个映射的内容。
	 * 映射顺序 定义为迭代器在映射的 collection 视图上返回其元素的顺序。
	 * 某些映射实现可明确保证其顺序，如 TreeMap 类；另一些映射实现则不保证顺序，如 HashMap 类。
	 * @author sodaChen
	 * Date:2012-1-4
	 */
	public interface IMap
	{
		/**
		 * 将指定的值与此映射中的指定键相关联.
		 * @param key 与指定值相关联的键.
		 * @param value 与指定键相关联的值.
		 */
		function put(key:*,value:*):void;
		
		/**
		 * 返回此映射中映射到指定键的值.
		 * @param key 与指定值相关联的键.
		 * @return 此映射中映射到指定值的键，如果此映射不包含该键的映射关系，则返回 null.
		 */
		function get(key:*):*;
		
		/**
		 * 从此映射中移除所有映射关系
		 */
		function clear():void;
		
		/**
		 * 如果存在此键的映射关系，则将其从映射中移除
		 * @param key 从映射中移除其映射关系的键
		 * @return 以前与指定键相关联的值，如果没有该键的映射关系，则返回 null
		 */
		function remove(key:*):*;
		
		/**
		 * 返回此映射中的键-值映射关系数.
		 * @return 此映射中的键-值映射关系的个数.
		 */
		function size():int;
		
		/**
		 * 如果此映射未包含键-值映射关系，则返回 true.
		 * @return 如果此映射未包含键-值映射关系，则返回 true.
		 */
		function isEmpty():Boolean;
		
		/**
		 * 如果此映射包含指定键的映射关系，则返回 true.
		 * @param key  测试在此映射中是否存在的键.
		 * @return 如果此映射包含指定键的映射关系，则返回 true.
		 */
		function hasKey(key:*):Boolean;
		
		/**
		 * 如果该映射将一个或多个键映射到指定值，则返回 true.
		 * @param key 测试在该映射中是否存在的值
		 * @return 如果该映射将一个或多个键映射到指定值，则返回 true.
		 */
		function hasValue(value:*):Boolean;
		
		/**
		 * 返回此映射中包含的所有值.
		 * @return 包含所有值的数组
		 */
		function valuesToArray():Array;
		/**
		 * 返回value的迭代器 
		 * @return 
		 * 
		 */		
		function valueIterator():IIterator;
		
		/**
		 * 返回此映射中包含的所有key值.
		 * @return 包含所有key的数组
		 */
		function keysToArray():Array;
		/**
		 * 返回key的迭代器 
		 * @return 
		 * 
		 */		
		function keyIterator():IIterator;
		
		function values():ICollection;
		/**
		 * 获取到IMap的对象容器，注意，该方法一般不要使用，也不要太多共同使用。
		 * 除非是对性能要求非常高，而且需要确保不会直接修改该数组
		 * @return 
		 * 
		 */		
		function getContainer():Dictionary;
		
		function forEach(fun:Function):void;
	}
}
