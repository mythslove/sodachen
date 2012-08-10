/**
 * @ResMetadataTest.as
 * 
 * @author sodaChen mail:asframe@163.com
 * @version 1.0
 * <br>Copyright (C), 2012 ASFrame.com
 * <br>This program is protected by copyright laws.
 * <br>Program Name:ASFrame ASFrame
 * <br>Date:2012-7-5
 */
package
{
	import com.asframe.metadata.res.AutoLoadRes;
	import com.asframe.metadata.res.ResMetadata;
	
	import flash.display.Sprite;
	
	/**
	 * 测试资源标签
	 * @author sodaChen
	 * @Date:2012-7-5
	 */
	public class ResMetadataTest extends Sprite
	{
		private var res:AutoLoadRes;
		public function ResMetadataTest()
		{
			super();
			res = new AutoLoadRes();
			ResMetadata.parseResMetadata(res);
		}
	}
}
