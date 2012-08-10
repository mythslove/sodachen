/**
 * @Point3D.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-7-20
 */
package com.asframe.gemo
{
	import flash.geom.Point;
	
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-7-20
	 */
	public class Point3D extends Point
	{
		public var z:Number;
		
		public function Point3D(x:Number=0, y:Number=0,z:Number = 0)
		{
			super(x, y);
			this.z = z;
		}
	}
}
