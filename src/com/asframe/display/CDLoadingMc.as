/**
 * Copyright KoheiTAKAMIYA ( http://wonderfl.net/user/KoheiTAKAMIYA )
 * MIT License ( http://www.opensource.org/licenses/mit-license.php )
 * Downloaded from: http://wonderfl.net/c/1OHO
 */

//textColorが反映されないのを修正

package com.asframe.display 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class CDLoadingMc extends Sprite 
	{
		private var fanLoader:FanLoader;
		private var box_w:Number=50;
		private var box_h:Number=50;
		public function CDLoadingMc(width:Number=50,height:Number=50) 
		{
			this.box_w=width;
			this.box_h=height;
			var r:Number=box_w+box_h;
			fanLoader = new FanLoader(0, 0, r);
			addChild(fanLoader);
			this.mask=this.fanLoader;
			this.color=0xff0000;
		}
		public function set color(val:uint):void
		{
			this.graphics.clear()
			this.graphics.beginFill(val);
			this.graphics.drawRect(-this.box_w/2,-this.box_h/2,this.box_w,this.box_h);
			this.graphics.endFill();
		}
		public function set value(val:Number):void
		{
			fanLoader.value = val;
		}
		public function get value():Number
		{
			return fanLoader.value;
		}
		
		static public function HSVtoRGB(h:Number, s:Number, v:Number):uint{
			if(Math.min(Math.max(h, 0), 360) != h) return 0;
			if(Math.min(Math.max(s, 0), 1)   != s) return 0;
			if(Math.min(Math.max(v, 0), 1)   != v) return 0;
			
			var RGB:uint;
			
			v = Math.round(v*255);
			if(v > 255) v = 255;
			
			//s==0の場合
			if(s == 0) return (v << 16) | (v << 8) | v;
			
			//s!=0の場合
			var hi:Number = Math.floor(h/60)%6;
			var f :Number = Math.floor(h/60)-hi;
			var p :Number = Math.round(v*(1-s));
			var q :Number = Math.round(v*(1-f*s));
			var t :Number = Math.round(v*(1-(1-f)*s));
			if(p > 255) p = 255;
			if(q > 255) q = 255;
			if(t > 255) t = 255;
			switch(hi){
				case 0: RGB = (v << 16) | (t << 8) | p; break;
				case 1: RGB = (q << 16) | (v << 8) | p; break;
				case 2: RGB = (p << 16) | (v << 8) | t; break;
				case 3: RGB = (p << 16) | (q << 8) | v; break;
				case 4: RGB = (t << 16) | (p << 8) | v; break;
				case 5: RGB = (v << 16) | (p << 8) | q; break;
			}
			
			return RGB;
		}
	}
}

//円形のLoader
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;

class FanLoader extends Sprite{
	private var graphics2:GraphicsPlus;
	// private var label:TextField;
	private var _radius:Number = 0;
	private var _value:Number = 0;
	
	public function FanLoader(x:Number = 0, y:Number = 0, radius:Number = 80):void{
		graphics2 = new GraphicsPlus();
		this.addChild(graphics2);
		/*
		label = new TextField();
		label.mouseEnabled = false;
		this.addChild(label);
		*/
		this.x = x;
		this.y = y;
		this.radius = radius;
	}
	
	//最描画
	private function draw():void{
		this.graphics2.clear();
		this.graphics2.beginFill(color);
		//this.graphics2.drawFan(0, 0, radius, radius*0.6, -90, value/maximum*360-90);
		this.graphics2.drawFan(0, 0, radius, radius, 270, value/maximum*360-90);
		this.graphics2.endFill();
		// label.textColor = textColor;
		// label.text = String(Math.round(value/maximum*100)+"%");
	}
	
	//プロパティ
	public var color:uint = 0xAAAAAA;
	public var textColor:uint = 0xAAAAAA;
	public var maximum:Number = 100;
	public var minimum:Number = 0;
	
	public function get radius():Number{
		return _radius;
	}
	public function set radius(val:Number):void{
		_radius = val;
		// label.defaultTextFormat = new TextFormat("Trebuchet MS", val*2/5, textColor, true, null, null, null, null, "center");
		draw();
		/*
		label.x = -val/2;
		label.y = -label.textHeight/2;
		label.width = val;
		*/
	}
	
	public function get value():Number{
		return _value;
	}
	public function set value(val:Number):void{
		_value= Math.min(100, val);
		if(_value<0){
			_value=0;
			this.graphics2.clear();
		}else
		{
			draw();
		}
		
	}
	
}

