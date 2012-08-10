/**
 * @IndexOutOfBoundsError.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 Gzfeiyin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Tercel
 * <br>Date:2012-7-23
 */
package com.asframe.lang.error
{
	/**
	 * 指示某排序索引（例如对数组、字符串或向量的排序）超出范围时抛出。 
	 * 应用程序可以为这个类创建子类，以指示类似的异常。 
	 * 
	 * @author sodaChen
	 * @Date:2012-7-23
	 */
	public class IndexOutOfBoundsError extends Error
	{
		public function IndexOutOfBoundsError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
