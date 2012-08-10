/**
 * @Variable.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-2-13
 */
package com.asframe.ref
{
	import com.asframe.utils.ClassUtils;
	import com.asframe.utils.StringUtils;
	
	import flash.system.ApplicationDomain;

	/**
	 *
	 * @author sodaChen
	 * @Date:2012-2-13
	 */
	public class Variable extends Field
	{
		public function Variable(name:String,type:String,declaredBy:String,isStatic:Boolean, applicationDomain:ApplicationDomain)
		{
			super(name,type,isStatic,applicationDomain);
			this.declaredBy = declaredBy;
			this.isStatic = isStatic;
		}
		/**
		 * 获取到变量的值（没有target时，则默认取Class的属性值）
		 * @param target
		 * @return 
		 * 
		 */		
		public function getValue(target:* = null):*
		{
			if (target == null) 
			{
				//查看是否为静态方法
				target = ClassUtils.forName(declaredBy,applicationDomain);
			}
			return target[name];
		}
	}
}