//扇形の描画クラス

import flash.display.IGraphicsData;
import flash.display.Shader;
import flash.display.Shape;
import flash.geom.Matrix;
import flash.geom.Point;

class GraphicsPlus extends Shape{
	public function GraphicsPlus(){
		beginFill = this.graphics.beginFill;
		beginGradientFill = this.graphics.beginGradientFill;
		beginShaderFill = this.graphics.beginShaderFill;
		clear = this.graphics.clear;
		curveTo = this.graphics.curveTo;
		drawCircle = this.graphics.drawCircle;
		drawEllipse = this.graphics.drawEllipse;
		drawGraphicsData = this.graphics.drawGraphicsData;
		drawPath = this.graphics.drawPath;
		drawRect = this.graphics.drawRect;
		drawRoundRect = this.graphics.drawRoundRect;
		drawRoundRectComplex = this.graphics.drawRoundRectComplex;
		drawTriangles = this.graphics.drawTriangles;
		endFill = this.graphics.endFill;
		lineGradientStyle = this.graphics.lineGradientStyle;
		lineShaderStyle = this.graphics.lineShaderStyle;
		lineStyle = this.graphics.lineStyle;
		lineTo = this.graphics.lineTo;
		moveTo = this.graphics.moveTo;
	}
	
	// 扇形を描くメソッド
	// x:中心のx座標  y:中心のy座標
	// r1:外円の半径  r2:内円の半径
	// a1:始点の角度  a2:終点の角度
	public function drawFan(x:Number, y:Number, r1:Number, r2:Number, a1:Number, a2:Number):void{
		
		//角度をラジアンに直す
		var radian1:Number = a1*Math.PI/180;
		var radian2:Number = a2*Math.PI/180;
		
		// 外円の描画
		//draw(x, y, r1, radian1, radian2, false);
		// 内円の描画
		draw(x, y, r2, radian2, radian1, true);
	}
	
	//扇形の外円・内円の描画
	//参考サイト丸写し…
	private function draw(x:Number, y:Number, r:Number, t1:Number, t2:Number, lineTo:Boolean):void{
		var div:Number = Math.max(1, Math.floor(Math.abs(t1 - t2) / 0.4));
		var lx:Number;
		var ly:Number;
		var lt:Number;
		
		for (var i:int = 0; i <= div; i++) {
			var ct:Number = t1 + (t2 - t1)*i/div;
			var cx:Number = Math.cos(ct)*r + x;
			var cy:Number = Math.sin(ct)*r + y;
			
			if(i==0){
				if(lineTo) this.graphics.lineTo(cx, cy);
				else this.graphics.moveTo(cx, cy);
			}else{
				var cp:Point = getControlPoint(new Point(lx, ly), lt+Math.PI/2, new Point(cx, cy), ct+Math.PI/2); 
				this.graphics.curveTo(cp.x, cp.y, cx, cy);
			}
			lx = cx;
			ly = cy;
			lt = ct;
		}
	}
	
	//コントロールポイントの計算
	//参考サイト丸写し…
	private function getControlPoint(p1:Point, t1:Number, p2:Point, t2:Number):Point{
		var dif:Point = p2.subtract(p1);
		var l12:Number = Math.sqrt(dif.x*dif.x + dif.y*dif.y);
		var t12:Number = Math.atan2(dif.y, dif.x);
		var l13:Number = l12*Math.sin(t2 - t12)/Math.sin(t2 - t1);
		
		return new Point(p1.x+l13*Math.cos(t1), p1.y+l13*Math.sin(t1));
	}
	
	
	//------------------------------------------------
	//「Graphicsクラスのサブクラス」風に見せるための変数
	public var beginFill:Function;
	public var beginGradientFill:Function;
	public var beginShaderFill:Function;
	public var clear:Function;
	public var curveTo:Function;
	public var drawCircle:Function;
	public var drawEllipse:Function;
	public var drawGraphicsData:Function;
	public var drawPath:Function;
	public var drawRect:Function;
	public var drawRoundRect:Function;
	public var drawRoundRectComplex:Function;
	public var drawTriangles:Function;
	public var endFill:Function;
	public var lineGradientStyle:Function;
	public var lineShaderStyle:Function;
	public var lineStyle:Function;
	public var lineTo:Function;
	public var moveTo:Function;
}

