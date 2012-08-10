/**
 * @LogFormat.as.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-9-10
 */
package com.asframe.log4a.format
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
	import com.asframe.log4a.ILogOutput;
	import com.asframe.log4a.Level;
	import com.asframe.log4a.Log4aConst;
	import com.asframe.utils.FormatTool;
	
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2011-9-10
	 */
	public class LogFormatImpl implements ILogFormat
	{
		/** 对象格式处理集合 **/
		protected var headFormat:ILogHeadFormat;
		/** 对象格式处理集合 **/
		protected var logOutput:ILogOutput;
		/** 目标的输出格式 **/
		protected var targetForamt:ITargetForamt;
		/** 对象格式处理集合 **/
		protected var objFormatMap:IMap;
		protected var classMap:IMap;
		protected var classNameMap:IMap;
		protected var level:Level;
		protected var showTime:Boolean;
		protected var dateFormat:String;
		
		public function LogFormatImpl()
		{
			objFormatMap = new HashMap();
			classMap = new HashMap();
			classNameMap = new HashMap();
		}
		/**
		 * 设置日志输出的等级
		 * @param level
		 * 
		 */		
		public function setLevel(level:Level):void
		{
			this.level = level;
		}
		/**
		 * 是否显示时间 
		 * @param showTime
		 * @param dateFormat
		 * 
		 */		
		public function isShowTime(showTime:Boolean,dateFormat:String = null):void
		{
			this.showTime = showTime;
			this.dateFormat = dateFormat
		}
		/**
		 * 目标的格式处理对象
		 * @param targetForamt
		 * 
		 */		
		public function setTargetForamt(targetForamt:ITargetForamt):void
		{
			this.targetForamt = targetForamt;
		}
			
		public function setHeadFormat(headFormat:ILogHeadFormat):void
		{
			this.headFormat = headFormat;
		}
		
		public function addObjectFormat(objectFormat:IObjectFormat):void
		{
			objFormatMap.put(objectFormat.getType(),objectFormat);
		}
		
		public function setLogOutput(logOutput:ILogOutput):void
		{
			this.logOutput = logOutput;
		}
		
		public function logFormat(target:Object,arg0:Object,arg1:Object,arg2:Object):void
		{
			if(targetForamt != null)
			{
				logOutput.outputTarget(targetForamt.toTargetForamt(target));
			}
			//先查第一条消息是否带有{}符号
//			var firstObject:Object = logs[0];
//			if(firstObject is String)
//			{
//				var firstStr:String = firstObject as String;
//				if(firstStr.indexOf("{}") != -1)
//				{
//					
//				}
//			}
			var infos:String = "[" + level.levelName + "]";
			if(showTime)
			{
				infos += "[" + FormatTool.getYearTime(new Date()) + "]";
			}
			if(target != null)
			{
				if(target is String)
				{
					infos += "-[" + target + "]";
				}
				else
				{
					infos += "-[" + getQualifiedClassName(target) + "]";
				}
			}
			infos += parseArg(arg0);
			infos += parseArg(arg1);
			infos += parseArg(arg2);
//			//进行格式化消息
//			for(var i:int = 0; i < len; i++)
//			{
//				//判断类型
//				var obj:* = logs[i];
//				if(obj is String)
//				{
//					infos += obj;
//				}
//				else if(obj is int || obj is Number || obj is Boolean || obj is uint)
//				{
//					infos += obj;
//				}
//				else if(obj is Array)
//				{
//					infos += toObjectFormat(Log4aConst.ARRAY,obj);
//				}
//				else if(obj is Error)
//				{
//					var error:Error = obj as Error;
//					infos += error.toString() + "\n";
//					infos += error.getStackTrace();
//				}
//				else
//				{
//					var className:String = getQualifiedClassName(obj);
//					infos += toObjectFormat(className,obj);
//				}
//			}
			logOutput.outputLog(infos,level);
		}
		private function parseArg(obj:Object):String
		{
			if(obj == null)
			{
				return "";
			}

			if(obj is String)
			{
				return obj as String;
			}
			if(obj is int || obj is Number || obj is Boolean || obj is uint)
			{
				return obj.toString();
			}
			else if(obj is Array)
			{
				return toObjectFormat(Log4aConst.ARRAY,obj);
			}
			else if(obj is Error)
			{
				var error:Error = obj as Error;
				return error.toString() + "\n" + error.getStackTrace();
			}
			else
			{
				return toObjectFormat(getQualifiedClassName(obj),obj);
			}
			return infos;
		}
		/**
		 * 
		 * @param key
		 * @param obj
		 * @return 
		 */
		private function toObjectFormat(key:String,obj:Object):String
		{
			var objFormat:IObjectFormat = objFormatMap.get(key) as IObjectFormat;
			if(objFormat == null)
			{
				return obj.toString();
			}
			return objFormat.toFormatString(obj);
		}
	}
}
