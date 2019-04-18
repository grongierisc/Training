/// 
Class Scan.ValidateToAddressResponse Extends Ens.Response [ ClassType = persistent ]
{

Property IsExternal As %Boolean;

Storage Default
{
<Data name="ValidateToAddressResponseDefaultData">
<Subscript>"ValidateToAddressResponse"</Subscript>
<Value name="1">
<Value>IsExternal</Value>
</Value>
</Data>
<DefaultData>ValidateToAddressResponseDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
