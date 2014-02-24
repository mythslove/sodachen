/**
 * @LoadBackData.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 FeiYin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Lion3D
 * <br>Date:2013-8-27
 */
package com.asframe.lang.data
{
	

	/**
	 * 加载回调数据结构
	 * @author sodaChen
	 * #Date:2013-8-27
	 */
	public class LoadBackData
	{
		public var url			:String; 
		public var completes	:Vector.<Function>;
		public var targets		:Array;
		public var errors		:Vector.<Function>;
		
		public function LoadBackData()
		{
			completes = new Vector.<Function>();
			targets = new Array();
			errors = new Vector.<Function>();
		}
		public function remove(complete:Function):void
		{
			//进行删除
			var index:int = completes.indexOf(complete);
			if (index != -1)
			{
				completes.splice(index, 1);
				if(targets[index] != null)
				{
					targets.splice(index, 1);
				}
				if(errors[index] != null)
				{
					errors.splice(index, 1);
				}
			}
		}
		public function destory():void
		{
			url = null;
			completes.splice(0,completes.length);
			errors.splice(0,errors.length);
			targets.splice(0,targets.length);
//			PoolManager.returnObject(this,this[ASF.CONSTRUCTOR]);
		}
	}
}
