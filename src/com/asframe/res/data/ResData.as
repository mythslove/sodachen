/**
 * @ResData.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-12
 */
package com.asframe.res.data
{
	import com.asframe.lang.data.LoadBackData;
	import com.asframe.res.parsers.IResParser;
	
	import flash.utils.ByteArray;

	/**
	 *
	 * @author sodaChen
	 * #Date:2012-2-12
	 */
	public class ResData extends LoadBackData
	{
		public var level		:int;
		public var parser		:IResParser;
		public var parserClass	:Class;
		/** 加载进来后的二进制数据 **/
		public var bytes		:ByteArray;
		/** 文件后缀信息 **/
		public var suffix		:String;
		/** 额外附加的参数对象 **/
		public var params		:Object;
		
		public override function destory():void
		{
			level = 0;
			parser = null;
			parserClass = null;
			super.destory();
		}
	}
}
