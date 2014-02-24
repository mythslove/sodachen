/**
 * @DisplayConst.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-1-17
 */
package com.asframe.display
{
	/**
	 *
	 * @author sodaChen
	 * #Date:2013-1-17
	 */
	public class DisplayConst
	{
		///////////////////// 角色的8个方向 ///////////////////
		public static const DOWN		:int = 1;	//下		图块1行
		
		public static const RIGHT_DOWN	:int = 2;	//右下	图块2行
		public static const RIGHT		:int = 3;	//右		图块3行
		public static const RIGHT_UP	:int = 4;	//右上	图块4行
		
		public static const UP			:int = 5;	//上		图块5行
		
		public static const LEFT_DOWN	:int = 6;	//左下	图块2行反向
		public static const LEFT		:int = 7;	//左		图块3行反向
		public static const LEFT_UP		:int = 8;	//左上	图块4行反向
		
		///////////////////// 影片播放的状态 ///////////////////
		public static const PLAY:int = 1;
		public static const STOP:int = 2;
		public static const PLAYING:int = 3;
		public static const END:int = 4;
	}
}
