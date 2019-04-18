/// 
Class Scan.AddAddressRequest Extends Ens.Request [ ClassType = persistent, Language = cache ]
{

Property IsExternal As %Boolean;

Property IsRelated As %Boolean;

Property ToAddress As %String;

Storage Default
{
<Data name="AddAddressRequestDefaultData">
<Subscript>"AddAddressRequest"</Subscript>
<Value name="1">
<Value>IsExternal</Value>
</Value>
<Value name="2">
<Value>IsRelated</Value>
</Value>
<Value name="3">
<Value>ToAddress</Value>
</Value>
</Data>
<DefaultData>AddAddressRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
