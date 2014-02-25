/**
 * @BasicSharePool.as.as
 * 
 * @author sodaChen mail:asframe#qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-3-31
 */
package com.asframe.share
{
	import com.asframe.collections.maps.HashMap;

	/**
	 * 共享对象池
	 * @author sodaChen
	 * Date:2013-3-31
	 */
	public class ShareObjectPool implements IShareObjectPool
	{
		protected var objMap:HashMap;
		
		public function ShareObjectPool()
		{
			objMap = new HashMap();
		}
		public function getShareObject(shareName:String):*
		{
			return objMap.get(shareName);
		}
		public function addShareObject(shareObject:IShareObject):void
		{
			shareObject.setObjectOver(this);
			objMap.put(shareObject.getName(),shareObject);
		}
		
		public function removeShareObject(shareObject:IShareObject, isdestroy:Boolean=true):void
		{
			objMap.remove(shareObject.getName());
			if(isdestroy)
			{
				shareObject.destroy();
			}
		}
		
		public function objectOver(shareObject:IShareObject):void
		{
			objMap.remove(shareObject.getName());
			//这里默认是进行销毁
			shareObject.destroy();
		}
		
		public function destroy(o:*=null):void
		{
			objMap.forEach(forEach);
			objMap.clear();
			objMap = null;
		}
		
		private function forEach(shareObject:IShareObject):void
		{
			shareObject.destroy();
		}
	}
}