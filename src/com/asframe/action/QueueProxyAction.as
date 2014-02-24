/**
 * @QueueProxyAction.as
 * @author soda.C mail:asframe@qq.com
 * @version  1.0
 * <br>Copyright (C), 2008 soda.C
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Core
 * @data 2008-6-15
 */
package com.asframe.action
{
	import com.asframe.slf4j.ILogger;
	import com.asframe.slf4j.LoggerFactory;

	/**
	 * 队列动作代理器，代理所有类型为ActionConstants.QUEUE类型的动作,进行队列播放<br>
	 * 当代理器里的所有动作都播放完时，则该代理器从动作管理器中删除
	 * 
	 * @author soda.C
	 */  
	public class QueueProxyAction extends BasicAction
	{
		private static var log	:ILogger = LoggerFactory.getLoggerByClass(QueueProxyAction);
		private var actions		:Array;		//队列里的action
		private var currAction	:IAction;	//当前执行的动作
		private var count		:int;		//action数量
		
		public function QueueProxyAction()
		{
			super();
			count = 0;
			actions = new Array();
			this.type = ActionConsts.QUEUE;
			this.name = "QueueProxyAction";
		}

		/**
		 * 重写了该方法，在这里，所有替换的类，都会叠加到该类，实际上在里面实现的是一个队列过程
		 */  
		public override function replace(action:IAction):Boolean
		{
			if(action.getType() != ActionConsts.QUEUE)
			{
				new Error("所替换的不是属于队列动作:" + action.getName());
			}
			if(currAction == null)
			{
				currAction = action;
			}
			else
			{
				actions.push(action);
			}
			return true;
		}
		
		public override function tick():void
		{
			if(currAction != null)
			{
				if(currAction.isFinish())
				{
					selectAction();
				}
				else
				{
					//当前动作播放
					try
					{
						currAction.tick();
						if(currAction.isFinish())
						{
							//再次选择一个新的
							selectAction();
						}
					}
					catch(error:Error)
					{
						log.error(currAction + "执行onMoment出错:" + error.getStackTrace());
						overAction(currAction);
						//再次选择一个新的
						selectAction();
					}
				}
			}
			else
			{
				//尝试取新的
				selectAction();
			}
		}
		public override function destroy(o:* = null):void
		{
			finish = true;
			if(currAction != null)
			{
				if(!currAction.isFinish())
				{
					overAction(currAction);
				}
				currAction = null;
			}
			if(actions != null)
			{
				if(actions.length > 0)
				{
					for(var i:int = 0; i < actions.length; i++)
					{
						var action:IAction = actions[i];
						overAction(action);
					}
				}
				actions = null;
			}
		}
		/**
		 * 结束一个action，同时会调用action的overAction方法
		 * @param action
		 * 
		 */		
		private function overAction(action:IAction):void
		{
			if(action != null)
			{
				try
				{
					action.destroy();
				}
				catch(e:Error)
				{
					log.error(action + "强行结束出错:" + e.getStackTrace());
				}
			}
		}
		/**
		 * 选择一个新的action来处理 
		 * 
		 */		
		private function selectAction():void
		{
			if(actions == null)
			{
				return ;
			}
			if(actions.length > 0)
			{
				//更新新的动作
				currAction = actions.shift();
				if(currAction == null)
				{
					//出现空的，继续选择
					selectAction();
				}
				else
				{
					try
					{
						currAction.start(actor);
					}
					catch(error:Error)
					{
						log.error("代理器执行currAction.start出错. currAction" + currAction);
						log.error("错误打印:" + error.getStackTrace());
						//执行错误，强制关闭，继续选择新的
						overAction(currAction);
						selectAction();
					}
				}
			}
			else
			{
				destroy();
			}
		}
		//清楚数据
		private function clear():void
		{
			actions = null;
			count = 0;
		}
	}
}
