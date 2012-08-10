/**
 * @ConfigAndObj.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-2-21
 */
package com.asframe.config
{
	import com.asframe.utils.ClassUtils;
	import flash.system.ApplicationDomain;
	
	/**
	 * 配置和对象的基类
	 * @author sodaChen
	 * @Date:2012-2-21
	 */
	public class ConfigAndObj implements IConfigAndObj
	{
		public function ConfigAndObj()
		{
		}
		
		public function configToObj(config:*, target:* = null, applicationDomain:ApplicationDomain = null):*
		{
			return null;
		}
		
		public function objToConfig(obj:*):String
		{
			return null;
		}
		protected function initTargetClass(classPath:String,target:*,applicationDomain:ApplicationDomain):Class
		{
			var targetClass:Class = null;
			if(target == null)
			{
				if(classPath != null && classPath != "")
				{
					targetClass = ClassUtils.forName(classPath,applicationDomain);
					target = new targetClass();
				}
				else
				{
					targetClass = ClassUtils.forName("Object",applicationDomain);
				}
			}
			else
			{
				targetClass = ClassUtils.forInstance(target,applicationDomain);
			}
			return targetClass;
		}
	}
}
