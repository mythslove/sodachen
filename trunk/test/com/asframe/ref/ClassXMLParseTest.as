package com.asframe.ref
{
	import flash.system.ApplicationDomain;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.Assert;
	import org.flexunit.asserts.assertTrue;
	
	public class ClassXMLParseTest
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
		public function testGetType():void
		{
			var classParse:ClassXMLParse = new ClassXMLParse();
			var type:Type = classParse.getType(ClassInfo,ApplicationDomain.currentDomain);
			assertTrue(type != null);
			assertTrue(type.name == "ClassInfo");
		}
	}
	
}
import com.asframe.ref.Metadata;
class ClassInfo
{
	[Name(value="soda")]
	public var name:String;
	public var age:int;
	
	private var _accessor:String;
	public function ClassInfo(age:int)
	{
		this.age = age;
	}
	public function set accessor(_accessor:String):void
	{
		this._accessor = _accessor;
	}
	public function get accessor():String
	{
		return _accessor;
	}
	[METADATA]
	public function metadata():Metadata
	{
		return null;
	}
}