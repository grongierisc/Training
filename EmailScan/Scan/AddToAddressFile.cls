/// 

Class Scan.AddToAddressFile Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

/// 
/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{

<process language='objectscript' request='Scan.AddAddressRequest' response='Ens.Response' height='2000' width='2000' >

<sequence xend='200' yend='350' >

<call name='Add to AddressFile' target='Scan.RecordMapFileOperation' async='1' xpos='200' ypos='250' >

<request type='Scan.AddressFileRequest' >

<assign property="callrequest.IsExternal" value="request.IsExternal" action="set" />

<assign property="callrequest.IsRelated" value="request.IsRelated" action="set" />

<assign property="callrequest.ToAddress" value="request.ToAddress" action="set" />

<assign property="callrequest.FileName" value="&quot;AddressFile.txt&quot;" action="set" />

</request>

<response type='Ens.Reponse' />

</call>

</sequence>

</process>
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
