/**
 * @ClassXMLParse.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Res
 * <br>Date:2012-2-17
 */
package com.asframe.ref
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
	import com.asframe.utils.ClassUtils;
	
	import flash.system.ApplicationDomain;
	import flash.utils.describeType;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-2-17
	 */
	public class ClassXMLParse
	{
		private static const TRUE_VALUE:String = "true";
		private static const METHODS_NAME:String = "methods";
		private static const ACCESSORS_NAME:String = "accessors";
		
		public function getType(cls:Class, applicationDomain:ApplicationDomain):Type 
		{
			var type:Type = new Type(applicationDomain);
			var fullyQualifiedClassName:String = ClassUtils.getFullyQualifiedName(cls);
			
			var description:XML = describeType(cls);
			type.fullName = fullyQualifiedClassName;
			type.name = ClassUtils.getNameFromFullyQualifiedName(fullyQualifiedClassName);
			type.clazz = cls;
			type.isDynamic = (description.@isDynamic.toString() == TRUE_VALUE);
			type.isFinal = (description.@isFinal.toString() == TRUE_VALUE);
			type.isStatic = (description.@isStatic.toString() == TRUE_VALUE);
			type.alias = description.@alias;
			type.isInterface = (cls === Object) ? false : (description.factory.extendsClass.length() == 0);
			type.methods = parseMethods(type, description, applicationDomain);
			type.staticVariables = parseVariables(description.variable, fullyQualifiedClassName, true, applicationDomain);
			type.staticConstants = parseVariables(description.constant, fullyQualifiedClassName, true, applicationDomain);
			type.constants = parseVariables(description.factory.constant, fullyQualifiedClassName, true, applicationDomain);
			type.variables = parseVariables(description.factory.variable, fullyQualifiedClassName, false, applicationDomain);
			type.extendsClasses = parseExtendsClasses(description.factory.extendsClass,applicationDomain);
//			var parentClassLen:int = type.extendsClasses.length - 1;
//			if(parentClassLen > 0)
//			{
//				var parentType:Type = null;
//				for (var i:int = 0; i < parentClassLen; i++) 
//				{
//					parentType = Type.forName(type.extendsClasses[0]);
//					type.variables = type.variables.concat(parentType.variables);
//				}
//			}
			parseMetadata(description.factory[0].metadata, type);
			type.interfaces = parseImplementedInterfaces(description.factory.implementsInterface);
			type.constructor = parseConstructor(type, description.factory.constructor, applicationDomain);
			type.accessors = parseAccessors(type, description, applicationDomain);
			
			return type;
		}
		

		
		/**
		 *
		 */
		private function parseMethods(type:Type, xml:XML, applicationDomain:ApplicationDomain):Array 
		{
			var classMethods:Array = parseMethodsByModifier(type, xml.method, true, applicationDomain);
			var instanceMethods:Array = parseMethodsByModifier(type, xml.factory.method, false, applicationDomain);
			return classMethods.concat(instanceMethods);
		}
		

		/**
		 *
		 */
		private function parseVariables(members:XMLList, declaringType:String, isStatic:Boolean, applicationDomain:ApplicationDomain):Array 
		{
			var result:Array = [];
			for each (var m:XML in members) 
			{
				var variable:Variable = new Variable(m.@name, m.@type.toString(), declaringType, isStatic, applicationDomain);
				parseMetadata(m.metadata, variable);
				result[result.length] = variable;
			}
			return result;
		}
		
		private function parseImplementedInterfaces(interfacesDescription:XMLList):Array 
		{
			var result:Array = [];
			
			if (interfacesDescription) 
			{
				var numInterfaces:int = interfacesDescription.length();
				for (var i:int = 0; i < numInterfaces; i++) 
				{
					var fullyQualifiedInterfaceName:String = interfacesDescription[i].@type.toString();
					fullyQualifiedInterfaceName = ClassUtils.convertFullyQualifiedName(fullyQualifiedInterfaceName);
					result[result.length] = fullyQualifiedInterfaceName;
				}
			}
			return result;
			
		}
		
		/**
		 *
		 */
		private function parseExtendsClasses(extendedClasses:XMLList, applicationDomain:ApplicationDomain):Array 
		{
			var result:Array = [];
			for each (var node:XML in extendedClasses) 
			{
				result[result.length] = node.@type.toString();
			}
			return result;
		}
		
		private function parseMethodsByModifier(type:Type, methodsXML:XMLList, isStatic:Boolean, applicationDomain:ApplicationDomain):Array 
		{
			var result:Array = [];	
			for each (var methodXML:XML in methodsXML) 
			{
				var params:Array = parseParameters(methodXML.parameter, applicationDomain);
				var method:Method = new Method(type.fullName, methodXML.@name, isStatic, params, methodXML.@returnType, applicationDomain);
				parseMetadata(methodXML.metadata, method);
				result[result.length] = method;
			}
			return result;
		}
		
		private function parseParameters(paramsXML:XMLList, applicationDomain:ApplicationDomain):Array 
		{
			var params:Array = [];
			for each (var paramXML:XML in paramsXML) 
			{
				var param:Parameter = new Parameter(paramXML.@index,paramXML.@type, paramXML.@optional == TRUE_VALUE ? true : false,applicationDomain);
				params[params.length] = param;
			}
			return params;
		}
		
		
		private function parseMetadata(metadataNodes:XMLList, metadata:IMetadataContainer):void 
		{
			var metadatas:Array = [];
			var arg:Arg = null;
			var argMap:IMap = null;
			var firstArg:Arg = null;
			for each (var metadataXML:XML in metadataNodes) 
			{
//				var metadataArgs:Array = [];
				argMap = new HashMap();
				firstArg = null;
				for each (var metadataArgNode:XML in metadataXML.arg) 
				{
					arg = new Arg(metadataArgNode.@key, metadataArgNode.@value);
					argMap.put(arg.key,arg);
					if(firstArg == null)
					{
						firstArg = arg;
					}
				}
//				metadatas[metadatas.length] = new Metadata(metadataXML.@name, metadataArgs);
				metadatas[metadatas.length] = new Metadata(metadataXML.@name, argMap, firstArg);
			}
			metadata.metadatas = metadatas;
		}
		
		private function parseConstructor(type:Type, constructorXML:XMLList, applicationDomain:ApplicationDomain):Constructor 
		{
			if (constructorXML.length() > 0) 
			{
				var params:Array = parseParameters(constructorXML[0].parameter, applicationDomain);
				return new Constructor(type.fullName, params,applicationDomain);
			}
			else 
			{
				return new Constructor(type.fullName, null,applicationDomain);
			}
		}
		
		private function parseAccessors(type:Type, xml:XML, applicationDomain:ApplicationDomain):Array 
		{
			var classAccessors:Array = parseAccessorsByModifier(type, xml.accessor, true, applicationDomain);
			var instanceAccessors:Array = parseAccessorsByModifier(type, xml.factory.accessor, false, applicationDomain);
			return classAccessors.concat(instanceAccessors);
		}
		
		private function parseAccessorsByModifier(type:Type, accessorsXML:XMLList, isStatic:Boolean, applicationDomain:ApplicationDomain):Array 
		{
			var result:Array = [];
			
			for each (var accessorXML:XML in accessorsXML) 
			{
				var accessor:Accessor = new Accessor(accessorXML.@name, accessorXML.@access, 
						accessorXML.@type.toString(), accessorXML.@declaredBy.toString(), isStatic, applicationDomain);	
				parseMetadata(accessorXML.metadata, accessor);
				result[result.length] = accessor;
			}
			return result;
		}
	}
}
