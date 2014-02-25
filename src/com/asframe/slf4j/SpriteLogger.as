/**
 * @SpriteLogger.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-10-15
 */
package com.asframe.slf4j
{
	import flash.display.Sprite;
	
	/**
	 *
	 * @author sodaChen
	 * Date:2012-10-15
	 */
	public class SpriteLogger extends Sprite
	{
		protected var logger:ILogger;
		
		public function SpriteLogger()
		{
			logger = LoggerFactory.getLogger(this["constructor"]);
		}
	}
}
