/**
 * @AutoInitRes.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-10-11
 */
package com.asframe.metadata.res
{
	import com.asframe.loading.ILoading;
	import com.asframe.ref.Type;

	/**
	 * 自动初始化资源
	 * @author sodaChen
	 * Date:2012-10-11
	 */
	public class AutoInitRes
	{
		public static var resHandler:IResHandler = new ResHandler();
		
		public static function autoInitRes(
											resTarget:Object, 
											complete:Function = null,
											loading:ILoading = null, 
											type:Type = null):void
		{
			resHandler.parseRes(resTarget,complete,loading,type);
		}
	}
}
