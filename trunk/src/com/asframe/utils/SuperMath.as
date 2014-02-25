//***************************************************************************************
/*
*
本类：静态类

本类发送事件：


公开接口：
//将获得由startIndex到endIndex打乱的数组,并返回该数组
GetRandomArr(startIndex:Number,endIndex:Number):Array
//返回将数组打乱
RandomArr(arr:Array):Array
 //将数组中的元素唯一化，并返回该数组
 GetUniqueArr(arr:Array):Array
 //返回随机获取一个的正负1
 GetInteger():Number
 //返回数组中找到最大或最小值
  GetMinOrMax(arr:Array,str:String):Number
*
*/
//***************************************************************************************
package com.asframe.utils
{
	public class SuperMath {
		//将获得由startIndex到endIndex打乱的数组,并返回该数组
		static public function GetRandomArr(startIndex:Number,endIndex:Number):Array {
			var arr:Array=[];
			for (var i:int=startIndex; i <=endIndex; i++) {
				arr.push(i);
			}
			var random_arr:Array=RandomArr(arr);//将数组打乱
			return random_arr;
		}
		//返回将数组打乱
		static public function RandomArr(arr:Array):Array {
			var random_arr:Array=new Array;
			for (var j:int=arr.length-1; j>=0; j--) {
				var num:int=arr.length-1;
				var temp:int=Math.round(Math.random()*num);
				random_arr.push(arr.splice(temp,1));
			}
			return random_arr;
		}
		//将数组中的元素唯一化，并返回该数组
		static public function GetUniqueArr(arr:Array):Array {
			var tempArr:Array=new Array();
			if (arr.length==0) {
				return tempArr;
			}
			tempArr.push(arr[0]);
			for (var i:int=1; i<arr.length; i++) {
				var temp:int=arr[i];
				var bln:Boolean=false;
				Jfor:for (var j:int=0; j<tempArr.length; j++) {
					if (temp==tempArr[j]) {
						bln=false;
						break Jfor;
					} else {
						bln=true;
					}
				}


				if (bln) {
					tempArr.push(temp);
				}
			}
			return tempArr;
		}
		//返回随机获取一个的正负1
		static public function GetInteger():Number {
			if (Math.random() > .5) {
				return 1;
			} else {
				return -1;
			}
		}
		//返回随机数值;
		static public function GetRandomNum():Number{
			var t:Date=new Date();
			var randomStr:String=String(t.getFullYear()) + (t.getMonth() + 1) + t.getDate() + t.getHours() + t.getMinutes() + t.getSeconds();
			var randomNum:int=Number(randomStr);
			randomNum = Math.abs(Math.random() * randomNum);
			return randomNum
		}
		//返回保留小数点num表示数值。len表示所要保留的小数位;
		static public function getPointNumber(num:Number,len:int):Number {
			var lenNum:int=Math.pow(10,len);
			var randomNum:Number = Math.round(num*lenNum)/lenNum;
			return randomNum;
		}
		public static function randRange(min:Number, max:Number):Number {
			var randomNum:Number = Math.floor(Math.random() * (max - min + 1)) + min;
			return randomNum;
		}
		//返回数组中找到最大或最小值
		static public function GetMinOrMax(arr:Array,str:String):Number {
			var total:int=arr.length-1;
			var endVal:int=arr[total];
			var startVal:int=arr[0];
			var val:int=0;
			for (var i:int=total,j:int=0; i>=0; j++,i--) {
				switch (str) {
					case "MIN" :
						if (endVal>arr[i]) {
							endVal=arr[i];
						}
						if (startVal>arr[j]) {
							startVal=arr[j];
						}
						if (startVal>endVal) {
							val=endVal;
						} else {
							val=startVal;
						}
						break;
					case "MAX" :
						if (endVal<arr[i]) {
							endVal=arr[i];
						}
						if (startVal<arr[j]) {
							startVal=arr[j];
						}
						if (startVal<endVal) {
							val=endVal;
						} else {
							val=startVal;
						}
						break;
				}
				if (j==i) {
					//return val;
					break;
				}
			}
			return val;
		}
		static public function checkTelephone(phone:String):Boolean
		{
			var pattern:RegExp=/^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-{0,1})?[1-9]\d{6,7}(\-\d{1,4})?$|^0{0,1}1[0-9]{10}$/;
			return pattern.test(phone);
		}
		static public function isEmail(str:String):Boolean 
		{
		   var reg:RegExp =/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		   return reg.test(str);
		}
	}
	
}