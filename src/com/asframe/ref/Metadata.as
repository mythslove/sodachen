/**
 * @Metadata.as
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
	import com.asframe.collections.maps.IMap;
	import com.asframe.lang.INamed;
	import com.asframe.lang.impl.Named;

	/**
	 * 元数据
	 * @author sodaChen
	 * @Date:2012-2-13
	 */
	public class Metadata extends Named
	{
//		/** 
//		 * 参数数组
//		 * @see com.asframe.ref.Arg
//		 */
//		public var args		:Array;
		public var firestArg	:Arg;
		private var argMap		:IMap;
		private var argAry		:Array;
		
//		public function Metadata(name:String,args:Array)
		public function Metadata(name:String,argMap:IMap,firestArg:Arg)
		{
			this.name = name;
			this.argMap = argMap;
			this.firestArg = firestArg;
//			this.args = args;
		}
		public function get args():Array
		{
			if(argAry != null)
			{
				return argAry;
			}
			if(argMap == null)
			{
				argAry = [];
			}
			else
			{
				argAry = argMap.valuesToArray();
			}
			return argAry;
		}
//		public function getFirstArg():Arg
//		{
//			if(args.length > 0)
//			{
//				return args[0];
//			}
//			return null;
//		}
		public function getArg(key:String):Arg
		{
			return argMap.get(key);
//			var len:int = args.length;
//			var arg:Arg = null;
//			for (var i:int = 0; i < len; i++) 
//			{
//				arg = args[i];
//				if(arg.key == key)
//				{
//					return arg;
//				}
//			}
//			return null;
		}
		public static function invokeArg(metadata:Metadata,instance:*,type:Type,argKey:String = null):void
		{
			var argAry:Array = metadata.args;
			for each (var arg:Arg in argAry) 
			{
				if(argKey == null || arg.key == argKey)
				{
					arg.invoke(instance,type);
				}
			}
		}
	}
}
