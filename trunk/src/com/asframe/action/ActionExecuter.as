/**
 * @ActionExecuter.as
 * @author soda.C mail:asframe@qq.com
 * @version  1.0
 * <br>Copyright (C), 2008 soda.C
 * <br>This program is protected by copyright laws.
 * <br>Program Name:GoLive2
 * @data 2008-6-15
 */
package com.asframe.action
{
	import com.asframe.collections.lists.ArrayList;
	import com.asframe.slf4j.ILogger;
	import com.asframe.slf4j.LoggerFactory;
	import com.asframe.tick.ITick;
	import com.asframe.tick.Tick;

	/**
	 * 动作执行器
	 * @author soda.C
	 */  
	public class ActionExecuter implements ITick,IActionExecuter
	{
		/** 动作执行者,也就是这个动作执行的拥有者 **/
		private var actor			:IActor;
		private var list			:ArrayList;
		/** 删除列表 **/
		private var removeList		:Array;
		/** 是否正在跑onMoment **/
		private var isRunning		:Boolean;
		private var log				:ILogger
		
		public function ActionExecuter(actor:IActor)
		{
			this.actor		= actor;
			list 			= new ArrayList();
			removeList 		= [];
			log 			= LoggerFactory.getLogger(this);
		}
		/**
		 * 获取一个Action
		 * @param actionName:Action名称
		 * @return 返回Action实例
		 */
		public function getAction(actionName:String):IAction
		{
			if(actionName == null)
			{
				return null;
			}
			var len:int = list.size();
			for(var i:int = 0; i < len; i++)
			{
				var action:IAction = list.get(i) as IAction;
				if(action.getName() == actionName)
				{
					return action;
				}
			}
			return null;
		}
		/**
		 * 根据aciton的名称删除一个action
		 * @param actionName:action名称
		 * @return 返回IAction实例，如果没有则返回null
		 */
		public function removAction(actionName:String,isDispose:Boolean = true):void
		{
			if(actionName == null)
			{
				return ;
			}
			if(isRunning)
			{
				//正在遍历中，存放起删除列表
				removeList.push(actionName);
			}
			else
			{
				var action:IAction = getAction(actionName);
				if(action != null)
				{
					list.remove(action);
					if(!action.isFinish())
					{
						overAction(action);
					}
				}
			}
		}
		public function setActor(actor:IActor):void
		{
			this.actor = actor;
		}
		
		public function actAction(action:IAction):Boolean
		{
			//如果是并列的action。直接添加到list中去
			//检查是否有同类型的action
			var len:int = list.size();
			if(len == 0)
			{
				//添加到心跳执行器中
				Tick.addTick(this);
			}
			var canAdd:Boolean = true;
			for(var i:int = 0; i < len; i++)
			{
				var act:IAction = IAction(list.get(i));
				if(act == null)
				{
					continue;
				}
				//先判断是否属于队列动作
				if(action.getType() == ActionConsts.QUEUE)
				{
					//查找出属于相同名字的队列动作
					if(act.getName() == action.getName())
					{
						if(act.replace(action))
						{
							return true;
						}
					}
					//可能发生动作执行器里没有队列动作代理器
					if((i + 1) == len)
					{
						createQueueAction(action);
						return true;
					}
				}
				else
				{
					//查看是否是独占，已经存在，就不可代替
					if(action.getType() == ActionConsts.ALONE)
					{
						if(action.getName() == act.getName())
						{
							//强制性完成该动作，这里有可能会引起bug，因为如果是在遍历中调用这个方法的时候
							act.destroy();
							list.remove(act);
							break;
						}
					}
					//尝试去替换,这里有可能执行了临时替换，结果也是返回fase，注意
					if(act.isFinish())
					{
						//这里不应该进行删除
						continue;
//						list.remove(act);
					}
					else
					{
						if(!(act is QueueProxyAction))
						{
							if(act.replace(action))
							{
								//删除被替换的action
								list.remove(act);
								break;
							}
						}
					}
				}
			}
			if(action.getType() == ActionConsts.QUEUE)
			{
				createQueueAction(action);
			}
			else
			{
				try
				{
					//执行开始动作
					action.start(actor);
					//如果还没完成，则放进动作执行器里
					if(!action.isFinish())
					{
						list.add(action);
					}
				}
				catch(error:Error)
				{
					log.error(action + "执行start错误：" + error.getStackTrace());
					overAction(action);
				}
			}
			return true;
		}
		/**
		 * 创建一个代理action，同时执行action的start方法。发生错误的话，则销毁action，同时不创建代理action 
		 * @param action
		 * 
		 */		
		private function createQueueAction(action:IAction):void
		{
			try
			{
				action.start(actor);
			}
			catch(error:Error)
			{
				log.error("创建队列时，执行action.start出错" + action + "error:" + error.getStackTrace());
				//销毁
				overAction(action );
				return ;
			}
			var queueAction:QueueProxyAction = new QueueProxyAction();
			queueAction.start(actor);
			queueAction.setName(action.getName());
			queueAction.replace(action);
			list.add(queueAction);
		}
		public function clearActions():void
		{
			var len:int = list.size();
			for(var i:int = 0; i < len; i++)
			{
				//每个动作强制性执行结束
				var action:IAction = IAction(list.get(i));
				if(action != null && !action.isFinish())
				{
					//还没有执行完成的强制行结束
					overAction(action);
				}
			}
			list.clear();
		}
		
		/**
		 * 动画频率执行方法，根据一定频率执行该方法
		 */
		public function tick():void
		{
			isRunning = true;
			for(var i:int = 0; i < list.size(); i++)
			{
				var action:IAction = IAction(list.get(i));
				if(action != null)
				{
					try
					{
						//这个action有可能会在里面对ActionExecuter增加action，导致长度变换。所以原则上，action里是不能对同一个对象增加action
						action.tick();
						if(action.isFinish())
						{
							list.removeAt(i);
							i--;
						}
					}
					catch(e:Error)
					{
						log.debug("执行action:" + action + "出现错误:" + e.getStackTrace());
						//强行终止发生错误的action
						if(!action.isFinish())
						{
							overAction(action);
						}
						list.removeAt(i);
						i--;
					}
					
				}
			}
			isRunning = false;
			if(removeList.length > 0)
			{
				for each(var str:String in removeList)
				{
					removAction(str);
				}
				removeList = [];
			}
			if(list.size() == 0)
			{
				Tick.removeTick(this);
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
	}
}
