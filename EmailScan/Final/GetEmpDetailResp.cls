Class Final.GetEmpDetailResp Extends Ens.Response [ ClassType = persistent ]
{

Property Salary As %Numeric;

Property SickDays As %Integer;

Storage Default
{
<Data name="GetEmpDetailRespDefaultData">
<Subscript>"GetEmpDetailResp"</Subscript>
<Value name="1">
<Value>Salary</Value>
</Value>
<Value name="2">
<Value>SickDays</Value>
</Value>
</Data>
<DefaultData>GetEmpDetailRespDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}

