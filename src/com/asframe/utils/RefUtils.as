/**
 * @RefUtils.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-15
 */
package com.asframe.utils
{
	import com.asframe.ref.Method;
	import com.asframe.ref.RefConts;
	import com.asframe.ref.Type;
	import com.asframe.ref.Variable;
	
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-2-15
	 */
	public class RefUtils
	{
		/**
		 * 根据名称创建一个实例，允许传递参数
		 * @param name:类全路径
		 * @param args:参数，只一个参数
		 * @param domain:所在的域
		 * @return *:返回实例
		 * 该方法可能会抛出ReferenceError异常,但不需要显式捕捉
		 */
		public static function refImage(name:String,domain:ApplicationDomain = null):BitmapData
		{
			var cl:Class = null;
			try
			{
				//判断域是否为空 
				if(domain != null)
				{
					cl = domain.getDefinition(name) as Class;
				}
				else
				{
					cl = ApplicationDomain.currentDomain.getDefinition(name) as Class;
				}
			}
			catch(error:Error)
			{
				return null;
			}
			return new cl(0,0);
		}
		/**
		 * 根据名称创建一个实例，允许传递参数
		 * @param name:类全路径
		 * @param args:参数，只一个参数
		 * @param domain:所在的域
		 * @return *:返回实例
		 */
		public static function refObject(name:String,domain:* = null,arguments:* = null):*
		{
			var type:Class = null;
			//判断域是否为空 
			if(domain != null)
			{
				if(domain is ApplicationDomain)
				{
					type = domain.getDefinition(name) as Class;
				}
				else if(domain is Sprite)
				{
					type = Sprite(domain).loaderInfo.applicationDomain.getDefinition(name) as Class;
				}
				else
				{
					throw new Error("domain必须是ApplicationDomain或者Sprite以及MovieClip");
				}
			}
			else
			{
//				type = ApplicationDomain.currentDomain.getDefinition(name) as Class;
				type = getDefinitionByName(name) as Class;
			}
			if(arguments != null)
			{
				if(arguments is Array)
				{
					switch (arguments.length) 
					{
						case 0 :
							return new type();
						case 1 :
							return new type(arguments[0]);
						case 2 :
							return new type(arguments[0], arguments[1]);
						case 3 :
							return new type(arguments[0], arguments[1], arguments[2]);
						case 4 :
							return new type(arguments[0], arguments[1], arguments[2], arguments[3]);
						case 5 :
							return new type(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]);
						case 6 :
							return new type(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
						case 7 :
							return new type(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6]);
						case 8 :
							return new type(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6], arguments[7]);
						case 9 :
							return new type(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6], arguments[7], arguments[8]);
						case 10 :
							return new type(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6], arguments[7], arguments[8], arguments[9]);
					}
				}
				else
				{
					return new type(arguments);
				}
			}
			return new type();
		}
		/**
		 * 反射出去一个button 
		 * @param link
		 * @param width
		 * @param height
		 * @param x
		 * @param y
		 * @param domain
		 * @return SimpleButton的实例
		 * 
		 */		
		public static function refButton(	link:String,
											width:Number = 0,
											height:Number = 0,
											x:Number = 0,
											y:Number = 0,
											domain:ApplicationDomain = null):SimpleButton
		{
			var button:SimpleButton = refObject(link,null,domain);
			if(width != 0) button.width = width;
			if(height != 0) button.height = height;
			if(x != 0) button.x = x;
			if(y != 0) button.y = y;
			return button;
		}
		/**
		 * 设置对象的值 
		 * @param object 需要设置的对象实例
		 * @param name 属性名称
		 * @param value 属性值
		 * @param type 类型描述对象
		 * 
		 */		
		public static function setObjectValue(object:Object,name:String,value:String,type:Type = null):void
		{
			if(type == null)
			{
				type = Type.forInstance(object);
			}
			try
			{
				object[name] = valueByType(name,value,type);
			} 
			catch(error:Error) 
			{
				throw new Error("设置对象的属性值报错:" + error.getStackTrace());
			}
		}
		/**
		 * 基础类型的值转换，只支持int，number，uint，boolean，String5种类型
		 * @param name 对象的属性名称
		 * @param value 需要转换的值
		 * @param type 对象的类描述信息
		 * @return 转换后的值
		 * 
		 */		
		public static function valueByType(name:String,value:String,type:Type):*
		{
			var typeValue:String = "String";
			if(type != null)
			{
				var variable:Variable = type.getVariable(name);
				if(variable != null)
				{
					typeValue = variable.type;
				}
			}
			return changeStringValue(value,typeValue);
		}
		/**
		 * 基础类型的值转换，只支持int，number，uint，boolean，String5种类型 
		 * @param value
		 * @param typeValue
		 * @return 
		 * 
		 */		
		public static function changeStringValue(value:String,typeValue:String):*
		{
			if(typeValue == RefConts.STRING_TYPE || typeValue == RefConts.EMPTY_TYPE )
			{
				return String(value);
			}
			else if(typeValue == RefConts.INT_TYPE)
			{
				return int(value);
			}
			else if(typeValue == RefConts.NUMBER_TYPE)
			{
				return Number(value);
			}
			else if(typeValue == RefConts.UINT_TYPE)
			{
				return uint(value);
			}
			else if(typeValue == RefConts.BOOLEAN_TYPE)
			{
				if(value == "true")
				{
					return true;
				}
				else
				{
					return false;
				}
			}
		}
		/**
		 * 通过target的方法名取出对应的方法值
		 * @param target 目标
		 * @param methodName 方法名
		 * @param type 类结构
		 * @return 方法的返回结果
		 * 
		 */		
		public static function invokeMethod(target:Object,methodName:String,type:Type = null):*
		{
			if(type == null)
			{
				type = Type.forInstance(target);
			}
			var method:Method = type.getMethod(methodName);
			if(method != null)
			{
				return method.invoke(target);
			}
			return null;
		}
	}
}
