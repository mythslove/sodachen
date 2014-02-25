/**
 * @Pool.as.as
 * 
 * @author sodaChen mail:asframe#qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Pool
 * <br>Date:2013-3-31
 */
package com.asframe.pool
{
	import com.asframe.utils.DestroyUtils;
	
	/**
	 * 对象池的基础对象
	 * @author sodaChen
	 * Date:2013-3-31
	 */
	public class Pool implements IPool
	{
		public var maxIdle:int;
		public var objClass:Class;
		protected var pools:Array;
		
		private var count:int;
		private var borrowCount:int;
		public function Pool()
		{
			pools = [];
		}
		public function borrowObject():*
		{
			var obj:* = null;
			if(pools.length == 0)
			{
				obj =  new objClass();
			}
			else
			{
				obj = pools.pop();
				if(obj == null)
				{
					throw new Error("obj is null"); 
				}
			}
			//具备激活接口的对象
			if(obj is IActivate)
				IActivate(obj).activate();
			
			return obj;
		}
		
		public function returnObject(obj:*):void
		{
			if(pools.length > maxIdle)
			{
				DestroyUtils.destroyObj(obj);
			}
			else
			{
				if(obj is IPassivate)
					IPassivate(obj).passivate();
				
				pools.push(obj);
			}
		}
		
		public function getNumIdle():int
		{
			return pools.length;
		}
		
		public function clear():void
		{
			for (var i:int = 0; i < pools.length; i++) 
			{
				DestroyUtils.destroyObj(pools[i]);
			}
			pools = [];
		}
		public function destroy(o:* = null):void
		{
			for (var i:int = 0; i < pools.length; i++) 
			{
				DestroyUtils.destroyObj(pools[i]);
			}
			pools = null;
		}
	}
}