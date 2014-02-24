/**
 * @IntNumberMovie.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:TribeGameClient
 * <br>Date:2011-1-7
 */
package com.asframe.display
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * 图片数字
	 * @author sodaChen
	 * Date:2011-1-7
	 */
	public class IntNumberMovie extends Sprite
	{
		public static const LEFT_MODE:int = 1;
		public static const MID_MODE:int = 2;
		public static const RIGHT_MODE:int = 3;
		private var numberMovie:MovieClip;
		private var mode:int;
		private var numberAry:Array;
		private var midIndex:int;
		/** 是否隐藏多余的位数 **/
		private var isHide:Boolean;
		
		public function IntNumberMovie(numberMovie:MovieClip = null,mode:int = RIGHT_MODE,isHide:Boolean = true)
		{
			if(numberMovie != null)
			{
				initNumber(numberMovie,mode,isHide);
			}
		}
		/**
		 * 初始化数字 
		 * @param numberMovie
		 * @param mode
		 * 
		 */		
		public function initNumber(numberMovie:MovieClip,mode:int = RIGHT_MODE,isHide:Boolean = true):void
		{
			this.numberMovie = numberMovie;
			this.mode = mode;
			this.isHide = isHide;
			if(numberMovie.parent == null)
				addChild(numberMovie);
			numberAry = [];
			for(var i:int = 1; i <= numberMovie.numChildren; i++)
			{
				numberMovie["num" + i].stop();
				numberAry.push(numberMovie["num" + i]);
			}
			if((numberMovie.numChildren % 2) == 0)
			{
				//整除
				midIndex = numberMovie.numChildren / 2
			}
			else
			{
				midIndex = (numberMovie.numChildren - 1) / 2
			}
			updateNumber(0);
		}
		/**
		 * 更新数字 
		 * @param number
		 * 
		 */		
		public function updateNumber(number:int):void
		{
			number = Math.abs(number);
			var money:Array = number.toString().split('').reverse();
			for(var i:int = 0; i < numberAry.length; i++)
			{
				if(isHide)
				{
					numberAry[i].visible = false;
				}
				else
				{
					numberAry[j].gotoAndStop(0);
				}
			}
			if(mode == RIGHT_MODE)
			{
				for(var j:int = 0; j < numberAry.length; j++)
				{
					if(j < money.length)
					{
						numberAry[j].gotoAndStop(int(money[j]) + 1);
						numberAry[j].visible = true;
					}
				}
			}
			else if(mode == LEFT_MODE)
			{
				var len:int = numberAry.length;
				var moneyLen:int = money.length;
				len = len - moneyLen;
				for(var k:int = 0; k < moneyLen; k++)
				{
					numberAry[len + k].gotoAndStop(int(money[k]) + 1);
					numberAry[len + k].visible = true;
				}
			}
			else if(mode == MID_MODE)
			{
				var tempMovieAry:Array = [];
				//从中间向两边计算
				switch(money.length)
				{
					case 1:
						tempMovieAry.push(numberAry[midIndex]);
						break;
					case 2:
						tempMovieAry.push(numberAry[midIndex - 1]);
						tempMovieAry.push(numberAry[midIndex]);
						break;
					case 3:
						tempMovieAry.push(numberAry[midIndex - 1]);
						tempMovieAry.push(numberAry[midIndex]);
						tempMovieAry.push(numberAry[midIndex + 1]);
						break;
					case 4:
						tempMovieAry.push(numberAry[midIndex - 2]);
						tempMovieAry.push(numberAry[midIndex - 1]);
						tempMovieAry.push(numberAry[midIndex]);
						tempMovieAry.push(numberAry[midIndex + 1]);
						break;
					case 5:
						tempMovieAry.push(numberAry[midIndex - 2]);
						tempMovieAry.push(numberAry[midIndex - 1]);
						tempMovieAry.push(numberAry[midIndex]);
						tempMovieAry.push(numberAry[midIndex + 1]);
						tempMovieAry.push(numberAry[midIndex + 2]);
						break;
					case 6:
						tempMovieAry.push(numberAry[midIndex - 3]);
						tempMovieAry.push(numberAry[midIndex - 2]);
						tempMovieAry.push(numberAry[midIndex - 1]);
						tempMovieAry.push(numberAry[midIndex]);
						tempMovieAry.push(numberAry[midIndex + 1]);
						tempMovieAry.push(numberAry[midIndex + 2]);
						break;
					case 7:
						tempMovieAry.push(numberAry[midIndex - 3]);
						tempMovieAry.push(numberAry[midIndex - 2]);
						tempMovieAry.push(numberAry[midIndex - 1]);
						tempMovieAry.push(numberAry[midIndex]);
						tempMovieAry.push(numberAry[midIndex + 1]);
						tempMovieAry.push(numberAry[midIndex + 2]);
						tempMovieAry.push(numberAry[midIndex + 3]);
						break;
				}
				for(var m:int = 0; m < tempMovieAry.length; m++)
				{
					tempMovieAry[m].gotoAndStop(int(money[m]) + 1);
					tempMovieAry[m].visible = true;
				}
			}
		}
	}
}
