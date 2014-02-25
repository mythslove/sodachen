/**
 * @BasicResParser.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-12
 */
package com.asframe.res.parsers
{
	import com.asframe.res.data.ResData;
	
	import flash.utils.ByteArray;
	import flash.utils.getTimer;
	
	/**
	 *
	 * @author sodaChen
	 * #Date:2012-2-12
	 */
	public class BasicResParser implements IResParser
	{
		/** 是否暂停 **/
		protected var paused:Boolean;
		/** 是否完成解析 **/
		protected var complete:Boolean;
		/** 是否发生错误 **/
		protected var failure:Boolean;
		/** 需要解析的二进制数据 **/
		protected var byteArray:ByteArray;
		/** 当前时间 **/
		protected var time:int;
		/** 最终解析的资源数据 **/
		protected var data:*;
		protected var suffix:String;
		protected var asyncComplete:Function;
		protected var asyncFlag:Boolean;
		protected var resDataList:Vector.<ResData>;
		/** 解析中 **/
		protected var parsing:Boolean;
		private var resData:ResData;
		
		public function BasicResParser()
		{
			resDataList = new Vector.<ResData>();
		}
		/**
		 * 是否为异步。异步的话，则需要监听相关事件 
		 * @return 
		 * 
		 */		
		public function isAsync():Boolean
		{
			return asyncFlag;
		}
		/**
		 * 设置异步结束的回调函数。具体根据 ResParser的参数再作下异步，根据直接或者循环解析一样处理了。
		 * @param asyncComplete
		 * 
		 */		
		public function setAsyncComplete(asyncComplete:Function):void
		{
			this.asyncComplete = asyncComplete;
		}
		public function addResData(resData:ResData):void
		{
			if(resData.level > 0)
			{
				resDataList.unshift(resData);
			}
			else
			{
				resDataList.push(resData);
			}
		}
		public function getResData():ResData
		{
			return resData;
		}
		/**
		 * 开始解析 
		 * 
		 */		
		public function startParse():void
		{
			if(parsing || resDataList.length == 0)
			{
				return ;
			}
			//载入一个新的
			resData = resDataList.shift();
			//走回以前的老路
			initParser(resData.bytes,resData.suffix);
		}
		public function initParser(byteArray:ByteArray,suffix:String):void
		{
			complete = false;
			paused = false;
			failure = false;
			parsing = true;
			byteArray.position = 0;
			this.byteArray = byteArray;
			this.suffix = suffix;
			onInitParser();
		}
		protected function onInitParser():void
		{
			
		}
		
		public function isComplete():Boolean
		{
			return complete;
		}
		/**
		 * 是否暂停 
		 * @return 
		 * 
		 */		
		public function isPaused():Boolean
		{
			return paused;
		}
		/**
		 * 是否发生错误  
		 * @return 
		 * 
		 */
		public function isFailure():Boolean
		{
			return failure;
		}
		public function onParse(time:int):void
		{
			this.time = time;
			complete = proceedParsing();
//			//还没结束，判断是否还有时间解析
//			if(!complete && hasTime())
//			{
//				//递归一次解析
//				proceedParsing();
//			}
		}
		/**
		 * 是否还有解析时间(其实就是能否继续一下步的解析) 
		 * @return 
		 * 
		 */		
		protected function hasTime():Boolean
		{
			return getTimer() < time;
		}
		/**
		 * 解析完毕 
		 */		
		protected function parseOver():void
		{
			paused = false;
			parsing = false;
			complete = true;
//			resData.destory();
//			resData = null;
		}
		/**
		 * 解析过程，子类主要重写该方法 
		 * @return 
		 * 
		 */		
		public function proceedParsing():Boolean
		{
			return complete;
		}
		public function getRes():*
		{
			return data;
		}
		public function clean():void
		{
			byteArray = null;
			data = null;
			paused = false;
			parsing = false;
		}
		public function destroy(o:*=null):void
		{
			clean();
		}
	}
}
