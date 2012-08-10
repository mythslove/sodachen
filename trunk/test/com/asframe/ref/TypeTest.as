package com.asframe.ref
{
	import com.asframe.utils.RefUtils;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.asserts.assertTrue;
	
	public class TypeTest
	{
		public static var staticValue:int = 10;
		
		public var value:int = 100;
		public var type:Type;
		
		private var _test:String;
		
		public function set test(_test:String):void
		{
			this._test = _test;
		}
		public function get test():String
		{
			return this._test;
		}
		
		[Before]
		public function setUp():void
		{
			type = Type.forClass(TypeTest);
		}
		
		[Test]
		public function testForClass():void
		{
			type = Type.forClass(TypeTest);
			assertTrue(type.name == "TypeTest");
		}
		
		[Test]
		public function testForName():void
		{
			var type1:Type = Type.forName("com.asframe.ref.TypeTest");
			assertTrue(type.name == type1.name);
		}
		
		[Test]
		public function testGetAccessor():void
		{
			var accessor:Accessor = type.getAccessor("test");
			assertTrue(accessor.access == RefConts.READ_WRITE);
			assertTrue(accessor.name == "test");
		}
		
		[Test]
		public function testGetMethod():void
		{
			var method:Method = type.getMethod("testGetMethod");
			assertTrue(method.name == "testGetMethod");
			var metadata:Metadata = method.getMetadata("Test");
			assertTrue(metadata.name == "Test");
		}
		
		[Test]
		public function testGetVariable():void
		{
			var variable:Variable = type.getVariable("type");
			assertTrue(variable.name == "type");
			variable = type.getVariable("staticValue");
			assertTrue(variable.getValue() == 10);
			variable = type.getVariable("value");
			assertTrue(variable.getValue(this) == 100);
		}
	}
}