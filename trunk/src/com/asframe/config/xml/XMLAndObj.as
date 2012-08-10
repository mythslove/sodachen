/**
 * @XMLAndObj.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-2-20
 */
package com.asframe.config.xml
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
	import com.asframe.config.ConfigAndObj;
	import com.asframe.ref.Metadata;
	import com.asframe.ref.RefConts;
	import com.asframe.ref.Type;
	import com.asframe.ref.Variable;
	import com.asframe.utils.ClassUtils;
	import com.asframe.utils.RefUtils;
	
	import flash.system.ApplicationDomain;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-2-20
	 */
	public class XMLAndObj extends ConfigAndObj
	{
		private var cacheType:IMap;
		
		public function XMLAndObj()
		{
			cacheType = new HashMap();
		}
		
		public override function configToObj(config:*, target:* = null, applicationDomain:ApplicationDomain = null):*
		{
			var paramTagetNull:Boolean = target == null;
			var xml:XML = config is XML ? config : XML(config);
			var targetClass:Class = initTargetClass(xml.@type,target,applicationDomain);
			if(target == null)
			{
				target = new targetClass();
			}
			var type:Type = Type.forClass(targetClass);
			var property:String = xml.@property.toString();
			
			if(property == "true")
			{
				fillByXML(target,xml,false,type,applicationDomain);	
				
			}
			else
			{
				var xmlList:XMLList = xml.attributes();
				if(!paramTagetNull && property != "false" && xmlList != null && xmlList.length() > 0 )
				{
					attributeXMLToObj(target,xml,false,type,applicationDomain);	
				}
				else
				{
					fillAttribute(target,xml.children(),false,type,applicationDomain);
				}
			}
			return target;
		}
		/**
		 * 根据XMLList的内容填充具体的数据 
		 * @param obj:
		 * @param propertys:
		 * 
		 */		
		public function fillAttribute(obj:*,attributes:XMLList,isProperty:Boolean,type:Type,applicationDomain:ApplicationDomain):void
		{
			for each(var xml:XML in attributes)
			{
				fillByXML(obj,xml,isProperty,type,applicationDomain);
			}
		}
		public function fillByXML(obj:*,xml:XML,isProperty:Boolean,type:Type,applicationDomain:ApplicationDomain):void
		{
			var name:String = null;
			if(isProperty)
			{
				name = xml.name();
			}
			else
			{
				name = xml.@name;
				if(name == "" || name == null)
				{
					name = xml.name();
				}
			}
			var variable:Variable = type.getVariable(name);
			if(variable != null)
			{
				attributeValue(obj,name,variable.type,type,xml,applicationDomain);
			}
			else
			{
				// 查看是否有类型
				var typeValue:String = xml.@type;
				if(typeValue == null || typeValue == "")
				{
					typeValue = "String";
				}
				attributeValue(obj,name,typeValue,type,xml,applicationDomain);
			}
		}
		/**
		 * 专门处理属性的类型 
		 * @param obj
		 * @param xml
		 * @param type
		 * @param applicationDomain
		 * 
		 */		
		private function parseProperty(obj:*,xml:XML,type:Type,applicationDomain:ApplicationDomain):void
		{
		}
		private function attributeValue(obj:*,name:String,typeValue:String,type:Type,xml:XML,applicationDomain:ApplicationDomain):void
		{
			if(typeValue == RefConts.STRING_TYPE || typeValue == RefConts.EMPTY_TYPE)
			{
				obj[name] = getXMLValue(xml);
			}
			else if(typeValue == RefConts.INT_TYPE || typeValue == RefConts.UINT_TYPE || typeValue == RefConts.NUMBER_TYPE)
			{
				//基本数据类型
				var numValue:String =xml.@value.toString();
				if(numValue != "")
				{
					obj[name] = xml.@value;
				}
				else
				{
					obj[name] = RefUtils.valueByType(name,numValue,type);;
				}
			}
			else if(typeValue == RefConts.ARRAY_TYPE)
			{
				var propertyType:String = null;
				//查看是否有标签指令数组元素的类型
				var variable:Variable = type.getVariable(name);
				if(variable != null)
				{
					var metadata:Metadata = variable.getMetadata("Class");
					if(metadata != null && metadata.firestArg != null)
					{
						propertyType = metadata.firestArg.value;
					}
				}
				obj[name] = fillArrayValue(xml,propertyType,false,applicationDomain);
			}
			else if(typeValue == RefConts.BOOLEAN_TYPE)
			{
				if(getXMLValue(xml) == "true")
				{
					obj[name] = true;
				}
				else
				{
					obj[name] = false;
				}
			}
			else
			{
				var typeValue:String = xml.@type;
				if(typeValue == null || typeValue == "")
				{
					typeValue = type.getVariable(name).type;
				}
				//对象
				var tempObj:* = RefUtils.refObject(typeValue,null,applicationDomain);
				obj[name] = tempObj;
				var tempType:Type = Type.forClass(ClassUtils.forInstance(tempObj,applicationDomain));
				//递归
				fillAttribute(tempObj,xml.children(),false,tempType,applicationDomain);
			}
		}
		/**
		 * 填充数组的xml数据 
		 * @param arrayXML:描述数组数据结构的xml对象
		 * @param propertyType 属性类型
		 * 
		 */		
		public function fillArrayValue(arrayXML:XML,propertyType:String,isPropertAry:Boolean,applicationDomain:ApplicationDomain):Array
		{
			var tempAry:Array = new Array();
			var typeValue:String = null;
			var xmlList:XMLList = arrayXML.children();
//			var propertyType:String = _propertyType;
			for each(var ary:XML in xmlList)
			{
				if(propertyType == null)
				{
					typeValue = ary.@type.toString();
					if(typeValue == RefConts.ARRAY_TYPE)
					{
						tempAry.push(fillArrayValue(ary,null,false,applicationDomain));
					}
					else if(typeValue == RefConts.BOOLEAN_TYPE)
					{
						if(ary.@value.toString() == "true")
						{
							tempAry.push(true);
						}
						else
						{
							tempAry.push(false);
						}
					}
					else if(typeValue == RefConts.INT_TYPE)
					{
						tempAry.push(int(ary.@value));
					}
					else if(typeValue == RefConts.NUMBER_TYPE)
					{
						tempAry.push(Number(ary.@value));
					}
					else if(typeValue == RefConts.UINT_TYPE)
					{
						tempAry.push(uint(ary.@value));
					}
					else if(typeValue == RefConts.STRING_TYPE || typeValue == RefConts.EMPTY_TYPE )
					{
						tempAry.push(String(ary.@value));
					}
					else
					{
						//对象
						var arrayObj:* = RefUtils.refObject(ary.@value,null,applicationDomain);
						var tempType:Type = Type.forClass(ClassUtils.forInstance(arrayObj,applicationDomain));
						tempAry.push(arrayObj);
						//递归
						fillAttribute(arrayObj,ary.children(),false,tempType,applicationDomain);
					}
				}
				else
				{
					//对象
					var arrayObj1:* = RefUtils.refObject(propertyType,null,applicationDomain);
					var aryObjClass:Class = ClassUtils.forName(propertyType,applicationDomain);
					//查看是否有属性
					var aryObjType:Type = cacheType.get(aryObjClass);
					if(aryObjType == null)
					{
						aryObjType = Type.forClass(aryObjClass,applicationDomain);
						cacheType.put(aryObjClass,aryObjType);
					}
					tempAry.push(arrayObj1);
					attributeXMLToObj(arrayObj1,ary,isPropertAry,aryObjType,applicationDomain);
				}
			}
			return tempAry;
		}
		private function attributeXMLToObj(obj:*,xml:XML,isPropertAry:Boolean,type:Type,applicationDomain:ApplicationDomain):void
		{
			//配置了属性
			var tempList:XMLList = xml.attributes();
			if(tempList.toString() != "")
			{
				//递归
				fillAttribute(obj,tempList,isPropertAry,type,applicationDomain);
			}
			tempList = xml.children();
			if(tempList.length() > 0)
			{
				//这里有两种可能，一种child为该对象每个属性配置。另外一种就是这些child都属于它的一个数组的属性
				var aryObjAryList:XML = tempList[0];
				var aryObjAryName:String = aryObjAryList.name();
				var variable:Variable = type.getVariable(aryObjAryName);
				if(variable != null)
				{
					if(variable.type == RefConts.ARRAY_TYPE)
					{
						var aryPropertyType:String = RefConts.ARRAY_TYPE;
						//查看是否有标签指令数组元素的类型
						var metadata:Metadata = variable.getMetadata("Class");
						if(metadata != null && metadata.firestArg != null)
						{
							aryPropertyType = metadata.firestArg.value;
						}
						obj[aryObjAryName] = fillArrayValue(xml,aryPropertyType,true,applicationDomain);
					}
					else
					{
						//普通属性的填充
						fillAttribute(obj,tempList,false,type,applicationDomain);
					}
				}
				else
				{
					//递归
					fillAttribute(obj,tempList,false,type,applicationDomain);
				}
			}
		}
		public override function objToConfig(obj:*):String
		{
			return null;
		}
		public function getXMLValue(xml:XML):String
		{
			var value:String = xml.@value.toString();
			if(value == "")
			{
				value = xml.toString();
			}
			return value;
		}
	}
}
