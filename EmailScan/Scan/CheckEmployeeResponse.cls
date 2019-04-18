Class Scan.CheckEmployeeResponse Extends Ens.Response [ ClassType = persistent ]
{

Property IsRelated As %Boolean;

Property IsExternal As %Boolean;

Storage Default
{
<Data name="CheckEmployeeResponseDefaultData">
<Subscript>"CheckEmployeeResponse"</Subscript>
<Value name="1">
<Value>IsExternal</Value>
</Value>
<Value name="2">
<Value>IsRelated</Value>
</Value>
</Data>
<DefaultData>CheckEmployeeResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
