package com.asframe.display
{
	import flash.accessibility.AccessibilityProperties;  
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.geom.Point;
	import flash.text.*;
	
	/**
	 * @name  带背景的文本提示类
	 * @use 
	 * 			1.热区文本提示
	 * 			2.跟随鼠标移动
	 * 			3.更能改改中...
	 * 
	 * @example 
	 * 				 
	 * 				var _sprite:Sprite = new Sprite();
	 * 				addChild(_sprite);
	 * 				ToolTip.init(_sprite);				//一般用舞台就可以
	 * 
	 * 				//按钮和影片剪辑在_sprite中
	 * 				ToolTip.register(test_mc,"哈哈~有提示了");
	 * 
	 */
	public class ToolTip extends Sprite
	{
		//文本提示类实例
		private static var _instance:ToolTip = null;
		//文本对象
		private var _txt:TextField;
		//显示区域
		private var _area:DisplayObject;
		
		//显示信息
		private static var _info:String = "";
		
		//文本背景上层颜色
		private const UP_COLOR:uint = 0xffffff;
		//文本背景底层颜色
		private const DOWN_COLOR:uint = 0x000000;
		//文字颜色
		private const TEXT_COLOR:uint = 0x666666;
		
		public function ToolTip() 
		{
			//构建一个文本框
			_txt = new TextField();
			_txt.autoSize = TextFieldAutoSize.LEFT;
			_txt.selectable = false;
			_txt.multiline = true;
			_txt.wordWrap = false;
			
			//根据需要更改样式
			_txt.defaultTextFormat = new TextFormat("宋体", 14, TEXT_COLOR); 
			_txt.htmlText = "提示信息";
			_txt.x = 8;
			_txt.y = 5;
			addChild(_txt);
			
			initDraw();
			
			visible = false;
			mouseEnabled = mouseChildren = false;  
			
		}
		//绘制文本外框
		private function initDraw():void {
			
			var w:Number = 30 + _txt.width;  
            var h:Number = 10 + _txt.height;              
            this.graphics.clear();  
            this.graphics.beginFill(DOWN_COLOR, 0.4);
			//this.graphics.drawRoundRect(
            this.graphics.drawRoundRect(0, 0, w + 5, h + 5, 5, 5);  
			
            this.graphics.moveTo(int(w/2), 5+h);  
            this.graphics.lineTo(int(w/2)+14, 5+h);  
            this.graphics.lineTo(int(w/2)+7, 15 + h);  
            this.graphics.lineTo(int(w / 2), 5 + h);  
			
            this.graphics.endFill();  
			
            this.graphics.beginFill(UP_COLOR);  
            this.graphics.drawRoundRect(3, 3, w, h, 5, 5); 
			
            this.graphics.moveTo(int(w/2), 3+h);  
            this.graphics.lineTo(int(w/2)+12, 3+h);  
            this.graphics.lineTo(int(w/2)+6, 13 + h);  
            this.graphics.lineTo(int(w/2), 3+h);  
            this.graphics.endFill();  
			
		}
		//静态方法  供其他类调用
		 public static function init(_target:DisplayObjectContainer):void {  
            if (_instance == null) {  
                _instance = new ToolTip();  
				//trace(_target);
                _target.addChild(_instance);                  
            }  
        }
		
		//public static function setIndex(_target:baseSprite:DisplayObject,baseSprite2:DisplayObject):void {
			
			//_target.
			
		//}
		//屏幕阅读
		public static function register(area:DisplayObject, message:String):void {
			
			//trace(area);
			//trace("regiter");
            if(_instance != null){  
                var prop:AccessibilityProperties = new AccessibilityProperties();  
                prop.description = message;  
                area.accessibilityProperties = prop;  
				//_info = message;
                area.addEventListener(MouseEvent.MOUSE_OVER, _instance.handler);  
            }  
        }
		//移除
		public static function unregister(area:DisplayObject):void {  
            if (_instance != null) {  
                area.removeEventListener(MouseEvent.MOUSE_OVER, _instance.handler);  
            }  
        }
		//显示信息
		private function show(_target:DisplayObject):void {
			this._area = _target;
			
			this._area.addEventListener(MouseEvent.MOUSE_OUT, this.handler);  
            this._area.addEventListener(MouseEvent.MOUSE_MOVE, this.handler);  
            _txt.htmlText = _target.accessibilityProperties.description;
			
			//trace("wenben:",_txt.text);
			initDraw();
			
		}
		
		//隐藏信息
		private function hide():void {
			
			this._area.removeEventListener(MouseEvent.MOUSE_OUT, this.handler);  
            this._area.removeEventListener(MouseEvent.MOUSE_MOVE, this.handler);  
			this._area = null;
			//也可以换成动画效果
			visible = false;
			
		}
		public function move(point:Point):void { 
			
			//trace(this.parent);
            var lp:Point = this.parent.globalToLocal(point);  
			
			//trace(lp.x, lp.y);
		   // var lp:Point = point;
            this.x = lp.x - (_txt.width+30) / 2;            
            this.y = lp.y - _txt.height - 30 - this._area.height;
            if(!visible){  
                visible = true;  
            }  
        }  
		//鼠标移动处理
		public function handler(evt:MouseEvent):void {
			
			
			//trace("一-----");
			switch(evt.type) {
				
				case MouseEvent.MOUSE_OUT:
					this.hide();
					break;
				case MouseEvent.MOUSE_OVER:
				////////////trace(evt.currentTarget);
					//trace(evt.currentTarget);
					//trace(evt.currentTarget);
					this.show(evt.currentTarget as DisplayObject)
					//trace(evt);
					//trace(this._area.x);
					
					this.move(new Point(evt.stageX, evt.stageY));  
					break;
				case MouseEvent.MOUSE_MOVE:
					this.move(new Point(evt.stageX, evt.stageY));
					break;
			}
			
		}
		
	}
	
}