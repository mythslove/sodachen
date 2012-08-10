package com.asframe.utils
{
	public class FormatTool
	{
		/**
		 * 获得XX时XX分XX秒格式的时间 
		 * @param time		:int 以秒为单位
		 * @return 			:string
		 * 
		 */		
		public  static function timeToHMS(time:int):String
		{
			var str:String = "";
			if(time<0)
			{
				time = 0;
			}
			var h :int = Math.floor(time/3600);
			var m :int = Math.floor(time%3600/60);
			var s :int = time%3600%60;
			str += h<10? "0"+h+" 时":h+" 时";
			str += m<10? "0"+m+" 分":m+" 分";
			str += s<10? "0"+s+" 秒":s+" 秒";
			return str;
		}
		/**
		 * 获取 年时间显示XX时XX分XX秒
		 * @param time	int
		 * @return 		00时00分00秒
		 * 
		 */		
		public  static function timeToHMS1(time:int):String
		{
			var str:String = "";
			if(time<0)
			{
				time = 0;
			}
			var h :int = Math.floor(time/3600);
			var m :int = Math.floor(time%3600/60);
			var s :int = time%3600%60;
			str += h<10? "0"+h+"时":h+"时";
			str += m<10? "0"+m+"分":m+"分";
			str += s<10? "0"+s+"秒":s+"秒";
			return str;
		}
		/**
		 * 获取 年时间显示XX:XX:XX
		 * @param time	Number
		 * @return 		00:00:00
		 * 
		 */		
		public  static function timeToHMS2(time:Number):String
		{
			var str:String = "";
			if(time<0)
			{
				time = 0;
			}
			var h :int = Math.floor(time/3600);
			var m :int = Math.floor(time%3600/60);
			var s :int = time%3600%60;
			str += h<10? "0"+h+":":h+":";
			str += m<10? "0"+m+":":m+":";
			str += s<10? "0"+s+"":s+"";
			return str;
		}
		public static function getYearTime(date:Date):String
		{
			var y:int = date.getFullYear();
			var m:int = date.getMonth()+1;					
			var d:int = date.getDate();			
			var h:int = date.getHours();
			var min:int = date.getMinutes();
			var s:int = date.getSeconds();	
			
			var mon:String = m<10?("0"+m):String(m);	
			var day:String = d<10?("0"+d):String(d);
			var hour:String = h<10?("0"+h):String(h);
			var min1:String = min<10?("0"+min):String(min);
			var sec	:String = s<10?("0"+s):String(s);
			return (y+"."+mon+"."+day+" "+hour+":"+min1+":"+sec);
		}
		/**
		 * 获取 年/月/日 +时间显示
		 * @param time		:Number
		 * @return 			:2010.10.10 10:10:10
		 * 
		 */		
		public static function getEmailTime(time:Number = 0):String
		{
			var date:Date = null;
			if(time == 0)
			{
				date = new Date();
			}
			else
			{
				date = new Date();
				date.time = time *1000;
			}
			return getYearTime(date);
		}
	}
}