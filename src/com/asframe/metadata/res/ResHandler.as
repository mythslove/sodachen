/**
 * @ResHandler.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-7-5
 */
package com.asframe.metadata.res
{
	import com.asframe.load.LoadData;
	import com.asframe.load.LoadManager;
	import com.asframe.loading.ILoading;
	import com.asframe.metadata.MetadataConst;
	import com.asframe.metadata.MetadataError;
	import com.asframe.ref.Arg;
	import com.asframe.ref.Metadata;
	import com.asframe.ref.Type;
	import com.asframe.ref.Variable;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * 操作Res的元数据标签
	 * @author sodaChen
	 * @Date:2012-7-5
	 */
	public class ResHandler extends EventDispatcher implements IResHandler
	{
		private var metadataTarget:Object;
		private var loading:ILoading;
		/** 加载资源的次数 **/
		private var loadCount:int;
		public function ResHandler()
		{
		}
		
		public function parseRes(metadataTarget:Object, loading:ILoading=null, type:Type = null):void
		{
			if(metadataTarget is Class)
			{
				throw new MetadataError("解析资源标签，不能是Class对象，必须是实例");
			}
			if(type == null)
			{
				type = Type.forInstance(metadataTarget);
			}
			this.metadataTarget = metadataTarget;
			this.loading = loading;
			//查看是否有Res标签
			var resMetadatas:Array = type.getMetadatas(MetadataConst.RES_METADATA);
			if(resMetadatas != null && resMetadatas.length > 0)
			{
				handleClassRes(resMetadatas);
			}
			//查看属性中是否函数res的元数据标签
			variables(type.staticVariables);
			variables(type.variables);
		}
		private function variables(variables:Array):void
		{
			var len:int = variables.length;
			var variable:Variable = null;
			var metadata:Metadata = null;
			for (var i:int = 0; i < len; i++) 
			{
				variable = variables[i];
				metadata = variable.getMetadata(MetadataConst.RES_METADATA);
				if(metadata == null)
				{
					break;
				}
				loadRes(variable,metadata,onVariableRes);
			}
			
		}
		private function onVariableRes(loadData:LoadData):void
		{
			var variable:Variable = loadData.target;
			//进行赋值
			metadataTarget[variable.name] = loadData.data;
			countLoad();
		}
		private function onClassRes(loadData:LoadData):void
		{
			if(loadData.target is Function)
			{
				loadData.target(loadData.data,loadData.url);
			}
			else if(loadData.target is IResMetadata)
			{
				IResMetadata(loadData.target).initRes(loadData.data,loadData.url);
			}
			else
			{
				loadData.target.initRes(loadData.data,loadData.url);
			}
			countLoad();
		}
		private function handleClassRes(resMetadatas:Array):void
		{
			var len:int = resMetadatas.length;
			for (var i:int = 0; i < len; i++) 
			{
				loadRes(metadataTarget,resMetadatas[i],onClassRes);
			}
		}
		private function countLoad():void
		{
			loadCount--;
			if(loadCount == 0)
			{
				if(metadataTarget is IResInit)
				{
					IResInit(metadataTarget).resInit();
				}
				else
				{
					//强行调用resInit方法
					try
					{
						metadataTarget.resInit();
					} 
					catch(error:Error) 
					{
						
					}
				}
				//结束了，发出事件
				dispatchEvent(new Event(Event.COMPLETE));
			}
		}
		private function loadRes(target:*,metadata:Metadata,successResult:Function):void
		{
			//查看具体的参数
			var arg:Arg = metadata.getArg(ResMetadata.RES_URL);
			if(arg != null)
			{
				var callBackArg:Arg = metadata.getArg(ResMetadata.CALL_BACK);
				if(callBackArg != null)
				{
					target = metadataTarget[callBackArg.value];
				}
				loadCount++;
				LoadManager.loadByNew(arg.value,successResult,target,loading);
			}
		}
	}
}
