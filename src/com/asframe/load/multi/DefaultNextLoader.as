/**
 * @DefaultNextLoader.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-6-29
 */
package com.asframe.load.multi
{
	import com.asframe.load.LoadTarget;

	/**
	 * 默认的下一个加载器
	 * @author sodaChen
	 * @Date:2012-6-29
	 */
	public class DefaultNextLoader extends BaseNextLoader
	{
		public function DefaultNextLoader()
		{
			super();
		}
		
		public override function nextLoad(bean:*, target:*, complete:Function):void
		{
			var url:String = null;
			if(bean is String)
			{
				url = bean as String;
			}
			else
			{
				var loadTarget:LoadTarget = bean as LoadTarget;
				url = loadTarget.url;
				target = loadTarget.target;
				complete = loadTarget.sucessResult;
			}
			multiLoader.startLoadNext(url,target,complete);
		}
	}
}
