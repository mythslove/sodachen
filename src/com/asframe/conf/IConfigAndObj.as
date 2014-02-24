/**
 * @IConfigToObj.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-20
 */
package com.asframe.conf
{
	import flash.system.ApplicationDomain;

	/**
	 * 配置文件与对象的转换接口
	 * @author sodaChen
	 * Date:2012-2-20
	 */
	public interface IConfigAndObj
	{
		/**
		 * 配置文件转换成对应的Obj  
		 * @param config:配置文件的文本信息
		 * @param target:最终返回目标对象（根对象），如果为Class，则变成实例。如果为字符串，则反射出实例(可选)
		 * @param applicationDomain:
		 * 
		 */			
		function configToObj(config:*,target:* = null, applicationDomain:ApplicationDomain = null):*;
		/**
		 * 把对象变成指定的文本文件
		 * @param obj
		 * @return 
		 * 
		 */		
		function objToConfig(obj:*):String;
	}
}
