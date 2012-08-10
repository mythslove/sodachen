/**
 * @ISubjects.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:AStruts2
 * <br>Date:2012-4-7
 */
package com.asframe.pattern.observer
{
	/**
	 *  多主题接口
	 * @author sodaChen
	 * @Date:2012-4-7
	 */
	public interface ISubjects extends ISendNotice
	{
		/**
		 * 设置生成一个新的主题的Class对象 
		 * @param subjectClass
		 * 
		 */		
		function setSubjectClass(subjectClass:Class):void;
		/**
		 * 添加一个观察者到指定通知的主题中
		 * @param notcie 指定的通知
		 * @param observer 观察者接口
		 * 
		 */		
		function addObserver(notcie:*,observer:IObserver):void;
		/**
		 * 根据指定通知删除一个观察者  
		 * @param observer 观察者接口
		 * 
		 */		
		function removeObserver(notcie:*,observer:IObserver):void;
		/**
		 * 发送一个通知，参数是一个数组 
		 * @param notice 通知主题
		 * @param args 参数数组
		 * 
		 */		
		function sendNoticeArg(notice:*,args:Array = null):void;
	}
}
