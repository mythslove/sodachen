/**
 * @BasicShareObject.as.as
 * 
 * @author sodaChen mail:asframe#qq.com
 * @version 1.0
 * <br>Copyright (C), 2013 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2013-3-31
 */
package com.asframe.share
{
	/**
	 *
	 * @author sodaChen
	 * Date:2013-3-31
	 */
	public class BasicShareObject implements IShareObject
	{
		protected var name:String;
		protected var cite:int;
		protected var objectOver:IShareObjectOver;
		
		public function BasicShareObject()
		{
		}
		public function getName():String
		{
			return name;
		}
		public function setName(name:String):void
		{
			this.name = name;
		}
		public function setObjectOver(objectOver:IShareObjectOver):void
		{
			this.objectOver = objectOver;
		}
		
		public function access():void
		{
			cite++;
		}
		
		public function getout():void
		{
			cite--;
			if(cite == 0)
			{
				if(objectOver == null)
				{
					destroy();
				}
				else
				{
					objectOver.objectOver(this);
				}
			}
		}
		
		public function destroy(o:*=null):void
		{
			cite = 0;
			objectOver = null;
		}
	}
}