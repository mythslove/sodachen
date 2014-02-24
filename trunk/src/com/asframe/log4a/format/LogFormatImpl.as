/**
 * @LogFormat.as.as
 * 
 * @author sodaChen mail:asframe#163.com
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
	import com.asframe.utils.ClassUtils;
	import com.asframe.utils.FormatTool;
	
	import flash.media.Camera;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2011-9-10
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
		protected var target:Object;
		protected var targetPath:String;
		
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
		public function setTarget(target:Object):void
		{
			this.target = target;
			var clazz:Class = null;
			if(target is Class)
			{
				clazz = target as Class;
			}
			else
			{
				clazz = ClassUtils.forInstance(target);
			}
			targetPath = ClassUtils.getFullyQualifiedName(clazz,true)
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
		
		public function logFormat(arg0:Object,arg1:Object,arg2:Object):void
		{
			if(targetForamt != null)
			{
				logOutput.outputTarget(targetForamt.toTargetForamt(target));
			}
			var infos:String = "[" + level.levelName + "]";
			if(showTime)
			{
				infos += "[" + FormatTool.getYearTime(new Date()) + "]";
			}
			if(target != null)
			{
				if(target is String)
				{
					infos += "-[" + target + "]:\n";
				}
				else
				{
					infos += "-[" + targetPath + "]:\n";
				}
			}
			infos += parseArg(arg0);
			infos += parseArg(arg1);
			infos += parseArg(arg2);
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
			if(obj is Array)
			{
				return toObjectFormat(Log4aConst.ARRAY,obj);
			}
			if(obj is Error)
			{
				var error:Error = obj as Error;
				return error.getStackTrace();
			}
			return toObjectFormat(getQualifiedClassName(obj),obj);
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
