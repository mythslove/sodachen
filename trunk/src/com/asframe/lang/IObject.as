/**
 * @IObject.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-5-4
 */
package com.asframe.lang
{
	/**
	 * 基础对象，建议所有具有应用意义的对象都实现该接口。该接口参考java的Object对象.期望可以代替as原由的Object对象
	 * @author sodaChen
	 * Date:2011-5-4
	 */
	public interface IObject extends IClass, IEquals, IHashCode, IToString
	{
		
	}
}
