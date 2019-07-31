Class Training.SOLID.Library.TestRequestWriter Extends %UnitTest.TestCase
{

Method TestMultipleKeyValue()
{
	Set objJSONWriter = ##Class(Training.SOLID.Library.RequestWriter).%New()
	
	Do objJSONWriter.Add("Key1","Value1")
	Do objJSONWriter.Add("Key2","Value2")
	Do objJSONWriter.Add("Key3","Value3")
	
	Set tJSON = objJSONWriter.GetRequestString()
	
 	do $$$AssertEquals(tJSON,"{ ""Key1"":""Value1"" ,  ""Key2"":""Value2"" ,  ""Key3"":""Value3"" }", "JSON - "_tJSON)
}

Method TestBlankKey()
{
	Set objJSONWriter = ##Class(Training.SOLID.Library.RequestWriter).%New()
	
	Do objJSONWriter.Add("Key1","Value1")
	Do objJSONWriter.Add("","Value2")
	
	Set tJSON = objJSONWriter.GetRequestString()
	
 	do $$$AssertEquals(tJSON,"{ ""Key1"":""Value1"" }", "JSON - "_tJSON)
}

Method TestNullValueAllowNull()
{
	Set objJSONWriter = ##Class(Training.SOLID.Library.RequestWriter).%New()
	
	Do objJSONWriter.Add("Key1","Value1")
	Do objJSONWriter.Add("Key2")
	
	Set tJSON = objJSONWriter.GetRequestString()
	
 	do $$$AssertEquals(tJSON,"{ ""Key1"":""Value1"" ,  ""Key2"":"""" }", "JSON - "_tJSON)
}

Method TestNullValueDoNotAllowNull()
{
	Set objJSONWriter = ##Class(Training.SOLID.Library.RequestWriter).%New()
	
	Do objJSONWriter.Add("Key1","Value1",0)
	Do objJSONWriter.Add("Key2",,0)
	Do objJSONWriter.Add("Key3",,0)
	
	Set tJSON = objJSONWriter.GetRequestString()
	
 	do $$$AssertEquals(tJSON,"{ ""Key1"":""Value1"" }", "JSON - "_tJSON)
}

}
