package com.asframe.config.csv
{
	import com.asframe.config.ConfigBean;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertEquals;
	
	public class CSVAndObjTest
	{		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testConfigToObj():void
		{
			var property:String = "type:com.asframe.config.ConfigBean\r\n";
			property += "  name,count,color,number,bool   \r\n";
			property += "sodaChen,100 ,58647, 10.57, true \r\n";
			property += "sodaChen1,1001 ,586471, 10.571, true \r\n";
			property += "sodaChen2,1002 ,586472, 10.572, false \r\n";
			var csvParse:CSVAndObj = new CSVAndObj();
			var results:Array = csvParse.configToObj(property);
			
			var configBean:ConfigBean = results[0];
			assertEquals(configBean.name,"sodaChen");
			assertEquals(configBean.count,100);
			assertEquals(configBean.color,58647);
			assertEquals(configBean.number,10.57);
			assertEquals(configBean.bool,true);
			
			configBean = results[1];
			assertEquals(configBean.name,"sodaChen1");
			assertEquals(configBean.count,1001);
			assertEquals(configBean.color,586471);
			assertEquals(configBean.number,10.571);
			assertEquals(configBean.bool,true);
			
			configBean = results[2];
			assertEquals(configBean.name,"sodaChen2");
			assertEquals(configBean.count,1002);
			assertEquals(configBean.color,586472);
			assertEquals(configBean.number,10.572);
			assertEquals(configBean.bool,false);
		}
		
		[Test]
		public function testObjToConfig():void
		{
			
		}
	}
}