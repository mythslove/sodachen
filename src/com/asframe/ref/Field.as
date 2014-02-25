/**
 * @Field.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-17
 */
package com.asframe.ref
{
	import com.asframe.utils.ClassUtils;
	
	import flash.system.ApplicationDomain;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-2-17
	 */
	public class Field extends MetadataContainer
	{
		public var applicationDomain		:ApplicationDomain;
		/** 类型 **/
		public var type						:String;
		/** 来自那里 **/
		public var declaredBy				:String;
		public var isStatic					:Boolean;
		
		public function Field(name:String,type:String,isStatic:Boolean,applicationDomain:ApplicationDomain)
		{
			this.name = name;
			//对类型进行转换
			if(type != null)
			{
				type = ClassUtils.convertFullyQualifiedName(type);
				this.type = type;
			}
			this.isStatic = isStatic;
			this.applicationDomain = applicationDomain;
		}
	}
}
