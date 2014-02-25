/**
 * @IKeyedObjectPool.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Pool
 * <br>Date:2012-1-15
 */
package com.asframe.pool
{
	import com.asframe.lang.IDestory;

	/**
	 * A "keyed" pooling interface.
	 * <p>
	 * A keyed pool pools instances of multiple types. Each
	 * type may be accessed using an arbitrary key.
	 * </p>
	 * <p>
	 * Example of use:
	 * <pre style="border:solid thin; padding: 1ex;"
	 * > Object obj = <code style="color:#00C">null</code>;
	 * Object key = <code style="color:#C00">"Key"</code>;
	 *
	 * <code style="color:#00C">try</code> {
	 *     obj = pool.borrowObject(key);
	 *     <code style="color:#0C0">//...use the object...</code>
	 * } <code style="color:#00C">catch</code>(Exception e) {
	 *     <code style="color:#0C0">// invalidate the object</code>
	 *     pool.invalidateObject(key, obj);
	 *     <code style="color:#0C0">// do not return the object to the pool twice</code>
	 *     obj = <code style="color:#00C">null</code>;
	 * } <code style="color:#00C">finally</code> {
	 *     <code style="color:#0C0">// make sure the object is returned to the pool</code>
	 *     <code style="color:#00C">if</code>(<code style="color:#00C">null</code> != obj) {
	 *         pool.returnObject(key, obj);
	 *     }
	 * }</pre>
	 * </p>
	 * <p>
	 * {@link KeyedObjectPool} implementations <i>may</i> choose to store at most
	 * one instance per key value, or may choose to maintain a pool of instances
	 * for each key (essentially creating a {@link java.util.Map Map} of
	 * {@link ObjectPool pools}).
	 * </p>
	 *
	 * <p>See {@link BaseKeyedObjectPool} for a simple base implementation.</p>
	 *
	 * @author Rodney Waldhoff
	 * @author Sandy McArthur
	 * @version $Revision: 962893 $ $Date: 2010-07-10 10:37:27 -0700 (Sat, 10 Jul 2010) $
	 * @see KeyedPoolableObjectFactory
	 * @see KeyedObjectPoolFactory
	 * @see ObjectPool
	 * @see BaseKeyedObjectPool
	 * @since Pool 1.0
	 */
	public interface IKeyedObjectPool extends IDestory
	{
		/**
		 * Obtains an instance from this pool for the specified <code>key</code>.
		 * <p>
		 * Instances returned from this method will have been either newly created with
		 * {@link KeyedPoolableObjectFactory#makeObject makeObject} or will be a previously idle object and
		 * have been activated with {@link KeyedPoolableObjectFactory#activateObject activateObject} and
		 * then validated with {@link KeyedPoolableObjectFactory#validateObject validateObject}.
		 * <p>
		 * By contract, clients <strong>must</strong> return the borrowed object using
		 * {@link #returnObject returnObject}, {@link #invalidateObject invalidateObject}, or a related method
		 * as defined in an implementation or sub-interface,
		 * using a <code>key</code> that is {@link Object#equals equivalent} to the one used to
		 * borrow the instance in the first place.
		 * <p>
		 * The behaviour of this method when the pool has been exhausted
		 * is not strictly specified (although it may be specified by implementations).
		 * Older versions of this method would return <code>null</code> to indicate exhaustion,
		 * newer versions are encouraged to throw a {@link NoSuchElementException}.
		 *
		 * @param key the key used to obtain the object
		 * @return an instance from this pool.
		 * @throws IllegalStateException after {@link #close close} has been called on this pool
		 * @throws Exception when {@link KeyedPoolableObjectFactory#makeObject makeObject} throws an exception
		 * @throws NoSuchElementException when the pool is exhausted and cannot or will not return another instance
		 */
		function borrowObject(key:*):*;
		
		/**
		 * Return an instance to the pool.
		 * By contract, <code>obj</code> <strong>must</strong> have been obtained
		 * using {@link #borrowObject borrowObject}
		 * or a related method as defined in an implementation
		 * or sub-interface
		 * using a <code>key</code> that is equivalent to the one used to
		 * borrow the instance in the first place.
		 *
		 * @param key the key used to obtain the object
		 * @param obj a {@link #borrowObject borrowed} instance to be returned.
		 * @throws Exception 
		 */
		function returnObject(key:*, obj:*):void;
		
		/**
		 * Create an object using the {@link KeyedPoolableObjectFactory factory} or other
		 * implementation dependent mechanism, passivate it, and then place it in the idle object pool.
		 * <code>addObject</code> is useful for "pre-loading" a pool with idle objects
		 * (Optional operation).
		 *
		 * @param key the key a new instance should be added to
		 * @throws Exception when {@link KeyedPoolableObjectFactory#makeObject} fails.
		 * @throws IllegalStateException after {@link #close} has been called on this pool.
		 * @throws UnsupportedOperationException when this pool cannot add new idle objects.
		 */
		function addObject(key:*):void;
		
		/**
		 * Returns the number of instances
		 * corresponding to the given <code>key</code>
		 * currently idle in this pool (optional operation).
		 * Returns a negative value if this information is not available.
		 *
		 * @param key the key to query
		 * @return the number of instances corresponding to the given <code>key</code> currently idle in this pool or a negative value if unsupported
		 * @throws UnsupportedOperationException <strong>deprecated</strong>: when this implementation doesn't support the operation
		 */
		function getNumIdleByKey(key:int):int;
		
		/**
		 * Returns the total number of instances
		 * currently idle in this pool (optional operation).
		 * Returns a negative value if this information is not available.
		 *
		 * @return the total number of instances currently idle in this pool or a negative value if unsupported
		 * @throws UnsupportedOperationException <strong>deprecated</strong>: when this implementation doesn't support the operation
		 */
		function getAllNumIdle():int;
		
		/**
		 * Clears the specified pool, removing all
		 * pooled instances corresponding to
		 * the given <code>key</code> (optional operation).
		 * Throws {@link UnsupportedOperationException} if the pool cannot be cleared.
		 *
		 * @param key the key to clear
		 * @throws UnsupportedOperationException when this implementation doesn't support the operation
		 */
		function clear(key:* = null):void;
	}
}
