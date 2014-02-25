package com.asframe.net.bean
{
	/**
	 * MoreFileLoader类加载文件时需要的类，利用该类存储加载文件的各种数据
	 * 
	 * 详见如下:
	 * @see org.sujun.net.MoreFileLoader
	 */ 
	public class FileLoadBean
	{
		private var path		:String;		//文件路径
		private var name		:String;		//文件名称
		private var type		:int;			//文件类型
		private var result		:Function;		//接受结果函数
		/**
		 * 设置加载文件的路径
		 * @param path:路径字符串
		 */  
		public function setPath(path:String):void
		{
			this.path = path;
		}
		/**
		 * 获取加载文件的路径
		 * return 路径字符串
		 */ 
		public function getPath():String
		{
			return this.path;
		}
		/**
		 * 设置加载文件的名称
		 * @param name:路径字符串
		 */  
		public function setName(name:String):void
		{
			this.name = name;
		}
		/**
		 * 获取加载文件的名称
		 * return 名称字符串
		 */
		public function getName():String
		{
			return this.name;
		}
		/**
		 * 设置加载文件的类型
		 * @param type:类型值
		 */
		public function setType(type:int):void
		{
			this.type = type;
		}
		/**
		 * 获取加载文件的类型值
		 * return int值
		 */
		public function getType():int
		{
			return this.type;
		}
		/**
		 * 设置接受加载文件结果的函数
		 * @param path:函数对象
		 */
		public function setResult(result:Function):void
		{
			this.result = result;
		}
		/**
		 * 获取接受加载文件结果的函数
		 * return 函数对象
		 */
		public function getResult():Function
		{
			return this.result;
		}
	}
}
