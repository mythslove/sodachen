/**
 * @ConfigManager.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Config
 * <br>Date:2012-2-20
 */
package com.asframe.config
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
	import com.asframe.config.csv.CSVAndObj;
	import com.asframe.config.properties.PropertiesAndObj;
	import com.asframe.config.xml.XMLAndObj;
	import com.asframe.load.LoadData;
	import com.asframe.load.LoadManager;
	
	import flash.system.ApplicationDomain;

	/**
	 * 配置文件对象，具备加载，解析，生成，转换文件和相应对象的功能
	 * @author sodaChen
	 * @Date:2012-2-20
	 */
	public class ConfigManager
	{
		/** xml类型 **/
		public static const XMl_TYPE:String = "xml";
		/** csv类型 **/
		public static const CSV_TYPE:String = "csv";
		/** 文件类型 **/
		public static const PROPERTY_TYPE:String = "property";
		/** ini类型 **/
		public static const INI_TYPE:String = "ini";
		
		/** xml配置文件解析器 **/
		public static var xmlAndObj:IConfigAndObj = new XMLAndObj();
		/** csv配置文件解析器 **/
		public static var csvAndObj:IConfigAndObj = new CSVAndObj();
		/** 文件(INI)配置文件解析器 **/
		public static var propertiesAndObj:IConfigAndObj = new PropertiesAndObj();
		
		private static var configMap:IMap;
		//随着类被初始化而初始化数据
		{
			configMap = new HashMap();
			configMap.put(XMl_TYPE,xmlAndObj);
			configMap.put(CSV_TYPE,csvAndObj);
			configMap.put(PROPERTY_TYPE,propertiesAndObj);
			configMap.put(INI_TYPE,propertiesAndObj);
		}
		/**
		 * 配置文件转换成对应的对象 
		 * @param config:配置文件字符串
		 * @param type:文件类型
		 * @param target:生成的目标对象（可选）
		 * @param applicationDomain:可选
		 * @return 
		 * 
		 */		
		public static function configToObj(config:String,target:* = null,type:String = "xml",applicationDomain:ApplicationDomain = null):*
		{
			return getConfigAndObj(type).configToObj(config,target,applicationDomain);
		}
		/**
		 * 对象转换成配置文件
		 * @param obj:对象
		 * @param type:转换的配置文件类型
		 * @return 包含配置信息的字符串文本信息
		 * 
		 */		
		public static function objToConfig(obj:*,type:String = "xml"):String
		{
			return getConfigAndObj(type).objToConfig(obj);
		}
		public static function xmlToObj(xml:XML,target:* = null, applicationDomain:ApplicationDomain = null):*
		{
//			trace("xml:" + xml);
			return xmlAndObj.configToObj(xml,target,applicationDomain);
		}
		public static function objToXML(obj:*):XML
		{
			return XML(xmlAndObj.objToConfig(obj));
		}
		public static function propertyToObj(xml:XML,applicationDomain:ApplicationDomain = null):*
		{
			
		}
		public static function objToProperty(obj:*):String
		{
			return "";
		}
		public static function csvToObj(xml:XML,applicationDomain:ApplicationDomain = null):*
		{
			
		}
		
		public static function addConfigAndObj(type:String,configAndObj:IConfigAndObj):void
		{
			configMap.put(type,configAndObj);
		}
		/**
		 * 加载配置，并且解析里面的内容，转换成对应的对象。自动根据url的后缀做类型
		 * @param configPath 文件路径
		 * @param onComplete 加载成功，并且初始化后的回调函数
		 * @param target 目标
		 * @param applicationDomain
		 * 
		 */		
		public static function loadConfig( configPath:String,
										  	 onComplete:Function,
											 target:* = null,
											 applicationDomain:ApplicationDomain = null):void
		
		{
			var arys:Array = configPath.split(".");
			var type:String = arys[arys.length];
			var loadResult:Function = function loadResult(loadData:LoadData):void
			{
				target = configToObj(loadData.data,target,type,applicationDomain);
				onComplete(target);
			};
			LoadManager.load(configPath,loadResult)
		}
		/**
		 * 根据类型获取到对应的解析，封装器 
		 * @param type
		 * @return 
		 * 
		 */		
		public static function getConfigAndObj(type:String = "xml"):IConfigAndObj
		{
			var configAndObj:IConfigAndObj = configMap.get(type);
			if(configAndObj == null)
			{
				throw new ConfigError("类型:" + type + " 没有对应的解析器");
			}
			return configAndObj;
		}
	}
}
