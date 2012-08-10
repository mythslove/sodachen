/**
 * @IMultiLoader.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Load
 * <br>Date:2012-1-23
 */
package com.asframe.load.multi
{
	import com.asframe.lang.IDisposable;
	import com.asframe.lang.IUrlVersion;
	import com.asframe.load.ILoader;
	import com.asframe.loading.ILoading;
	import com.asframe.loading.IMultilLoading;

	/**
	 * 多加载器,同时加载多个资源,并以一定的形式进行加载。
	 * 每次调用load或者multiLoad为一次加载信号，每次都是独立的，可以连续地调用这些方法，结果不会互相影响。
	 * @author sodaChen
	 */
	public interface IMultiLoader extends ILoader
	{
		function set isByteLoad(_isByteLoad:Boolean):void;
		function get isByteLoad():Boolean;
		/**
		 * 添加默认的单个资源加载成功或者失败的回调函数 
		 * @param defaultOneSucess
		 * @param defaultOneFail
		 * 
		 */			
		function addDefaultOneResult(defaultOneSucess:Function,defaultOneFail:Function = null):void;
		
		/**
		 * 单个资源加载成功或者失败的触发函数
		 * （仅对单次load/multiLoad的调用有效，再次调用load/multiLoad，如果没有重新设置oneSucessResult，会自动调用addDefaultOneResult的回调函数）
		 * @param oneSucessResult
		 * @param oneFailResult
		 * 
		 */			
		function setOneResult(oneSucessResult:Function,oneFailResult:Function = null):void;
		/**
		 * 继续加载 
		 */		
		function start():void;
		/**
		 * 停止加载（暂停） 
		 * 
		 */		
		function stop():void;
		/**
		 * 停止并且清除需要加载的资源，恢复到没有加载任何资源的状态 
		 */		
		function clear():void;
		/**
		 * 开始加载下一个资源 
		 * @param url 资源路径
		 * @param target 目标
		 * @param complete 回调函数
		 */		
		function startLoadNext(url:String,target:*,complete:Function):void;
		/**
		 * 设置下一个加载器的解析器 
		 * @param nextLoader
		 * 
		 */		
		function setNextLoader(nextLoader:INextLoader):void;
	}
}
