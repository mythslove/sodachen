package com.asframe.config.xml
{
	import com.asframe.config.ConfigBean;
	import com.asframe.config.xml.XMLAndObj;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertEquals;
	
	public class XMLAndObjTest
	{
//		 private var xml:XML = <xmlConfig type="com.asframe.config.ConfigBean">
//	<att name="name"  value="sodaChen" />
//	<att name="count" value="100" />
//	<att name="color" value="58647" />
//	<att name="number" value="10.56" />
//	<att name="bool" value="true" />
//	<att name="ary">
//		<att type="String"  value="sodaChen1" />
//		<att type="int" value="1001" />
//		<att type="uint" value="586471" />
//		<att type="Number" value="10.561" />
//		<att name="bool" value="false" type="Boolean"/>
//	</att>
//	<att name="configBean">
//		<att name="name"  value="sodaChen2" />
//		<att name="count" value="1002" />
//		<att name="color" value="586472" />
//		<att name="number" value="10.562" />
//		<att name="bool" value="true" />
//	</att>
//</xmlConfig>;
		private var xml:XML = <xmlConfig type="com.asframe.config.ConfigBean">
			<name  value="sodaChen" />
			<count value="100" />
			<color value="58647" />
			<number value="10.56" />
			<bool value="true" />
			<ary>
				<ary type="String"  value="sodaChen1" />
				<ary type="int" value="1001" />
				<ary type="uint" value="586471" />
				<ary type="Number" value="10.561" />
				<ary value="false" type="Boolean"/>
				<ary type="class" value="com.asframe.config.ConfigBean">
					<name  value="sodaChen2" />
					<count value="1002" />
					<color value="586472" />
					<number value="10.562" />
					<bool value="true" />
				</ary>
			</ary>
			<configs>
				<configBean>
					<name  value="sodaChen2" />
					<count value="1002" />
					<color value="586472" />
					<number value="10.562" />
					<bool value="true" />
				</configBean>
				<configBean>
					<name  value="sodaChen2" />
					<count value="1002" />
					<color value="586472" />
					<number value="10.562" />
					<bool value="true" />
				</configBean>
			</configs>
			<configBean>
				<name  value="sodaChen2" />
				<count value="1002" />
				<color value="586472" />
				<number value="10.562" />
				<bool value="true" />
			</configBean>
		</xmlConfig>;
			 
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
			var xmlAndObj:XMLAndObj = new XMLAndObj();
			var configBean:ConfigBean = xmlAndObj.configToObj(xml.toString());
			assertEquals(configBean.name,"sodaChen");
			assertEquals(configBean.count,100);
			assertEquals(configBean.color,58647);
			assertEquals(configBean.bool,true);
			
			var ary:Array = configBean.ary;
			assertEquals(ary[0],"sodaChen1");
			assertEquals(ary[1],1001);
			assertEquals(ary[2],586471);
			assertEquals(ary[3],10.561);
			assertEquals(ary[4],false);
			
			
			
			
			configBean = configBean.configBean;
			assertEquals(configBean.name,"sodaChen2");
			assertEquals(configBean.count,1002);
			assertEquals(configBean.color,586472);
			assertEquals(configBean.bool,true);
		}
		
		[Test]
		public function testObjToConfig():void
		{
//			Assert.fail("Test method Not yet implemented");
		}
	}
}