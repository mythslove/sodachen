/**
 * @PropertyAndObj.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-2-22
 */
package com.asframe.config.properties
{
	import com.asframe.config.ConfigAndObj;
	import com.asframe.ref.RefConts;
	import com.asframe.ref.Type;
	import com.asframe.ref.Variable;
	import com.asframe.utils.RefUtils;
	import com.asframe.utils.StringUtils;
	
	import flash.system.ApplicationDomain;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-2-22
	 */
	public class PropertiesAndObj extends ConfigAndObj
	{
		public function PropertiesAndObj()
		{
			super();
		}
		public override function configToObj(config:*, target:* = null, applicationDomain:ApplicationDomain = null):*
		{
			//先进行切割
			var contentArray:Array = config.split("\r\n");
			// 第一次行
			var classPath:String = contentArray[0];
			var start:int = 0;
			var targetClass:Class = null;
			if(classPath != null && classPath != "" && classPath.indexOf("type:") != -1)
			{
				var temps:Array = classPath.split(":");
				targetClass = initTargetClass(StringUtils.trim(temps[1]),target,applicationDomain);
				start = 1;
			}
			var type:Type = null;
			if(targetClass == null)
			{
				targetClass =  Object;
			}
			else if(targetClass != Object)
			{
				type = Type.forClass(targetClass);
			}
			if(target == null)
			{
				target = new targetClass();
			}
			var len:int = contentArray.length;
			for (var i:int = start; i < len; i++)
			{
				var values:Array = contentArray[i].split("=");
				if(values.length < 2)
				{
					continue;
				}
				var name:String = StringUtils.trim(values[0]);
				var value:String = StringUtils.trim(values[1]);
				target[name] = RefUtils.valueByType(name,value,type);
			}
			return target;
		}
		public override function objToConfig(obj:*):String
		{
			return null;
		}
	}
}
