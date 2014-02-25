/**
 * @MetadataContainer.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-19
 */
package com.asframe.ref
{
	import com.asframe.lang.impl.Named;
	import com.asframe.utils.NamedUtils;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-2-19
	 */
	public class MetadataContainer extends Named implements IMetadataContainer
	{
		private var _metadatas:Array;
		
		public function MetadataContainer()
		{
		}
		
		public function set metadatas(_metadatas:Array):void
		{
			this._metadatas = _metadatas;
		}
		
		public function get metadatas():Array
		{
			return _metadatas;
		}
		/**
		 * 返回指定元数据标签名称的第一个元数据 
		 * @param metadataName
		 * @return 
		 * 
		 */		
		public function getMetadata(metadataName:String):Metadata
		{
			return NamedUtils.findIteam(metadatas,metadataName)
		}
		/**
		 * 返回指定元数据标签名称的全部元数据 
		 * @param metadataName
		 * @return 
		 * 
		 */		
		public function getMetadatas(metadataName:String):Array
		{
			return NamedUtils.findIteams(metadatas,metadataName);
		}
	}
}
