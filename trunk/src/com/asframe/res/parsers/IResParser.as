/**
 * @IResParser.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-12
 */
package com.asframe.res.parsers
{
	import com.asframe.lang.IDestory;
	import com.asframe.res.data.ResData;

	/**
	 * 解析接口
	 * @author sodaChen
	 * #Date:2012-2-12
	 */
	public interface IResParser extends IDestory
	{
		/**
		 * 是否为异步。异步的话，则需要监听相关事件 
		 * @return 
		 * 
		 */		
		function isAsync():Boolean;
		/**
		 * 设置异步结束的回调函数。具体根据 ResParser的参数再作下异步，根据直接或者循环解析一样处理了。
		 * @param asyncComplete
		 * 
		 */		
		function setAsyncComplete(asyncComplete:Function):void;
		/**
		 * 添加一个需要解析的ResData对象 
		 * @param resData
		 * 
		 */		
		function addResData(resData:ResData):void;
		function getResData():ResData;
		/**
		 * 开始解析 
		 * 
		 */		
		function startParse():void;
		/**
		 * 是否解析完成 
		 * @return true表示解析完成，可以通过getRes获取到对应的数据
		 * 
		 */		
		function isComplete():Boolean;
		/**
		 * 是否暂停 
		 * @return 
		 * 
		 */		
		function isPaused():Boolean;
		/**
		 * 是否发生错误  
		 * @return 
		 * 
		 */		
		function isFailure():Boolean;
		/**
		 * 进行解析 
		 * @param time
		 * 
		 */		
		function onParse(time:int):void;
		/**
		 * 解析过程，这个是有系统调用，子类重写即可 
		 * @return 
		 * 
		 */		
		function proceedParsing():Boolean;
		/**
		 * 获取解析后的资源 
		 * @return 
		 * 
		 */		
		function getRes():*;
		
		function clean():void;
	}
}
