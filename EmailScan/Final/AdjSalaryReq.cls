/// 
Class Final.AdjSalaryReq Extends Ens.Request [ ClassType = persistent ]
{

Property AdjSalary As %Numeric;

Property ID As %Integer;

Storage Default
{
<Data name="AdjSalaryReqDefaultData">
<Subscript>"AdjSalaryReq"</Subscript>
<Value name="1">
<Value>AdjSalary</Value>
</Value>
<Value name="2">
<Value>ID</Value>
</Value>
</Data>
<DefaultData>AdjSalaryReqDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}

