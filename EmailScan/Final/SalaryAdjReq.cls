/// 
Class Final.SalaryAdjReq Extends Ens.Request [ ClassType = persistent ]
{

Property ID As %Integer;

Property Percentage As %Numeric;

Storage Default
{
<Data name="SalaryAdjReqDefaultData">
<Subscript>"SalaryAdjReq"</Subscript>
<Value name="1">
<Value>ID</Value>
</Value>
<Value name="2">
<Value>Percentage</Value>
</Value>
</Data>
<DefaultData>SalaryAdjReqDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}

