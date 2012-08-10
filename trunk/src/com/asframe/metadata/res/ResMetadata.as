/**
 * @ResMetadata.as
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
	
	import flash.events.Event;

	/**
	 *
	 * @author sodaChen
	 * @Date:2012-7-5
	 */
	public class ResMetadata
	{
		public static const RES_URL:String = "url";
		public static const CALL_BACK:String = "callBack";
		
		public function ResMetadata()
		{
		}
		
		public static function parseResMetadata(metadataTarget:Object,loading:ILoading = null, type:Type = null):void
		{
			var resHandler:IResHandler = new ResHandler();
			resHandler.addEventListener(Event.COMPLETE,onComplete);
			resHandler.parseRes(metadataTarget,loading,type);
		}
		//进行事件的删除
		private static function onComplete(event:Event):void
		{
			var resHandler:IResHandler = event.target as IResHandler;
			resHandler.removeEventListener(Event.COMPLETE,onComplete);
		}
	}
}
