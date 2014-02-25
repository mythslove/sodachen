/**
 * @ASFrameSession.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-8-22
 */
package com.asframe
{
	import com.asframe.res.IResManager;
	import com.asframe.res.ResManager;

	/**
	 * ASFrame框架的共享对象(ASFrameSession)，一些需要跨框架使用的实例，一般存放在这里。
	 * 需要对框架的一些默认实现时，可以覆盖这里的接口对象。
	 * @author sodaChen
	 * #Date:2013-8-22
	 */
	public final class ASF
	{
		/** 构造器对象(Class) **/
		public static const CONSTRUCTOR:String = "constructor";
		/**
		 * 共享池的引用完毕之后的延迟销毁时间。默认是30秒
		 * @see com.asframe.share.SharingPool 
		 */		
//		public static var sharingPoolDelay:int = 30 * 1000;
		public static var sharingPoolDelay:int = 1;
		/** 资源管理对象,默认是ResManager.getInstance() **/
		public static var resManager:IResManager = ResManager.getInstance();
		
		/** 是否使用内存缓存二进制字节 **/
		public static var isCacheBytes:Boolean = true;
		/** 是否使用SharedObject缓存二进制字节。即写入本地文件存储 **/
		public static var isCacheSharedObject:Boolean = true;
	}
}
