/**
 * @IMetadataContainer.as
 * 
 * @author sodaChen mail:asframe#163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame
 * <br>Date:2012-2-18
 */
package com.asframe.ref
{
	import com.asframe.lang.INamed;

	/**
	 *
	 * @author sodaChen
	 * Date:2012-2-18
	 */
	public interface IMetadataContainer extends INamed
	{
		/**
		 * 设置一个标签的数组  
		 * @param _metadatas
		 * 
		 */		
		function set metadatas(_metadatas:Array):void;
		function get metadatas():Array;
		/**
		 * 获取到一个元数据的信息 
		 * @param metadataName
		 * @return 
		 * 
		 */		
		function getMetadata(metadataName:String):Metadata;
	}
}
