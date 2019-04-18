Class Scan.ValidateToAddressRequest Extends Ens.Request [ ClassType = persistent ]
{

Property ToAddress As %String;

Storage Default
{
<Data name="ValidateToAddressRequestDefaultData">
<Subscript>"ValidateToAddressRequest"</Subscript>
<Value name="1">
<Value>ToAddress</Value>
</Value>
</Data>
<DefaultData>ValidateToAddressRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
