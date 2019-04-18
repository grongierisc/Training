Class Final.SalaryAdjResp Extends Ens.Response [ ClassType = persistent ]
{

Property Success As %Boolean;

Property NewSalary As %Numeric;

Storage Default
{
<Data name="SalaryAdjRespDefaultData">
<Subscript>"SalaryAdjResp"</Subscript>
<Value name="1">
<Value>Success</Value>
</Value>
<Value name="2">
<Value>NewSalary</Value>
</Value>
</Data>
<DefaultData>SalaryAdjRespDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}

