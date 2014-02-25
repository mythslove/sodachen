package com.asframe.utils
{
	import flash.utils.ByteArray;
	
	public class BitUtils
	{
		public function BitUtils()
		{
		}

		public static function shiftRight(src:ByteArray,bit:int):void {
			if (src.length==0) {
				return ;
			}
			
			var b:int = bit % 8;
			if (b ==0) {
				return ;
			}
			
			var mask:int = Math.pow(2,b) -1 ;
			
			var last:int = src[src.length-1];
			
			for (var i:int=0; i< src.length ; i++) {
//				var hight:int = (last & mask) << (8-b);
//				last = src[i];
//				src[i] = src[i] >> b | hight;
				src[i] = src[i] + 128;
			}
		}

		public static function shiftLeft(src:ByteArray,bit:int):void {
			if (src.length==0) {
				return ;
			}
			
			var b:int = bit % 8;
			if (b ==0) {
				return ;
			}
			
			var mask:int = (0xff << (8-b)) | 0xff;
			
			var last:int = src[0];
			
			for (var i:int=src.length-1; i>=0 ; i--) {
//				var hight:int = (last & mask) >> (8-b);
//				last = src[i];
//				src[i] = src[i] << b | hight;
				src[i] = src[i] - 128;
			}
		}


		public static function printByteArray(src:ByteArray):void {
			var str:String= "";
			for (var i:int=0; i< src.length ; i++) {
				str = str + " " + src[i]; 
			}
			trace(str);
		}

		public static function printByteArrayBin(src:ByteArray):void {
			var str:String= "";
			for (var i:int=0; i< src.length ; i++) {
				str = str + " " + int2binStr(src[i]); 
			}
			trace(str);
		}
		
		public static function int2binStr(b:int):String {
			var str:String = "";
			
			for (var i:int=0; i< 8; i++) {
				var t:int = (b>>i) & 1;
				str = t + str;
			}
			return str;		
		}
	}
}