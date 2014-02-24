/**
 * @ConfigError.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-3-7
 */
package com.asframe.conf
{
	/**
	 * 配置相关的错误
	 * @author sodaChen
	 * Date:2012-3-7
	 */
	public class ConfigError extends Error
	{
		public function ConfigError(message:*="", id:*=0)
		{
			super(message, id);
		}
	}
}
