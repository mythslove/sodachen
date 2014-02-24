/**
 * @CSVAndObj.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-23
 */
package com.asframe.conf
{
	import com.asframe.ref.Type;
	import com.asframe.utils.RefUtils;
	import com.asframe.utils.StringUtils;
	
	import flash.system.ApplicationDomain;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-2-23
	 */
	public class CSVAndObj extends ConfigAndObj
	{
		public function CSVAndObj()
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
			var resultClass:Class = null;
			if(classPath != null && classPath != "" && classPath.indexOf("type:") != -1)
			{
				var temps:Array = classPath.split(":");
				resultClass = initTargetClass(StringUtils.trim(temps[1]),target,applicationDomain);
				start = 2;
			}
			var type:Type = null;
			if(resultClass != Object)
			{
				type = Type.forClass(resultClass);
			}
			//名称的行数
			var keys:Array = contentArray[1].split(",");
			var keyLen:int = keys.length;
			var len:int = contentArray.length;
			var resultAry:Array = [];
			var values:Array = null;
			var result:* = null;
			for (var i:int = start; i < len; i++)
			{
				values = contentArray[i].split(",");
				if(values.length < 0)
				{
					continue;
				}
				result = new resultClass();
				resultAry.push(result);
				for (var j:int = 0; j < keyLen; j++) 
				{
					var name:String = StringUtils.trim(keys[j]);
					var value:String = StringUtils.trim(values[j]);
					var typeValue:String = null;
					result[name] = RefUtils.valueByType(name,value,type);
				}
			}
			return resultAry;
		}
		
		public override function objToConfig(obj:*):String
		{
			return null;
		}
	}
}
