/**
 * @MouseManager.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame EasyPlane
 * <br>Date:2012-11-5
 */
package com.asframe.managers
{
	import com.asframe.fun.CallFunctions;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-11-5
	 */
	public class MouseManager
	{
		public static const DOWN			:String = "down";
		public static const CLICK			:String = "click";
		public static const MOVE			:String = "move";
		public static const LEAVE			:String = "leave";
		public static const DOUBLE_CLICK	:String = "double click";
		public static const UP				:String = "up";
		
		private static var instance			:MouseManager;
		private var clickMouses				:CallFunctions;
		private var moveMouses				:CallFunctions;
		private var leaveMouses				:CallFunctions;
		private var doubleclickMouses		:CallFunctions;
		private var upMouses				:CallFunctions;
		private var downMouses				:CallFunctions;
		private var stage					:Stage;
		
		public function MouseManager()
		{
			clickMouses = new CallFunctions();
			moveMouses = new CallFunctions();
			leaveMouses = new CallFunctions();
			doubleclickMouses = new CallFunctions();
			upMouses = new CallFunctions();
			downMouses = new CallFunctions();
		}
		
		public static function getInstance():MouseManager
		{
			if(instance == null)
			{
				instance = new MouseManager();
			}
			return instance;
		}
		public function init(stage:Stage,isDouble:Boolean = false):void
		{
			this.stage = stage;
			this.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			this.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.stage.addEventListener(MouseEvent.CLICK, onMouseClick);
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			if(isDouble)
				this.stage.addEventListener(MouseEvent.DOUBLE_CLICK, onMouseDoubleClick);
//			this.stage.addEventListener(Event.MOUSE_LEAVE, onMouseLeave);
		}
		public function registerMouse(mouseEvent:String, listen:Function) : void
		{
			switch(mouseEvent.toLowerCase())
			{
				case DOUBLE_CLICK:
				{
					doubleclickMouses.addFunction(listen);
					break;
				}
				case CLICK:
				{
					clickMouses.addFunction(listen);
					break;
				}
				case UP:
				{
					upMouses.addFunction(listen);
					break;
				}
				case DOWN:
				{
					downMouses.addFunction(listen);
					break;
				}
				case MOVE:
				{
					moveMouses.addFunction(listen);
					break;
				}
				case LEAVE:
				{
					leaveMouses.addFunction(listen);
					break;
				}
			}
		}
		
		public function unregisterMouse(mouseEvent:String, listen:Function) : void
		{
			switch(mouseEvent.toLowerCase())
			{
				case DOUBLE_CLICK:
					doubleclickMouses.removeFunction(listen);
				case CLICK:
					clickMouses.removeFunction(listen);
				case UP:
					upMouses.removeFunction(listen);
				case DOWN:
					downMouses.removeFunction(listen);
				case MOVE:
					moveMouses.removeFunction(listen);
				case LEAVE:
					leaveMouses.removeFunction(listen);
			}
		}
		private function onMouseClick(event:MouseEvent) : void
		{
			clickMouses.calls();
		}
		private function onMouseDoubleClick(event:MouseEvent) : void
		{
			doubleclickMouses.calls();
		}
		private function onMouseLeave(event:MouseEvent) : void
		{
			leaveMouses.calls();
		}
		private function onMouseUp(event:MouseEvent) : void
		{
			upMouses.calls();
		}
		
		private function onMouseDown(event:MouseEvent) : void
		{
			downMouses.calls();
		}
		private function onMouseMove(event:MouseEvent) : void
		{
			moveMouses.calls();
		}
	}
}
