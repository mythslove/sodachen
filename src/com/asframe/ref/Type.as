/**
 * @Type.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-13
 */
package com.asframe.ref
{
	import com.asframe.utils.ClassUtils;
	import com.asframe.utils.NamedUtils;
	
	import flash.system.ApplicationDomain;
	import flash.utils.getQualifiedClassName;

	/**
	 * 一个描述信息
	 * @author sodaChen
	 * Date:2012-2-13
	 */
	public class Type extends MetadataContainer
	{
		public var applicationDomain			:ApplicationDomain
		/**  **/
		public var fullName						:String;
		/**  **/
		public var base							:String;
		/**  **/
		public var alias						:String;
		/**  **/
		public var isDynamic					:Boolean;
		/**  **/
		public var isFinal						:Boolean;
		/**  **/
		public var isStatic						:Boolean;
		/**  **/
		public var isInterface					:Boolean;
		/**  **/
		public var clazz						:Class;
		/** 静态变量 **/
		public var staticVariables				:Array;
		/** 静态常量 **/
		public var staticConstants				:Array;
		/** 类变量 **/
		public var variables					:Array;
		/** 类常量 **/
		public var constants					:Array;
		/**  **/
		public var extendsClasses				:Array;
		/**  **/
		public var interfaces					:Array;
		/**  **/
		public var methods						:Array;
		/**  **/
		public var constructor					:Constructor;
		/**  **/
		public var accessors					:Array;
		
		private static var classXMLParse:ClassXMLParse = new ClassXMLParse();
		
		public function Type(applicationDomain	:ApplicationDomain)
		{
			this.applicationDomain = applicationDomain;
		}
		/**
		 * 根据方法名称获取到对应的方法实例 
		 * @param methodName
		 * @return 
		 * 
		 */		
		public function getMethod(methodName:String):Method
		{
			return NamedUtils.findIteam(methods,methodName);
		}
		/**
		 * 根据变量的名称获取到对应的变量 
		 * @param variableName
		 * @return 
		 * 
		 */		
		public function getVariable(variableName:String):Variable
		{
			var variable:Variable = NamedUtils.findIteam(variables,variableName);
			if(variable == null)
			{
				variable = NamedUtils.findIteam(staticVariables,variableName);
			}
			return variable;
		}
		/**
		 *  
		 * @param accessorName
		 * @return 
		 * 
		 */		
		public function getAccessor(accessorName:String):Accessor
		{
			return NamedUtils.findIteam(accessors,accessorName);
		}
		/**
		 * 根据类的全路径名称获取到对应的类描述
		 * @param name
		 * @param applicationDomain
		 * @return 
		 * 
		 */		
		public static function forName(name:String, applicationDomain:ApplicationDomain = null):Type 
		{
			return Type.forClass(ClassUtils.forName(name, applicationDomain), applicationDomain);
		}
		/**
		 * 根据Class获取到对应的类描述 
		 * @param clazz
		 * @param applicationDomain
		 * @return 
		 * 
		 */		
		public static function forClass(clazz:Class, applicationDomain:ApplicationDomain = null):Type 
		{
			applicationDomain = (applicationDomain == null) ? ApplicationDomain.currentDomain : applicationDomain;
			return classXMLParse.getType(clazz, applicationDomain);
		}
		public static function forInstance(instance:Object, applicationDomain:ApplicationDomain = null):Type
		{
			return forName(getQualifiedClassName(instance),applicationDomain);
		}
	}
}
