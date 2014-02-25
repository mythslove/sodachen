/**
 * @IKeyedPoolableObjectFactory.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame Pool
 * <br>Date:2012-1-15
 */
package com.asframe.pool
{
	/**
	 * An interface defining life-cycle methods for
	 * instances to be served by a {@link KeyedObjectPool}.
	 * <p>
	 * By contract, when an {@link KeyedObjectPool}
	 * delegates to a {@link KeyedPoolableObjectFactory},
	 * <ol>
	 *  <li>
	 *   {@link #makeObject makeObject}
	 *   is called whenever a new instance is needed.
	 *  </li>
	 *  <li>
	 *   {@link #activateObject activateObject}
	 *   is invoked on every instance that has been
	 *   {@link #passivateObject passivated} before it is
	 *   {@link KeyedObjectPool#borrowObject borrowed} from the pool.
	 *  </li>
	 *  <li>
	 *   {@link #validateObject validateObject}
	 *   is invoked on {@link #activateObject activated} instances to make sure
	 *   they can be {@link KeyedObjectPool#borrowObject borrowed} from the pool.
	 *   <code>validateObject</code> <strong>may</strong> also be used to test an
	 *   instance being {@link KeyedObjectPool#returnObject returned} to the pool
	 *   before it is {@link #passivateObject passivated}. It will only be invoked
	 *   on an activated instance.
	 *  </li>
	 *  <li>
	 *   {@link #passivateObject passivateObject}
	 *   is invoked on every instance when it is returned to the pool.
	 *  </li>
	 *  <li>
	 *   {@link #destroyObject destroyObject}
	 *   is invoked on every instance when it is being "dropped" from the
	 *   pool (whether due to the response from <code>validateObject</code>,
	 *   or for reasons specific to the pool implementation.) There is no
	 *   guarantee that the instance being destroyed will
	 *   be considered active, passive or in a generally consistent state.
	 *  </li>
	 * </ol>
	 * </p>
	 * <p>
	 * {@link KeyedPoolableObjectFactory} must be thread-safe. The only promise
	 * an {@link KeyedObjectPool} makes is that the same instance of an object will not
	 * be passed to more than one method of a <code>KeyedPoolableObjectFactory</code>
	 * at a time.
	 * </p>
	 *
	 * @see KeyedObjectPool
	 *
	 * @author Rodney Waldhoff
	 * @author Sandy McArthur
	 * @version $Revision: 791676 $ $Date: 2009-07-06 19:29:56 -0700 (Mon, 06 Jul 2009) $
	 * @since Pool 1.0
	 */
	public interface IKeyedPoolableObjectFactory
	{
		/**
		 * Create an instance that can be served by the pool.
		 *
		 * @param key the key used when constructing the object
		 * @return an instance that can be served by the pool.
		 * @throws Exception if there is a problem creating a new instance,
		 *    this will be propagated to the code requesting an object.
		 */
		function makeObject(key:*):*;
		
		/**
		 * Destroy an instance no longer needed by the pool.
		 * <p>
		 * It is important for implementations of this method to be aware
		 * that there is no guarantee about what state <code>obj</code>
		 * will be in and the implementation should be prepared to handle
		 * unexpected errors.
		 * </p>
		 * <p>
		 * Also, an implementation must take in to consideration that
		 * instances lost to the garbage collector may never be destroyed.
		 * </p>
		 *
		 * @param key the key used when selecting the instance
		 * @param obj the instance to be destroyed
		 * @throws Exception should be avoided as it may be swallowed by
		 *    the pool implementation.
		 * @see #validateObject
		 * @see KeyedObjectPool#invalidateObject
		 */
		function destroyObject(key:*, obj:*):void;
		
		/**
		 * Reinitialize an instance to be returned by the pool.
		 *
		 * @param key the key used when selecting the object
		 * @param obj the instance to be activated
		 * @throws Exception if there is a problem activating <code>obj</code>,
		 *    this exception may be swallowed by the pool.
		 * @see #destroyObject
		 */
		function activateObject(key:*, obj:*):void;
		
		/**
		 * Uninitialize an instance to be returned to the idle object pool.
		 *
		 * @param key the key used when selecting the object
		 * @param obj the instance to be passivated
		 * @throws Exception if there is a problem passivating <code>obj</code>,
		 *    this exception may be swallowed by the pool.
		 * @see #destroyObject
		 */
		function passivateObject(key:*, obj:*):void;
	}
}
