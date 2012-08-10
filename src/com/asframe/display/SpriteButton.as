/**
 * @(#)SpriteButton.as
 * 
 * @author  soda.C  E-mail:asframe@163.com
 * @version  1.0
 * <br>Copyright (C), 2007 soda.C
 * <br>This program is protected by copyright laws.
 * <br>Program Name:Soda.C.API
 * <br>Date:2007.12.25
 */
 
package com.asframe.display
{
	import com.asframe.utils.CommonTools;
	
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.getDefinitionByName;

	/**
	 * 该类是个按钮类,基于Sprite的扩充,可以在flash资源库直接读取SimpleButton子类从而生成一个新的按钮
	 * 下面是该类的使用例子
	 * 		try
	 * 		{
	 * 			var btn:SpriteButton = new SpriteButton("Btn","测试文本");
	 *			btn.x = 200;
	 *			btn.y = 200;
	 *			this.addChild(btn);
	 *		}
	 *		catch(error:ReferenceError)
	 *		{
	 *			trace("找不到对应的链接名:" + error);
	 *		}
	 *	其中"Btn"为flash资源库中的一个连接名(SimpleButton子类),即是在flashIDE工具中的按钮资源
	 *	增加按钮资源的方法:
	 *	英文.Insert -> New Symbol -> Button
	 *	中文.插入 -> 新建元件 -> 按钮
	 * 
	 */
	public class SpriteButton extends Sprite 
	{
		private var nameText	:TextField;			//文本框
		private var button		:SimpleButton;		//按钮实例
		private var textFormat	:TextFormat;		//文本格式
		private var isChange	:Boolean;			//button的sprite是否随文本框变化而改变
		
		/**
		 * 创建一个SpriteButton实例,注意该方法有可能抛出ReferenceError异常
		 * @param btnName		:SimpleButton子类在库中的标识
		 * @param text			:字符串信息
		 * @param textFormat	:文本格式实例
		 */
		public function SpriteButton( btnName		:String = null,
									  	text		:String = null,
									  	textFormat	:TextFormat = null)
		{
			nameText = new TextField();
			nameText.selectable = false;
			nameText.mouseEnabled = false;
			if(textFormat == null)
			{
				textFormat = new TextFormat();
				textFormat.size = 12;
				textFormat.font = "Tahoma";
				textFormat.align = TextFormatAlign.CENTER;
				textFormat.color = 0x000000;
			}
			this.textFormat = textFormat;
			
			if(text != null)
			{
				nameText.text = text;
				nameText.setTextFormat(textFormat);	
			}
			
			if(btnName != null)
			{
				button = CommonTools.referenceObject(btnName);
				instanceText();
				this.addChild(button);
				this.addChild(nameText);			
			}
		}
		public function getButton():SimpleButton
		{
			return button;
		}
		/**
		 * 设置按钮文本格式
		 * @param textFormat:文本格式实例
		 */
		public function setTextFormat(textFormat:TextFormat):void
		{
			this.textFormat = textFormat;
			nameText.setTextFormat(textFormat);
			instanceText();			//重新设置文本的位置
		}
		/**
		 * 返回按钮文本格式
		 * @return 返回按钮文本格式
		 */
		public function getTextFormat():TextFormat
		{
			return textFormat;
		}
		/**
		 * 设置按钮文本的字体风格,默认字体大小为12,颜色为黑色,字体为Tahoma字体
		 * @param size	:字体大小
		 * @param color	:字体颜色
		 * @param font	:字体种类
		 */
		public function setFormatParam(	size		:int = 12, 
											color		:uint = 0x000000,
											font		:String = "Tahoma"
										):void
		{
			textFormat.size = size;
			textFormat.font = font;
			textFormat.color = color;
			nameText.setTextFormat(textFormat);
			instanceText();			//重新设置文本的位置
		}
		//暂时不实现
		public function isChangeSprite(isChange:Boolean):void
		{
			this.isChange = isChange;
		}
		/**
		 * 设置具体的button的显示,注意该方法有可能抛出ReferenceError异常
		 * @param btnName:SimpleButton子类在库中的标识
		 */
		public function setButton(btnName:String):void
		{
			button = CommonTools.referenceObject(btnName);
			this.addChild(button);
			instanceText();			//重新设置文本的位置
			this.addChild(nameText);
		}
		
		/**
		 * 设置文本内容
		 * @param text:字符串信息
		 */
		public function setText(text:String):void
		{
			nameText.text = text;
			nameText.setTextFormat(textFormat);
		}
		/**
		 * 返回按钮文本的信息
		 * @return 字符串内容
		 */
		public function getText():String
		{
			return nameText.text;
		}
		
		/**
		 * 返回按钮文本的信息
		 * @return 字符串内容
		 */
		public function getTextField():TextField
		{
			return nameText;
		}
		
		private function instanceText():void
		{
			nameText.autoSize = TextFieldAutoSize.CENTER;	
			nameText.width = button.width + 1;
			nameText.autoSize = TextFieldAutoSize.NONE;
			if(nameText.height > button.height)
			{
				nameText.height = button.height;
			}
			nameText.x = 0;
			nameText.y = (button.height - nameText.height) / 2 - 1;
		}
	}
}
