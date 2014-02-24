/**
 * @SpriteLog.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-10-15
 */
package com.asframe.log4a
{
	import flash.display.Sprite;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2012-10-15
	 */
	public class SpriteLog extends Sprite
	{
		/** 日志对象 **/
		protected var log:ILog;
		
		public function SpriteLog()
		{
			log = LoggerFactory.getLog(this);
		}
	}
}
