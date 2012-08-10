package com.asframe.utils
{
	import com.asframe.collections.maps.HashMap;
	
	import flash.system.ApplicationDomain;
	
	/**
	 * 解析csv文件
	 * 
	 * @author suving 
	 * date 2008.11.25
	 */
	public class CSVTools
	{
		public function CSVTools()
		{
		}
		/**
		 * 解析CSV字符串内容为二维数组 
		 * @param content:包含CSV数据格式的字符串
		 * @return 二维数组
		 * 
		 */		
		public static function parseCsvToArray(content:String):Array
		{
			var fileArray:Array = content.split("\r\n");
			for (var i:int = 0; i < fileArray.length; i++)
			{
				fileArray[i] = fileArray[i].split(",");
			}
			return fileArray;
		}
		/**
		 * csv配置文件解析成对象数组 
		 * @param csv:包含所有的描述信息
		 * @return 对象数组
		 * 
		 */		
		public static function csvToClassArray(csv:String,domain:ApplicationDomain):Array
		{
			var returnAry:Array = new Array();
			//第一步解析出基础数据数组
			var tempAry:Array = parseCsvToArray(csv);
			//第二行为描述csv相关配置信息
			//每行类的数据
			var classPath:String = tempAry[1][0];
			var start:int = int(tempAry[1][1]) - 1;
			//二级类的信息映射
			var classPathMap:HashMap = new HashMap();
			//取出列的长度（不是实际的列，直到）
			var len:int = tempAry[1].length;
			for(var i:int = 2; i < len; i++)
			{
				var classPathAry:Array = tempAry[1][i].split(":");
				classPathMap.put(classPathAry[0],classPathAry[1]);
			}
			var countLen:int = tempAry.length;
			//解析每个列对应的类的key
			var classPropAry:Array = tempAry[2];
			//实际解析每一个条记录
			for(var j:int = start; j < countLen; j++)
			{
				var obj:* = CommonTools.referenceObject(classPath,null,domain);
				returnAry.push(obj);
				for(var k:int = 0; k < len; k++)
				{
					//过滤掉没有对应映射属性的数据
					if(classPropAry[k] != "")
					{
						var propAry:Array = classPropAry[k].split(".");
						if(propAry[0] == "class")
						{
							//0是表示类型，1是二级类的key，2是父类属性，3是值
							var childPath:String = classPathMap.get(propAry[1]) as String;
							if(obj[propAry[2]] == null)
							{
								obj[propAry[2]] = CommonTools.referenceObject(childPath,null,domain);
							}
							fullClassProp(obj[propAry[2]],"int",propAry[3],tempAry[j][k]);
						}
						else
						{
							fullClassProp(obj,propAry[0],propAry[1],tempAry[j][k]);
						}
					}
				}
			}
			return returnAry;
		}
		
		public static function fullClassProp(obj:*,type:String,prop:String,value:String):void
		{
			if(type == "str")
			{
				obj[prop] = value;
			}
			else if(type == "int")
			{
				if(value != "")
				{
					obj[prop] = int(value);
				}
				else
				{
					obj[prop] = 0;
				}
			}
			else if(type == "num")
			{
				if(value != "")
				{
					obj[prop] = Number(value);
				}
				else
				{
					obj[prop] = 0;
				}
			}
			else if(type == "boolean")
			{
				if(value == "" || value == "false")
				{
					obj[prop] = false;
				}
				else
				{
					obj[prop] = true;
				}
			}
		}
	}
}