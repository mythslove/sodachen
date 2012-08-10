/**
 * @(#)CommonTools.as
 * 
 * @author  soda.C  E-mail:asframe@163.com
 * @version  1.0
 * <br>Copyright (C), 2007 soda.C
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Soda.C.API
 * <br>Date:2007.12.25
 */
package com.asframe.utils 
{
	import com.asframe.slf4j.Logger;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.net.LocalConnection;
	import flash.system.ApplicationDomain;
	import flash.system.System;
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;

	/**
	 * 比较常用和普遍的开发工具类,提供了一系列的静态方方法
	 * 
	 * @author Soda.Chen
	 */
	public class CommonTools 
	{		
		public static var MAX_MOMEY:int = 200 * 1024 * 1024;
		/**
		 * 把sprite或者其子对象转换成BitmapData对象
		 * @param sprite
		 * @return 
		 * 
		 */		
		public static function drawSprite(sprite:DisplayObject,rect:Rectangle = null, mx:Matrix = null):BitmapData
		{
			if(rect == null)
			{
				rect = new Rectangle(0,0,sprite.width,sprite.height);
			}
			var bitmapData:BitmapData = new BitmapData(rect.width,rect.height,true,0x00000000);
			bitmapData.draw(sprite,mx,null,null,rect);
			return bitmapData;
		}
		/**
		 * 根据名称创建一个实例，允许传递参数
		 * @param name:类全路径
		 * @param args:参数，只一个参数
		 * @param domain:所在的域
		 * @return *:返回实例
		 * 该方法可能会抛出ReferenceError异常,但不需要显式捕捉
		 */
		public static function referenceImage(name:String,domain:ApplicationDomain = null):BitmapData
		{
			var cl:Class = null;
			try
			{
				//判断域是否为空 
				if(domain != null)
				{
					cl = domain.getDefinition(name) as Class;
				}
				else
				{
					cl = ApplicationDomain.currentDomain.getDefinition(name) as Class;
				}
			}
			catch(error:Error)
			{
				return null;
			}
			return new cl(0,0);
		}
		/**
		 * 根据名称创建一个实例，允许传递参数
		 * @param name:类全路径
		 * @param args:参数，只一个参数
		 * @param domain:所在的域
		 * @return *:返回实例
		 * 该方法可能会抛出ReferenceError异常,但不需要显式捕捉
		 */
		public static function referenceObject(name:String,args:Object = null,domain:ApplicationDomain = null):*
		{
			Logger.debug("resName: " + name,CommonTools);
			try
			{
				var cl:Class = null;
				//判断域是否为空 
				if(domain != null)
				{
					cl = domain.getDefinition(name) as Class;
				}
				else
				{
					cl = ApplicationDomain.currentDomain.getDefinition(name) as Class;
				}
				if(args != null)
				{
					return new cl(args);
				}
				return new cl();
			}
			catch(error:Error)
			{
				Logger.error("反射出错============:" + name,CommonTools);
				Logger.error(error.getStackTrace(),CommonTools);
			}
		}
		
		/**
		 * 复制一个对象
		 */
		public static function copyObject(obj:Object):*
		{
			var byteArray:ByteArray = new ByteArray();
			byteArray.writeObject(obj);
			byteArray.position = 0;
			return byteArray.readObject();
		}
		
		/**
		 * 复制一个对象
		 */
		public static function createObject(obj:Object):*
		{
			var objName:String = getQualifiedClassName(obj);
			return referenceObject(objName);
		}
		
		/**
		 * 强行性让flash播放机制执行内存回收
		 */
		public static function GC():void
		{
			//一般是不强制性回收内存，当当前内存大于预定的内存范围时，才开始强制回收(400MB)
			if(System.totalMemory >= MAX_MOMEY)
			{
				try
				{
					var gc1:LocalConnection = new LocalConnection();
					var gc2:LocalConnection = new LocalConnection();
					gc1.connect("com.asframe.memory.gc1");
					gc2.connect("com.asframe.memory.gc1");
				}
				catch(error:Error)
				{
					trace("强制执行内存清理:" + error);
				}
			}
		}
		/**
		 * 随机产生一个数字 
		 * @param nMinimum:最小数
		 * @param nMaximum:最大数
		 * @param nRoundToInterval:产生随机数的间隔
		 * @return 返回一个number值（没有小数点）
		 * 
		 */		
		public static function random(nMinimum:Number, nMaximum:Number = 0, nRoundToInterval:Number = 1):Number 
		{
     		 // If the minimum is greater than the maximum, switch the two.
      		if(nMinimum > nMaximum) 
      		{
				var nTemp:Number = nMinimum;
	       		nMinimum = nMaximum;
	        	nMaximum = nTemp;
      		}

	        // Calculate the range by subtracting the minimum from the maximum. Add
	        // 1 times the round to interval to ensure even distribution.
	        var nDeltaRange:Number = (nMaximum - nMinimum) + (1 * nRoundToInterval);
	
	        // Multiply the range by Math.random(). This generates a random number
	        // basically in the range, but it won't be offset properly, nor will it
	        // necessarily be rounded to the correct number of places yet.
	        var nRandomNumber:Number = Math.random() * nDeltaRange;
	
	        // Add the minimum to the random offset to generate a random number in the correct range.
	        nRandomNumber += nMinimum;
	
	        // Return the random value. Use the custom floor( ) method to ensure the
	        // result is rounded to the proper number of decimal places.
			return Math.floor(nRandomNumber / nRoundToInterval) * nRoundToInterval;
		}
		/**
		 * 设置按钮/MC的可用性，一般不可用为灰掉不可按 
		 * @param mc			:对像	
		 * @param isEnabled		:可用否
		 * @param StyleType		:自行设置不可用时的样式种类
		 * 
		 */		
		public static function setEnabledStyle(mc:DisplayObject,isEnabled:Boolean,StyleType:int = 0):void
		{
			if(!isEnabled)
			{
				var defaultMatrix:Array = new Array();
				defaultMatrix.push([0.4,0.4,0.4,1]);	//建筑系统里取消按钮变暗
				defaultMatrix.push([1,1,0,1]);			//
				defaultMatrix.push([1,0,0.1,1]);			//角色删除状态选中
				defaultMatrix.push([0.7,0,0.1,1]);		//角色删除状态未选中
				var matrix:Array = new Array();
				matrix = matrix.concat([defaultMatrix[StyleType][0], 0, 0, 0, 0]); // red
				matrix = matrix.concat([0, defaultMatrix[StyleType][1], 0, 0, 0]); // green
				matrix = matrix.concat([0, 0, defaultMatrix[StyleType][2], 0, 0]); // blue
				matrix = matrix.concat([0, 0, 0, defaultMatrix[StyleType][3], 0]); // alpha			
				var filter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
				var filters:Array = new Array();
				filters.push(filter);
				mc.filters = filters;			
			}
			else
			{
				mc.filters = [];
			}
		}
	}
}
