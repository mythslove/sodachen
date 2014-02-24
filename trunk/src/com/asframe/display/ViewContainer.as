/**
 * IViewContainer接口的实现类
 * @author suving.ke
 * #date 2008年12月10日
 */
package com.asframe.display
{
	import com.asframe.collections.maps.HashMap;
	import com.asframe.collections.maps.IMap;
	import com.asframe.slf4j.Logger;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class ViewContainer extends Sprite implements IViewContainer
	{
		protected var containerMap:IMap;
		
		public function ViewContainer()
		{
			containerMap = new HashMap();
		}
		public function isEmptyContainer(layer:String):Boolean
		{
			return containerMap.hasKey(layer);
		}
		/**
		 * 
		 */
		public function setContainers(constainerNames:Array):void
		{
			var containers:Array = constainerNames;
			for(var i:int = 0;i < containers.length;i++)
			{
				var container:Sprite = new Sprite();
				this.addChild(container);
				containerMap.put(constainerNames[i],container);
			}
		}
		public function getChildContainer(constainerName:String):Sprite
		{
			return containerMap.get(constainerName) as Sprite;
		}
		public function addContainerChild(containerName:String, child:DisplayObject, depth:int = -1):int
		{
			var container:Sprite = containerMap.get(containerName) as Sprite;
			if(container == null)
			{
				throw new Error("容器" + containerName + "出现为空");
			}
			container.addChild(child);
			return container.getChildIndex(child);
		}
		
		public function removeContainerChild(child:DisplayObject=null, containerName:String=null):void
		{
			if(containerName != null)
			{
				var container:Sprite = containerMap.get(containerName) as Sprite;
				if(child != null)
				{					
					if(child.parent == container)
					{
						container.removeChild(child);
					}
				}
				else
				{
					var j:int = 0;
					//遍历指定容器的所有子项
					while(j>=0)
					{
						try
						{
							container.removeChild(container.getChildAt(j));
							j++;
						}
						catch(e:Error)
						{
							Logger.error("removeContainerChild超出范围: " + j,this);
							break;
						}
					}
				}
			}
			else
			{
				var ary:Array = containerMap.valuesToArray()
				for(var i:int=0;i < ary.length;i++)
				{
					if(child.parent == ary[i])
					{
						ary[i].removeChild(child);
					    break;
					}					
				}				
			}
		}
		
		public function addContainer(constainerName:String, container:Sprite = null,depth:int = -1):void
		{
			if(containerMap.get(constainerName) == null)
			{
				if(container == null)
				{
					container = new Sprite();
				}
				if(depth == -1)
				{
					this.addChild(container);
				}
				else
				{
					this.addChildAt(container,depth);
				}
				containerMap.put(constainerName,container);
			}
		}
		
		public function removeContainer(constainerName:String):Sprite
		{
			var container:Sprite = containerMap.get(constainerName) as Sprite;
			if(container != null)
			{
				containerMap.remove(constainerName);
				return Sprite(this.removeChild(container));
			}
			return null;		
		}
		
		public function orderContainer(constainerNames:Array):void
		{
			var containers:Array = constainerNames;
			for(var i:int = 0;i < containers.length;i++)
			{
				//对原有的child进行排序
			}
		}		
		
		public function removeContainerChildAt(depth:int, containerName:String=null):DisplayObject
		{
			return null;
		}
		
		public function getContainer():Sprite
		{
			return this;
		}
		
		public function dispose():void
		{
			//删除所有容器的显示对象
			var containerAry:Array = containerMap.valuesToArray();
			var keyAry:Array = containerMap.keysToArray();
			for(var i:int = 0;i < containerAry.length;i++)
			{
				//对原有的child进行排序
				var container:Sprite = containerAry[i] as Sprite;
				for(var j:int = 0;j < container.numChildren;j++)
				{
					container.removeChildAt(j);
				}
				//重新生成一个干净的容器
				containerAry[i] = new Sprite();
//				Logger.debug("清除[ " + keyAry[i] + " ]容器里的显示对象完毕",this);
			}
		}
		
	}
}
