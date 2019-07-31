Class Training.Message Extends Ens.Request
{

Property jsonObject As %DynamicObject(XMLPROJECTION = "NONE");

Property json As %String [ Calculated ];

Method jsonGet()
{
    quit ..jsonObject.%ToJSON()
}

Method %DispatchGetProperty(property As %String) As %ObjectHandle
{
    quit $property(..jsonObject,property)
}

Method %DispatchSetProperty(value As %String)
{
	set $property(..jsonObject,property) = value
	quit
}

Storage Default
{
<Data name="MessageDefaultData">
<Subscript>"Message"</Subscript>
<Value name="1">
<Value>Json</Value>
</Value>
</Data>
<Data name="jsonObject">
<Attribute>jsonObject</Attribute>
<Structure>node</Structure>
<Subscript>"Training.Message.jsonObject"</Subscript>
</Data>
<DefaultData>MessageDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
