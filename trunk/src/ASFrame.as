/**
 * @ASFrame.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-4-8
 */
package
{
	import com.asframe.lang.IOrdered;
	import com.asframe.lang.impl.CompareObject;
	import com.asframe.lang.impl.CompareOrder;
	import com.asframe.log4a.ILog;
	import com.asframe.log4a.Logger;
	import com.asframe.slf4j.ILogger;
	import com.asframe.slf4j.LoggerFactory;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.utils.describeType;
	import flash.utils.getTimer;
	
	/**
	 *
	 * @author sodaChen
	 * @Date:2012-4-8
	 */
	public class ASFrame extends Sprite
	{
		public var soda:String = "soda";
		public function ASFrame()
		{
			var obj1:CompareObject = new CompareObject();
			obj1.order = 1;
			var obj2:CompareObject = new CompareObject();
			obj2.order = 2;
			var t:int = getTimer();
			for (var i:int = 0; i < 10000; i++) 
			{
				obj1.compareTo(obj2);
			}
			t = getTimer() - t;
			Logger.debug(this,"通用对象花费时间：" + t);
			
			var order1:CompareOrder = new CompareOrder();
			var order2:CompareOrder = new CompareOrder();
			t = getTimer();
			for (var j:int = 0; j < 10000; j++) 
			{
				order1.compareTo(order2);
			}
			t = getTimer() - t;
			Logger.debug(this,"通用对象花费时间：" + t);
			
			
			//测试一下slf4a
			var log:ILogger = LoggerFactory.getLogger(ASFrame);
			log.debug("测试一下slf4a");
			trace(this.hasOwnProperty("getContainer"))
			trace(this.hasOwnProperty("soda"));
			trace(this["getContainer"]);
			
		}
		private function getContainer():Sprite
		{
			return this;
		}
	}
}
