/**
 * @BaseAction.as
 * @author soda.C mail:asframe@qq.com
 * @version  1.0
 * <br>Copyright (C), 2008 soda.C
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Core
 * @data 2008-6-15
 */
package com.asframe.action
{
	
	/**
	 * 动作基类，实现了动作接口
	 * 
	 * @author soda.C
	 */  
	public class BasicAction implements IAction
	{
		protected var type			:String;			//动作类型
		protected var name			:String;			//动作名称
		protected var finish		:Boolean;			//是否已完成
		protected var repList		:Array;				//可以替换的类型数据
		protected var replaceRole	:IAction;			//代替动作
		protected var actor			:IActor;
		
		public function BasicAction()
		{
			finish = false;
			repList = new Array();
			//默认类型,独占
			type = ActionConsts.ALONE;
		}
		/**
		 * 子类必须重写该方法
		 */  
		public function start(actor:IActor):void
		{
			this.actor = actor;
		}

		public function replace(action:IAction):Boolean
		{
			if(action.getName() == this.name)
			{
				return true;
			}
			if(isReplace(action))
			{
				//查看替换类型
				return true;
			}
			return false;
		}
		/**
		 * 动画频率执行方法，根据一定频率执行该方法
		 */
		public function tick():void
		{
			
		}
		public function setName(name:String):void
		{
			this.name = name;
		}
		public function isFinish():Boolean
		{
			return finish;
		}
		/**
		 * 设置可以替换的类型
		 */  
		public function setReplace(...args):void
		{
			var len:int = args.length;
			if(len > 0)
			{
				for(var i:int = 0; i < len; i++)
				{
					repList.push(args[i]);
				}
			}
		}
		public function setType(type:String):void
		{
			this.type = type;
		}
		public function getType():String
		{
			return type;
		}
		public function getName():String
		{
			return name;
		}
		public function getReplaceType():String
		{
			return "";
		}
		public function destroy(o:* = null):void
		{
			this.finish = true;
		}
		/**
		 * 动作action是否可以替换该动作
		 * @param action:动作实例
		 */  	
		protected function isReplace(action:IAction):Boolean
		{
			var len:int = repList.length;
			//查看是否在替换/临时替换列表里
			for(var i:int = 0; i < len; i++)
			{
				if(action.getName() == repList[i])
				{
					return true;
				}
			}
			return false;
		}
	}
}
