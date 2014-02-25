package com.asframe.utils
{
	import flash.system.ApplicationDomain;
	
	/**
	 * XML的相关工具 
	 * @author SodaChen
	 * 
	 */	
	public class XMLUtils
	{
		public function XMLUtils()
		{
		}

		/**
		 * 根据XML转换成对象，并填充对应的值 
		 * @param xml:描述对应数值的XML对象
		 * @return 返回成功填充数据的对象
		 * 
		 */		
		public static function xmlToObject(xml:XML,domain:ApplicationDomain = null,attributeName:String = "attribute"):*
		{
			//生成实例
			var obj:* = RefUtils.refObject(xml.@type,null,domain);
			//查看xml本身有没有配置attributeName
			var str:String = xml.@attribute;
			if(str != null)
			{
				attributeName = str;
			}
			//填充属性
			fillAttribute(obj,xml.attributes(),domain);
			return obj;
		}
		/**
		 * 根据XMLList的内容填充具体的数据 
		 * @param obj:
		 * @param propertys:
		 * 
		 */		
		public static function fillAttribute(obj:*,attributes:XMLList,domain:ApplicationDomain,attributeName:String = "attribute"):void
		{
			for each(var xml:XML in attributes)
			{
				if(xml.@type.toString() == "")
				{
					//没有填写tpye属性的有限处理，必须是基本数据
					obj[xml.@name.toString()] = xml.@value;
				}
				else if(xml.@type.toString() == "array")
				{
					obj[xml.@name.toString()] = fillArrayValue(xml,domain);
				}
				else if(xml.@type.toString() == "class")
				{
					var tempObj:* = RefUtils.refObject(xml.@value,null,domain);
					obj[xml.@name.toString()] = tempObj;
					//递归
					fillAttribute(tempObj,xml.attributes(),domain);
				}
				else if(xml.@type.toString() == "boolean")
				{
					if(xml.@value.toString() == "true")
					{
						obj[xml.@name.toString()] = true;
					}
					else
					{
						obj[xml.@name.toString()] = false;
					}
				}
				else
				{
					obj[xml.@name.toString()] = xml.@value;
				}
			}
		}
		/**
		 * 填充数组的xml数据 
		 * @param arrayXML:描述数组数据结构的xml对象
		 * 
		 */		
		public static function fillArrayValue(arrayXML:XML,domain:ApplicationDomain):Array
		{
			var tempAry:Array = new Array();
			for each(var ary:XML in arrayXML.attribute)
			{
				if(ary.@type.toString() == "class")
				{
					var arrayObj:* = RefUtils.refObject(ary.@value,null,domain);
					tempAry.push(arrayObj);
					//递归
					fillAttribute(arrayObj,ary.attribute,domain);
				}
				else if(ary.@type.toString() == "array")
				{
					tempAry.push(fillArrayValue(ary,domain));
				}
				else if(ary.@type.toString() == "boolean")
				{
					tempAry.push(Boolean(ary.@value));
				}
				else if(ary.@type.toString() == "int")
				{
					tempAry.push(int(ary.@value));
				}
				else if(ary.@type.toString() == "number")
				{
					tempAry.push(Number(ary.@value));
				}
				else if(ary.@type.toString() == "unit")
				{
					tempAry.push(uint(ary.@value));
				}
				else
				{
					tempAry.push(String(ary.@value));
				}
			}
			return tempAry;
		}
	}
}