package com.asframe.display.bitmap
{
	import com.asframe.display.IMovieClip;
	import com.asframe.display.data.ImageActionForamt;
	import com.asframe.display.data.ImageMovieForamt;
	import com.asframe.slf4j.Logger;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;

	/**
	 * 图片形式的影片剪辑
	 *  
	 * @author Soda.Chen
	 * #date 2009-2-3
	 * 
	 */	
	public class ImageMovieClip extends Bitmap implements IMovieClip
	{
		private var row				:int;				//图片的行数
		private var count			:int;				//一行的图片数量
		private var scrollW			:int;				//滚动的宽度
		private var scrollH			:int;				//滚动的高度
		private var currWay			:int;				//当前方向
		private var step			:int;				//当前行走步数
		private var maxStep			:int;				//当前行的最大步数
		private var rect			:Rectangle;			//显示区域
		private var isTurn			:Boolean;			//是否反转方向
		private var isPlay			:Boolean;			//是否播放
		private var imageAry		:Array;				//存放动画
		private var trueWay			:int;				//玩家没有经过转换的真实方向
		private var movieFormat		:ImageMovieForamt;	//图片动画形式播放的格式集合
		/** 当前图像是否有图像 **/
		private var hasImage		:Boolean;
		
		public function ImageMovieClip(pixelSnapping:String="auto", smoothing:Boolean=false)
		{
			super(null, pixelSnapping, smoothing);
			isPlay = true;
		}
		public function getCurrentFrame():int
		{
			return step;
		}
		public function init(movieFormat:ImageMovieForamt):void
		{
			this.movieFormat = movieFormat;
			scrollW = movieFormat.width;
			scrollH = movieFormat.height;
			currWay = 1;
			instance(movieFormat.getImageActionForamt(movieFormat.defaultAction));
		}
		
		public function changeAction(name:String,time:int = -1,isUpdate:Boolean = false):void
		{
			isPlay = true;
			if(movieFormat != null)
			{
				//切换一个动作
				var actionFormat:ImageActionForamt = movieFormat.actionMap.get(name) as ImageActionForamt;
				if(actionFormat == null)
				{
					Logger.error("切换动作所制定的名称没有指定的动作资料:name:" + name,this);
				}
				instance(actionFormat);
			}
		}
		
		private function instance(actionForamt:ImageActionForamt):void
		{
			if(actionForamt == null)
			{
				hasImage = false;
				return ;
			}
			hasImage = true;
			imageAry = actionForamt.bitmapDatas;
			scrollW = imageAry[1][0].width;
			scrollH = imageAry[1][0].height;
			maxStep = actionForamt.col;
			step = 0;
			update();
		}
		public function gotoAndStop(frame:Object = -1,row:Object = -1):void
		{
		}
		/**
		 * 设置状态,每次切换方向时都必须调用该方法,方向值必须是ScrollBitmap提供的静态属性值
		 * @param	currWay:当前方向值
		 */ 
		public function changeWay(currWay:int):void
		{
			this.trueWay = currWay;
			if(currWay > 5)
			{
				this.currWay = currWay - 5;
				if(!isTurn)
				{
					//反转
					this.scaleX = -1;
					this.x = this.x + scrollW;
					isTurn = true;
				}
			}
			else
			{
				if(isTurn)
				{
					//恢复
					this.scaleX = 1;
					isTurn = false;
					this.x = this.x - scrollW;
				}	
				this.currWay = currWay - 1;
			}
		}
		public function stop():void
		{
			isPlay = false;
		}
		
		public function play():void
		{
			isPlay = true;
		}
		public function isPlayMovie():Boolean
		{
			return isPlay
		}
		public function dispose():void
		{
			for each(var actionFormat:ImageActionForamt in movieFormat.actionMap.getContainer())
			{
				var len:int = actionFormat.bitmapDatas.length;
				for(var i:int = 0; i < len; i++)
				{
					var tempAry:Array = actionFormat.bitmapDatas[i] as Array;
					var tempLen:int = tempAry.length;
					for(var j:int = 0; j < tempLen; j++)
					{
						var bitmapData:BitmapData = tempAry[j] as BitmapData;
						bitmapData.dispose();
					}
				}
			}
		}
		
		public function setVisible(visible:Boolean):void
		{
			this.visible = visible;
		}
		
		public function getDisplayObject():DisplayObject
		{
			return this;
		}
		/**
		 * 是否结束一回的动作播放
		 * @return 
		 * 
		 */		
		public function isEndBout():Boolean
		{
			if(!hasImage)
			{
				//没有图像，直接显示结束播放了
				return true;
			}
			//当前步是否等于最大步
			return step == maxStep;
		}
		public function scroll():void
		{
			if(step == maxStep)
			{
				step = 0;
//				if(isPlay)
//				{
//					//发出一次结束事件
//					dispatchEvent(new MovieEvent(MovieEvent.ACTION_END));
//				}
			}
			update();
			step++;
		}
		public function getImageMovieForamt():ImageMovieForamt
		{
			return movieFormat;
		}
		/**
		 * 清除数据，为了下一次的重用 
		 * 
		 */		
		public function clear():void
		{
			//取消对这个的引用。这里可能还需要重新构思。一般来说，图像资源是从外部传输
			//那里这里进行清除和释放，其实不会操作实际的图像资源的。不过会做一些相关的操作。例如是清除引用而已
			movieFormat = null;
		}
		//进行滚动图片
		private function update():void
		{
			if(imageAry != null)
			{
//				Logger.debug("currWay:"+ currWay+ "step:"+ step,this);
				if(currWay<0)
				{
//					Logger.debug("方向出错:"+ currWay,this)
				}
				if(isPlay)
				{
					this.bitmapData = imageAry[Math.abs(currWay)][step];
				}
			}
		}
		
	}
}
