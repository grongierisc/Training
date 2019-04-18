/// RECORDMAP: Generated from RecordMap 'Scan.AddressFileRecordMap'
/// on 2019-04-18 at 14:47:08.466 [2019-04-18 13:47:08.466 UTC]
/// by user UnknownUser
Class Scan.AddressFileRequest Extends (%Persistent, %XML.Adaptor, Ens.Request, EnsLib.RecordMap.Base) [ Inheritance = right, ProcedureBlock ]
{

Parameter INCLUDETOPFIELDS = 1;

Property ToAddress As %String;

Property IsRelated As %Boolean;

Property IsExternal As %Boolean;

Property FileName As %String;

Parameter RECORDMAPGENERATED = 1;

Storage Default
{
<Data name="AddressFileRequestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ToAddress</Value>
</Value>
<Value name="3">
<Value>%Source</Value>
</Value>
<Value name="4">
<Value>IsExternal</Value>
</Value>
<Value name="5">
<Value>FileName</Value>
</Value>
<Value name="6">
<Value>IsRelated</Value>
</Value>
</Data>
<DataLocation>^Scan.AddressFileRequestD</DataLocation>
<DefaultData>AddressFileRequestDefaultData</DefaultData>
<ExtentSize>2000000</ExtentSize>
<IdLocation>^Scan.AddressFileRequestD</IdLocation>
<IndexLocation>^Scan.AddressFileRequestI</IndexLocation>
<StreamLocation>^Scan.AddressFileRequestS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
