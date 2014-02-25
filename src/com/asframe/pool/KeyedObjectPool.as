/**
 * @BaseKeyedObjectPool.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Pool
 * <br>Date:2012-1-16
 */
package com.asframe.pool
{
	import com.asframe.collections.maps.HashMap;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-1-16
	 */
	public class KeyedObjectPool implements IKeyedObjectPool
	{
		protected var poolMap:HashMap;
		protected var maxIdle:int;
		protected var minIdle:int;
		protected var numActive:int;
		protected var factory:IKeyedPoolableObjectFactory;
		public function KeyedObjectPool(factory:IKeyedPoolableObjectFactory)
		{
			this.factory = factory;
			poolMap = new HashMap();
		}
		
		public function borrowObject(key:*):*
		{
			var obj:* = null;
			var pools:Array = getPools(key);
			if(pools.length == 0)
			{
				obj =  factory.makeObject(key);
			}
			else
			{
				obj = pools.pop();
			}
			if(obj == null)
			{
				throw new Error("obj is null"); 
			}
			factory.activateObject(key,obj);
			//进行验证该对象是否可以使用
			if(factory.activateObject(key,obj))
			{
				return obj;
			}
			throw new Error("ValidateObject failed"); 
		}
		
		public function returnObject(key:*, obj:*):void
		{
			var pools:Array = getPools(key);
			if((maxIdle >= 0) && (pools.length >= maxIdle)) 
			{
				factory.passivateObject(key,obj);
				//放进池里
				pools.push(obj);
			} 
			else
			{
//				destroyObject(key,obj);
			}
		}
		
		public function addObject(key:*):void
		{
			returnObject(key,factory.makeObject(key));
		}
		
		public function getNumIdleByKey(key:int):int
		{
			return 0;
		}
		
		public function getAllNumIdle():int
		{
			return 0;
		}
		
		public function destroy(o:* = null):void
		{
			var pools:Array = getPools(o);
			for (var i:int = 0; i < pools.length; i++) 
			{
				destroyObject(pools[i]);
			}
			pools = null;
			factory = null;
		}
		
		public function clear(key:* = null):void
		{
			var pools:Array = getPools(key);
			for (var i:int = 0; i < pools.length; i++) 
			{
				destroyObject(pools[i]);
			}
			pools = [];
		}
		
		private function destroyObject(obj:*):void
		{
			try
			{
//				factory.destroyObject(obj);
			}
			catch(error:Error)
			{
				trace("消耗对象失败" + error.getStackTrace());
			}
		}
		
		private function getPools(key:*):Array
		{
			var pools:Array = poolMap.get(key);
			if(pools == null)
			{
				pools = [];
				poolMap.put(key,pools);
			}
			return pools;
		}
	}
}
