/**
 * @RandomUtils.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-1-19
 */
package com.asframe.utils
{
	/**
	 *
	 * @author sodaChen
	 * Date:2012-1-19
	 */
	public class RandomUtils
	{
		/**
		 * 随机获得int整数 
		 * @param minNum:最小范围(0开始)
		 * @param maxNum:最大范围
		 * @param stepLen:增加范围（整数，默认为1）
		 * @return 
		 * 
		 */		
		public static function randomInt(minNum:int, maxNum:int = 0, stepLen:int = 1):int
		{
			if(minNum > maxNum) 
			{
				var nTemp:int = minNum;
				minNum = maxNum;
				maxNum = nTemp;
			}
			var nDeltaRange:int = (maxNum - minNum) + (1 * stepLen);
			var nRandomNumber:int = Math.random() * nDeltaRange;
			nRandomNumber += minNum;
			return Math.floor(nRandomNumber / stepLen) * stepLen;
		}
		/**
		 * 随机布尔值 
		 * @return 
		 * 
		 */		
		public static function randomBoolean():Boolean
		{
			return randomInt(1,2) == 1;
		}
		/**
		 * 取得随机正负波动值(1 / -1) 
		 * @return 
		 * 
		 */		
		public static function randomWave():int
		{
			return randomBoolean() ? 1 : -1;
		}
		/**
		 * 概率是否成功(100%  1- 100)
		 * @param rate:最大值
		 * @return 随机生成数是否小于或者等于rate
		 */
		public static function isRateSucced(rate:Number):Boolean
		{
			if(rate <= 0)
			{
				return false;
			}
			if(rate >= 100)
			{
				return true;
			}
			rate = rate / 100.0;
			var values:Array = [];
			values[0] = Math.random();
			values[1] = Math.random();
			values[2] = Math.random();
			//随机选取0-2的下标
			if(rate >= values[randomInt(0,2)])
			{
				//随机数小于或者等于概率，证明出现在概率范围内
				return true;
			}
			return false;
		}
		public static function isRateSuccedInt(rate:int):Boolean
		{
			if(rate <= 0)
			{
				return false;
			}
			var values:Array = [];
			values[0] = randomInt(1,100);
			values[1] = randomInt(1,100);
			values[2] = randomInt(1,100);
			//随机选取0-2的下标
			if(rate >= values[randomInt(0,2)])
			{
				//随机数小于或者等于概率，证明出现在概率范围内
				return true;
			}
			return false;
		}
	}
}
