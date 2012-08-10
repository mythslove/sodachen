/**
 * @TotalLoading.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2011-5-3
 */
package com.asframe.loading
{
	import com.asframe.loading.IMultilLoading;
	
	import flash.display.MovieClip;
	import flash.text.TextField;

	/**
	 * @author sodaChen
	 * @Date:2011-5-3
	 */
	public class MultiLoading extends BaseLoading implements IMultilLoading
	{
		private var totalTipText			:TextField;
		private var totalSize				:int;
		
		public function MultiLoading()
		{
			super();
		}
		/**
		* 全部资源的加载大小 
		* @param allSize:
		* 
		*/		
		public function setTotalSize(totalSize:int):void
		{
			this.totalSize = totalSize;
		}
		/**
		 * 总的显示 
		 * @param allTip:总的一个提示信息
		 * 
		 */		
		public function setTotalTip(totalTip:String,isHtml:Boolean = false):void
		{
			setTextTip(totalTipText,totalTip,isHtml);
		}
		public override function setBackground(background:*):void
		{
			super.setBackground(background);
			if(background["totalTipText"] != null)
			{
				totalTipText = background["totalTipText"];
			}
		}
	}
}
