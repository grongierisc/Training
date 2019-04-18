Class Scan.EmailFileRequest Extends Ens.Request [ ClassType = persistent, Language = cache ]
{

Property Contents As Scan.CheckEmployeeRequest;

Property FileName As %String;

Storage Default
{
<Data name="EmailFileRequestDefaultData">
<Subscript>"EmailFileRequest"</Subscript>
<Value name="1">
<Value>Contents</Value>
</Value>
<Value name="2">
<Value>FileName</Value>
</Value>
</Data>
<DefaultData>EmailFileRequestDefaultData</DefaultData>
<Type>%Library.CacheStorage</Type>
}

}
