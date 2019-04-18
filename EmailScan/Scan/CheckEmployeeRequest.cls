Class Scan.CheckEmployeeRequest Extends Ens.Request [ ClassType = persistent, Language = cache ]
{

Property Name As %String;

Property ID As %Integer;

Property ToAddress As %String;

Property EmailText As %String;

Storage Default
{
<Data name="CheckEmployeeRequestDefaultData">
<Subscript>"CheckEmployeeRequest"</Subscript>
<Value name="1">
<Value>EmailText</Value>
</Value>
<Value name="2">
<Value>ID</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>ToAddress</Value>
</Value>
</Data>
<DefaultData>CheckEmployeeRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
