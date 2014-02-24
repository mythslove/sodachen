package com.asframe.display
{
	import com.asframe.display.data.ImageMovieForamt;
	
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;
	
	public interface IMovieClip extends IEventDispatcher
	{
		/**
		 * 设置一个显示对象,默认第一行的第一个图块的状态，包括空白图片
		 * @param	row:该图片有多少行
		 * @param	count:每行有多少张
		 * @param bitmapData:像素数据
		 */
		function init(movieFormat:ImageMovieForamt):void;
		/**
		 * 滚动图像，每调用一次，当前动作变化一下
		 */
		function scroll():void;
		
		/**
		 * 设置状态,每次切换方向时都必须调用该方法,方向值必须是ScrollBitmap提供的静态属性值
		 * @param	currWay:当前方向值
		 */ 
		function changeWay(currWay:int):void;
		
		/**
		 * 切换播放范围，包括指定行数，起始点和终点。默认显示start帧
		 * @param start:滚动起始点
		 * @param end:滚动结束点
		 * @param row:第几行
		 * @param isUpdate:是否马上显示出来(注，参数会让显示对象即可播放到当前状态，否则还是原来状态，,
		 * 	当再次调用scroll方法时，则从第二帧显示。反之则从第一帧显示)
		 * @see scroll();
		 */  
		function changeAction(name:String,time:int = -1,isUpdate:Boolean = false):void;
		
		/**
		 * 跳到指定的的帧数和行数，单停止在指定的帧，不具备播放功能
		 * @param frame:显示的图片位置
		 * @param row:第几行
		 */ 
		function gotoAndStop(frame:Object = -1,row:Object = -1):void;
		/**
		 * 在当前帧停止播放动画，即使调用scroll方法，也不会造成图像的变化
		 */  
		function stop():void;
		/**
		 * 设置可播放命令
		 */  
		function play():void;
		/**
		 * 释放资源
		 */
		function dispose():void;
		/**
		 * 设置是否显示
		 */  
		function setVisible(visible:Boolean):void;
		/**
		 * 返回一个可视对象
		 */  
		function getDisplayObject():DisplayObject;
		
		function getImageMovieForamt():ImageMovieForamt;
		/**
		 * 清除数据，为了下一次的重用 
		 * 
		 */		
		function clear():void;
	}
}
