/**
 * @ISubject.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-4-8
 */
package com.asframe.pattern.observer
{
	/**
	 * 单一主题接口
	 * @author sodaChen
	 * Date:2012-4-8
	 */
	public interface ISubject extends ISendNotice
	{
		/**
		 * 获取到监听该主题的观察者的长度 
		 * @return 
		 * 
		 */		
		function length():int;
		/**
		 * 添加一个观察者 
		 * @param observer 观察者接口
		 * 
		 */		
		function addObserver(observer:IObserver):void;
		/**
		 * 删除一个观察者  
		 * @param observer 观察者接口
		 * 
		 */		
		function removeObserver(observer:IObserver):void;
	}
}
