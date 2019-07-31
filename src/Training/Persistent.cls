Class Training.Persistent Extends %Persistent
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
<Data name="PersistentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<Data name="jsonObject">
<Attribute>jsonObject</Attribute>
<Structure>node</Structure>
<Subscript>"jsonObject"</Subscript>
</Data>
<DataLocation>^Training.PersistentD</DataLocation>
<DefaultData>PersistentDefaultData</DefaultData>
<IdLocation>^Training.PersistentD</IdLocation>
<IndexLocation>^Training.PersistentI</IndexLocation>
<StreamLocation>^Training.PersistentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
