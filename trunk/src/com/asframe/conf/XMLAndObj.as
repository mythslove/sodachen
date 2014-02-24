/**
 * @XMLAndObj.as
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
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
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
	 * Date:2012-2-20
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
				if(xmlList.length() > 0)
					fillAttribute(target,xmlList,false,type,applicationDomain);
				
				fillAttribute(target,xml.children(),false,type,applicationDomain);
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
			//todo xml解析器这里有作调整，所有的都是xml的节点名称作为属性名称
			var name:String = xml.name();
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
				if(numValue == "")
				{
					numValue = xml.toString();
					obj[name] = RefUtils.valueByType(name,numValue,type);;
				}
				else
				{
					obj[name] = xml.@value;
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
				obj[name] = fillArrayValue(xml,propertyType,new Array(),applicationDomain);
			}
			else if(typeValue.indexOf("__AS3__.vec.Vector") != -1)
			{
				//查看是否有类型
				var tempAry:Array = typeValue.split("<");
				if(tempAry.length > 1)
				{
					tempAry = tempAry[1].split(">");
					propertyType = tempAry[0];
				}
				obj[name] = fillArrayValue(xml,propertyType,RefUtils.refObject(typeValue),applicationDomain);
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
				var typeVariable:Variable = type.getVariable(name);
				if(typeVariable != null)
				{
					typeValue = type.getVariable(name).type;
				}
				else
				{
					typeValue = xml.@type;
				}
				//对象
				var tempObj:* = RefUtils.refObject(typeValue,null,applicationDomain);
				obj[name] = tempObj;
				var tempType:Type = Type.forClass(ClassUtils.forInstance(tempObj,applicationDomain));
				//todo 这里还有一个可能，就xml本身还是有属性的，填完属性之后，才是child
				attributeXMLToObj(tempObj,xml,false,tempType,applicationDomain);
			}
		}
		/**
		 * 填充数组的xml数据 
		 * @param arrayXML:描述数组数据结构的xml对象
		 * @param propertyType 属性类型
		 * 
		 */		
		public function fillArrayValue(arrayXML:XML,propertyType:String,valueAry:*,applicationDomain:ApplicationDomain):*
		{
			var xmlList:XMLList = arrayXML.children();
			for each(var ary:XML in xmlList)
			{
				fillArrayItemValue(valueAry,ary,propertyType,applicationDomain);
			}
			return valueAry;
		}
		private function fillArrayItemValue(valueAry:*,ary:XML,propertyType:String,applicationDomain:ApplicationDomain):void
		{
			var typeValue:String = null;
			if(propertyType == null || propertyType == RefConts.ARRAY_TYPE || propertyType == RefConts.BOOLEAN_TYPE
				|| propertyType == RefConts.INT_TYPE || propertyType == RefConts.NUMBER_TYPE 
				|| propertyType == RefConts.UINT_TYPE || propertyType == RefConts.VECTOR_TYPE
				|| propertyType == RefConts.STRING_TYPE || propertyType == RefConts.EMPTY_TYPE)
			{
				
				if(propertyType == null)
				{
					typeValue = ary.@type.toString();
				}
				else
				{
					typeValue = propertyType;
				}
				//需要是知道是否有value，还是直接toString
				if(typeValue == RefConts.ARRAY_TYPE)
				{
					valueAry.push(fillArrayValue(ary,null,new Array(),applicationDomain));
				}
				else if(typeValue == RefConts.VECTOR_TYPE)
				{
					valueAry.push(fillArrayValue(ary,null,new Vector.<*>(),applicationDomain));
				}
				else if(typeValue == RefConts.BOOLEAN_TYPE)
				{
					valueAry.push(xmlToValue(ary,typeValue));
				}
				else if(typeValue == RefConts.INT_TYPE)
				{
					valueAry.push(xmlToValue(ary,typeValue));
				}
				else if(typeValue == RefConts.NUMBER_TYPE)
				{
					valueAry.push(xmlToValue(ary,typeValue));
				}
				else if(typeValue == RefConts.UINT_TYPE)
				{
					valueAry.push(xmlToValue(ary,typeValue));
				}
				else if(typeValue == RefConts.STRING_TYPE || typeValue == RefConts.EMPTY_TYPE )
				{
					valueAry.push(xmlToValue(ary,typeValue));
				}
				else
				{
					//对象
					var arrayObj:* = RefUtils.refObject(ary.@value,null,applicationDomain);
					var tempType:Type = Type.forClass(ClassUtils.forInstance(arrayObj,applicationDomain));
					valueAry.push(arrayObj);
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
				valueAry.push(arrayObj1);
				attributeXMLToObj(arrayObj1,ary,false,aryObjType,applicationDomain);
			}
		}
		private function xmlToValue(valueXML:XML,typeValue:String):*
		{
			var xmlList:XMLList = valueXML.attributes();
			if(xmlList.length() > 0)
			{
				return stringToValue(valueXML.@value.toString(),typeValue);
			}
			return stringToValue(valueXML.toString(),typeValue);
		}
		private function stringToValue(str:String,typeValue:String):*
		{
			if(typeValue == RefConts.BOOLEAN_TYPE)
			{
				if(str == "true")
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			else if(typeValue == RefConts.INT_TYPE)
			{
				return int(str);
			}
			else if(typeValue == RefConts.NUMBER_TYPE)
			{
				return Number(str);
			}
			else if(typeValue == RefConts.UINT_TYPE)
			{
				return uint(str);
			}
			else if(typeValue == RefConts.STRING_TYPE || typeValue == RefConts.EMPTY_TYPE )
			{
				return str;
			}
		}
		private function attributeXMLToObj(obj:*,xml:XML,isPropertAry:Boolean,type:Type,applicationDomain:ApplicationDomain):void
		{
			//配置了属性
			var tempList:XMLList = xml.attributes();
//			if(tempList.toString() != "")
			//todo 修改原来的toString
			if(tempList.length() > 0)
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
					//todo 是数组，这里有两种情况，1中是所有的child都是同一个数组的，另外一种当前数组只是类的其中一种属性
					//通过检测aryObjAryList是否有child来判断，有就表示只是其中的一个属性为数组
					if(variable.type == RefConts.ARRAY_TYPE && aryObjAryList.children().length() == 0)
					{
						var aryPropertyType:String = RefConts.ARRAY_TYPE;
						//查看是否有标签指令数组元素的类型
						var metadata:Metadata = variable.getMetadata("Class");
						if(metadata != null && metadata.firestArg != null)
						{
							aryPropertyType = metadata.firestArg.value;
						}
						//todo 进行修改，有xml变为aryObjAryList.这里也有基本数据类型的处理。也就是支持基本数据类型
						obj[aryObjAryName] = fillArrayValue(xml,aryPropertyType,new Array(),applicationDomain);
					}
					else if(variable.type.indexOf("__AS3__.vec.Vector") != -1)
					{
						//查看是否有类型
						var tempAry:Array = variable.type.split("<");
						if(tempAry.length > 1)
						{
							tempAry = tempAry[1].split(">");
							aryPropertyType = tempAry[0];
						}
						obj[aryObjAryName] = fillArrayValue(xml,aryPropertyType,RefUtils.refObject(variable.type),applicationDomain);
					}
					else
					{
						//普通属性(基本单位)或者类属性
						fillAttribute(obj,tempList,false,type,applicationDomain);
//						fillByXML(obj,aryObjAryList,false,type,applicationDomain);
					}
				}
				else
				{
					//递归
//					fillByXML(obj,aryObjAryList,false,type,applicationDomain);
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
