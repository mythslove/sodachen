/**
 * @HtmlTextUtils.as.as
 * 
 * @author sodaChen mail:asframe@qq.com
 * @version 1.0
 * <br>Copyright (C), 2010 asFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:FlyDragon
 * <br>Date:2013-4-29
 */
package com.asframe.utils
{
	import flash.filters.GlowFilter;

	/**
	 * 生成HtmlText的工具方法
	 * @author sodaChen
	 * Date:2013-4-29
	 */
	public class HtmlTextUtils
	{
		/**
		 *获取带色值,精细,大小的字符串 
		 */
		public static function getColorString(str:String,col:String = "#00FF00",
											  bold:Boolean = false,size:int = 12,
											  font:String = null):String
		{
			if(font == null)
			{
				font = "宋体"//Share_com_ToolTip.FONT_DEFUALT;
			}
			if(bold)
			{
				return "<FONT face = '"+ font +"'size = '" + size + "' COLOR='"+col+"'><b>"+str+"</b></FONT>"; 
			}
			else
			{
				return "<FONT  face = '"+ font +"'size = '" + size + "' COLOR='"+col+"'>"+str+"</FONT>";
			}
		}
		/**获取带对齐方式的句子**/
		public static function getColorAlainString(align:String = "LEFT",str:String = "",col:String = "#00FF00",
												   bold:Boolean = false,size:int = 12,
												   font:String = null):String
		{
			if(font == null)
			{
				font = "宋体";//Share_com_ToolTip.FONT_DEFUALT;
			}
			if(bold)
			{
				return "<P align = '" + align + "'><FONT face = '"+ font +"'size = '" + size + "' COLOR='"+col+"'><b>"+str+"</b></FONT></P>"; 
			}
			else
			{
				return "<P align = '" + align + "'><FONT  face = '"+ font +"'size = '" + size + "'COLOR='"+col+"'>"+str+"</FONT></P>";
			}
		}
		/**
		 *获取带色值,链接的字符串 
		 */		
		public static function getLinkString(str:String,col:String = "#FFFFFF",
											 eventTxt:String = "",
											 bold:Boolean = false,
											 size:int = 12,
											 font:String = null):String
		{		
			if(font == null)
			{
				font = "宋体";//Share_com_ToolTip.FONT_DEFUALT;
			}
			if(bold)
			{
				return "<FONT face = '"+ font +"'size = '" + size + "'COLOR='"+col+"'><a href=\'event:"+eventTxt+"'\><b>"+str+"</b></a></FONT>"; 
			}
			else
			{
				return "<FONT face = '"+ font +"'size = '" + size + "'COLOR='"+col+"'><a href=\'event:"+eventTxt+"'\>"+str+"</a></FONT>"; 
			}
			
		}
		/**
		 *获取带色值,链接的字符串 
		 */		
		public static function getLinkString1(str:String,
											  col:String = "#00FF00",
											  eventTxt:String = "",
											  bold:Boolean = false,
											  size:int = 12,
											  font:String = null):String
		{		
			if(font == null)
			{
				font = "宋体";//Share_com_ToolTip.FONT_DEFUALT;
			}
			if(bold)
			{
				return "<FONT face = '"+ font +"'size = '" + size + "'COLOR='"+col+"'><a href=\'event:"+eventTxt+"'\><b>"+str+"</b></a></FONT>"; 
			}
			else
			{
				return "<FONT face = '"+ font +"'size = '" + size + "'COLOR='"+col+"'><a href=\'event:"+eventTxt+"'\>"+str+"</a></FONT>"; 
			}
			
		}
		/**
		 *获取带色值,链接的字符串 ，下带划线
		 */		
		public static function getLinkUnderLString(str:String,col:String = "#00FF00",eventTxt:String = "",size:int = 14,font:String = null):String
		{		
			if(font == null)
			{
				font = "宋体";//Share_com_ToolTip.FONT_DEFUALT;
			}
			return "<FONT face = '" + font + "' COLOR='" + col + "' size = '" + size  +"'><u><a href=\'event:"+eventTxt+"'\>"+str+"</a></u></FONT>"; 			
		}
		/**
		 * 获取一串分解的字符串合并成html字符串 
		 * @param str_arr		
		 * @param col_arr		对应色值
		 * @return 
		 * 
		 */		
		public static function getHtmlFromArray(str_arr:Array,col_arr:Array):String
		{
			var len:int = str_arr.length;
			var str:String = "<p>";
			for(var i :int = 0;i<len;i++)
			{
				str += getColorString(str_arr[i],col_arr[i]);
			}
			str += "</p>";
			return str;
		}	
		/**
		 *  获取首页的公告显示内容
		 * @param str		:字符串
		 * @param size 		:int 字体大小	
		 * @return 			:htmlText
		 * 
		 */		
		public static function getNoticeString(str:String,size:int):String
		{
			var list:Array = str.split("|");
			var len:int = list.length;
			var result:String = ""
			for(var i :int = 0;i<len;i++)
			{
				result += getColorString(list[i],"#FFFFFF",false,size,"Arial") + "\n";
			}
			return result;
		}
		/**
		 * 专门用来做[建筑升级面板里的升级信息]显示组装的(inst,effect)
		 * @param str
		 * @return 
		 * 
		 */		
		public static function getInstString(str:String):String
		{
			var des:String = str.split("\\n").join("\n");
			var mypattern:RegExp = /{|}/g;
			des = des.replace(mypattern," ");
			var des_arr:Array = des.split("：");
			if(des_arr.length>1)
			{
				des_arr[0] = des_arr[0]+"：";		
			}
			
			var des_str:String = getHtmlFromArray(des_arr,["#FFFFFF","#00FF00"]);
			return des_str
		}
		/**
		 * 获取固定最长的长度的文本字符 
		 * @param str	:原始字符	
		 * @param len	:最长长度
		 * @return 		:
		 * 
		 */		
		public static function getLimitLenString(str:String,len:int):String
		{
			var return_str:String = str;
			if(str.length>len)
			{
				return_str = str.slice(0,len-3)+"...";
			}
			return_str +="："
			return return_str;
		}
		/**
		 * 获取字符长度，中文以两长度算 
		 * @param str	:源字符
		 * @return		:长度
		 */		
		public static function getStringLen(str:String):int
		{			
			var len:int = str.length;
			var count:int = len;
			for(var i:int = 0;i<len; i++)
			{
				if(str.charCodeAt(i)>1000)
				{
					count ++;
				}
			}
			return count;
		}	
		public static function getSpace(num:Number):String
		{
			var space:String = "                                                    ";			
			if(num <0)
			{
				num = 0;
			}
			return space.slice(0,num);
		}
		/**
		 * 获取滤镜，什么都不添为默认 
		 * @param color		:unit
		 * @param alpha		:Number
		 * @param blurX		:Number
		 * @param blurY		:Number
		 * @param strength	:Number
		 * @return 
		 * 
		 */		
		public static function setGlowFilter(color:uint = 0x000000,alpha:Number = 1,blurX:Number = 3.0,blurY:Number = 3.0,strength:Number = 5):Array
		{
			return [new GlowFilter(color,alpha,blurX,blurY,strength)];	
		}
	}
}
