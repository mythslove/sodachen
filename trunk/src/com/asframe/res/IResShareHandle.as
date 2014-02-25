/**
 * @IResShaeHandle.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Lion3D
 * <br>Date:2013-8-27
 */
package com.asframe.res
{
	/**
	 * 资源共享处理接口，用于处理特殊数据转换。以及额外做的事情
	 * @author sodaChen
	 * #Date:2013-8-27
	 */
	public interface IResShareHandle
	{
		/**
		 * 返回资源共享数据 
		 * @param loaData 资源加载器加载进来的数据
		 * @return 经过封装的数据
		 * 
		 */		
		function getResShare(key:String,loadData:*):*;
	}
}
