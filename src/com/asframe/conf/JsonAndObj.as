package com.asframe.conf
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.ref.Metadata;
	import com.asframe.ref.RefConts;
	import com.asframe.ref.Type;
	import com.asframe.ref.Variable;
	import com.asframe.utils.ClassUtils;
	import com.asframe.utils.RefUtils;
	
	import flash.system.ApplicationDomain;

	public class JsonAndObj extends ConfigAndObj
	{
		private static var cacheType:HashMap = new HashMap();
		public override function configToObj(config:*, target:* = null, applicationDomain:ApplicationDomain = null):*
		{
			var jsonData:Object = JSON.parse(config);
			if(target == null)
			{
				return jsonData;
			}
			//转换指定的target
			changeObject(jsonData,target);
			return target;
		}
		
		private function changeObject(jsonData:Object,target:*):void
		{
			var variable:Variable = null;
			var type:Type = getType(target);
			var propertyType:String = null;
			for(var key:String in jsonData) 
			{
				variable = type.getVariable(key);
				if(variable == null)
				{
					throw new Error(target + "转换错误，没有" + key + "属性");
				}
				propertyType = variable.type;
				//只处理数组和对象
				if(propertyType == RefConts.BOOLEAN_TYPE || propertyType == RefConts.INT_TYPE
					|| propertyType == RefConts.NUMBER_TYPE || propertyType == RefConts.UINT_TYPE
					|| propertyType == RefConts.STRING_TYPE || propertyType == RefConts.OBJECT_TYPE)
				{
					target[key] = jsonData[key];
				}
				else if(propertyType == RefConts.ARRAY_TYPE)
				{
					//查看是否有Class标签
					var metadata:Metadata = variable.getMetadata("Class");
					if(metadata != null && metadata.firestArg != null)
					{
						propertyType = metadata.firestArg.value;
						target[key] = fillArrayValue(jsonData[key],[],propertyType);
					}
					else
					{
						target[key] = jsonData[key];
					}
				}
				else if(propertyType.indexOf("__AS3__.vec.Vector") != -1)
				{
					//查看是否有类型
					var tempAry:Array = propertyType.split("<");
					if(tempAry.length > 1)
					{
						tempAry = tempAry[1].split(">");
						propertyType = tempAry[0];
					}
					target[key] = fillArrayValue(jsonData[key],RefUtils.refObject(variable.type),propertyType);
				}
			}
		}
		public function fillArrayValue(jsonArray:Array,valueAry:*,classPath:String):*
		{
			var target:* = null;
			for each(var jsonData:Object in jsonArray)
			{
				target = RefUtils.refObject(classPath);
				valueAry.push(target);
				changeObject(jsonData,target);
			}
			return valueAry;
		}
		private function getType(obj:Object):Type
		{
			var type:Type = cacheType.get(ClassUtils.forInstance(obj));
			if(type == null)
			{
				type = Type.forInstance(obj);
			}
			return type;
		}
	}
}