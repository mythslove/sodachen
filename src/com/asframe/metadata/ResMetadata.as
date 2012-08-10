/**
 * @ResMetadata.as
 * 
 * @author sodaChen mail:sujun10@21cn.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-5-7
 */
package com.asframe.metadata
{
	import com.asframe.load.ILoader;
	import com.asframe.load.LoadData;
	import com.asframe.load.LoadTarget;
	import com.asframe.load.multi.IMultiLoader;
	import com.asframe.ref.Arg;
	import com.asframe.ref.Metadata;
	import com.asframe.ref.Type;
	import com.asframe.utils.RefUtils;

	/**
	 * 资源标签的解析
	 * @author sodaChen
	 * @Date:2012-5-7
	 */
	public class ResMetadata
	{
		public function resMetadata(type:Type,target:Object,loder:IMultiLoader = null,complete:Function = null):void
		{
			//查看对象本身是否有,不支持对象直接是Swf
//			var resMetadatas:Array = type.getMetadatas(MetadataConst.REF_METADATA);
//			if(resMetadatas.length > 0)
//			{
//				var loadTargets:Array = []; 
//				for each (var metadata:Metadata in resMetadatas) 
//				{
//					//进行加载
//					var arg:Arg = metadata.getFirstArg();
//					loadTargets.push(metadata.getFirstArg().value);
//				}
//			}
//			var loadOverResult:Function = function(loadDatas:Array)
//			{
//				//加载成功后，在这里进行处理
//				complete();
//			}
//			loder.load(arg.value,loadResult);
		}
	}
}