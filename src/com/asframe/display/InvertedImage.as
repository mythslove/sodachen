/**
 * @InvertedImage.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2010 feiyin.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Torchlight
 * <br>Date:2013-5-31
 */
package com.asframe.display
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/*
	
	Written by:
	Dustin Andrew
	dustin@flash-dev.com
	www.flash-dev.com
	
	LAST UPDATED:
	01/24/06
	
	Reflection.as
	
	Create a bitmap reflection of a displayobject    
	
	*/
	
	/**
	 * 倒影类
	 * 
     * var sprReflect:InvertedImage = new InvertedImage(disImg, .4, .2, 0, 0, 1);
     * sprImg.addChild(sprReflect);  
	 *      
	 * @author sodaChen
	 * #Date:2013-5-31
	 */
	public class InvertedImage extends Sprite
	{
		private var _disTarget:DisplayObject;
		private var _numStartFade:Number = .3;
		private var _numMidLoc:Number = .5;
		private var _numEndFade:Number = 0;
		private var _numSkewX:Number = 0;
		private var _numScale:Number = 1;        
		private var _bmpReflect:Bitmap;
		
		// Constructor
		public function InvertedImage(set_disTarget:DisplayObject, set_numStartFade:Number, set_numMidLoc:Number, set_numEndFade:Number, set_numSkewX:Number, set_numScale:Number) {
			_disTarget = set_disTarget;
			_numStartFade = set_numStartFade;
			_numMidLoc = set_numMidLoc;
			_numEndFade = set_numEndFade;
			_numSkewX = set_numSkewX;
			_numScale = set_numScale;
			
			_bmpReflect = new Bitmap(new BitmapData(1, 1, true, 0));
			this.addChild(_bmpReflect);
			createReflection();
		}
		
		// Create reflection
		private function createReflection(event:Event = null):void 
		{
			
			// Reflection
			var bmpDraw:BitmapData = new BitmapData(_disTarget.width, _disTarget.height, true, 0);
			var matSkew:Matrix = new Matrix(1, 0, _numSkewX, -1 * _numScale, 0, _disTarget.height);
			var recDraw:Rectangle = new Rectangle(0, 0, _disTarget.width, _disTarget.height * (2 - _numScale));
			var potSkew:Point = matSkew.transformPoint(new Point(0, _disTarget.height));
			matSkew.tx = potSkew.x * -1;
			matSkew.ty = (potSkew.y - _disTarget.height) * -1;
			bmpDraw.draw(_disTarget, matSkew, null, null, recDraw, true);
			
			// Fade
			var shpDraw:Shape = new Shape();
			var matGrad:Matrix = new Matrix();
			var arrAlpha:Array = new Array(_numStartFade, (_numStartFade - _numEndFade) / 2, _numEndFade);
			var arrMatrix:Array = new Array(0, 0xFF * _numMidLoc, 0xFF);
			matGrad.createGradientBox(_disTarget.width, _disTarget.height, 0.5 * Math.PI);
			shpDraw.graphics.beginGradientFill(GradientType.LINEAR, new Array(0,0,0), arrAlpha, arrMatrix, matGrad)
			shpDraw.graphics.drawRect(0, 0, _disTarget.width, _disTarget.height);
			shpDraw.graphics.endFill();
			bmpDraw.draw(shpDraw, null, null, BlendMode.ALPHA);
			
			_bmpReflect.bitmapData.dispose();
			_bmpReflect.bitmapData = bmpDraw;
			
			_bmpReflect.filters = _disTarget.filters;
			
			this.x = _disTarget.x;
			this.y = (_disTarget.y + _disTarget.height) - 1;          
		}
	}
}
