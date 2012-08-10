package com.asframe.config.property
{
	import com.asframe.config.ConfigBean;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertEquals;
	import com.asframe.config.properties.PropertiesAndObj;
	
	public class PropertyAndObjTest
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
			property += "name = sodaChen    \r\n";
			property += "count =    	100    \r\n"
			property += " color = 58647    \r\n";
			property += "number = 10.57    \r\n";
			property += "   bool = true   \r\n";
			
			var propertyParse:PropertiesAndObj = new PropertiesAndObj();
			var configBean:ConfigBean = propertyParse.configToObj(property);
			assertEquals(configBean.name,"sodaChen");
			assertEquals(configBean.count,100);
			assertEquals(configBean.color,58647);
			assertEquals(configBean.number,10.57);
			assertEquals(configBean.bool,true);
		}
		
		[Test]
		public function testObjToConfig():void
		{
		}
	}
}