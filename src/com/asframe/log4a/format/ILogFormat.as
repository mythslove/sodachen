/**
 * @ILogFormat.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-9-9
 */
package com.asframe.log4a.format
{
	import com.asframe.log4a.ILogOutput;
	import com.asframe.log4a.Level;

	/**
	 * 日志的生成格式接口
	 * @author sodaChen
	 * @Date:2011-9-9
	 */
	public interface ILogFormat
	{
		/**
		 * 设置日志输出的等级
		 * @param level
		 * 
		 */		
		function setLevel(level:Level):void;
		/**
		 * 是否显示时间 
		 * @param showTime
		 * @param dateFormat
		 * 
		 */		
		function isShowTime(showTime:Boolean,dateFormat:String = null):void;
		/**
		 * 目标的格式处理对象
		 * @param targetForamt
		 * 
		 */		
		function setTargetForamt(targetForamt:ITargetForamt):void;
		/**
		 * 日志头的处理 
		 * @param headFormat
		 * 
		 */		
		function setHeadFormat(headFormat:ILogHeadFormat):void;
		/**
		 * 添加一个对象处理格式 
		 * @param objectFormat：对象处理格式接口
		 * 
		 */		
		function addObjectFormat(objectFormat:IObjectFormat):void;
		/**
		 * 设置日志格式好的最终输出的接口 
		 * @param logOutput
		 * 
		 */
		function setLogOutput(logOutput:ILogOutput):void;
		/**
		 * 对日志内容进行格式化 
		 * @param target:日志发生的对象
		 * @param msgs:日志内容数组
		 * 
		 */		
		function logFormat(target:Object,arg0:Object,arg1:Object,arg2:Object):void
	}
}
