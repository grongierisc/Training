Class Scan.MakeFileOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method EmailFile(pRequest As Scan.EmailFileRequest, Output pResponse As Ens.Response) As %Status
{

	//The out string will hold the entry for the file.
	//Each piece of data is on a separate line.
	set info=pRequest.Contents
	set out= "The following email was sent on "_$ZDATETIME($HOROLOG)_$c(13,10)  
	set out=out_info.Name_$c(13,10)
	set out=out_info.ID_$c(13,10)
	set out=out_info.ToAddress_$c(13,10)
	set out=out_info.EmailText_$c(13,10)
	
	set tSC=..Adapter.PutString(pRequest.FileName,out)
	
	Quit $$$OK
}

Method AddressFile(pRequest As Scan.AddressFileRequest, Output pResponse As Ens.Response) As %Status
{

	set out = $ZDATETIME($H)_" " 
	set out = out_pRequest.ToAddress_" "
	set out = out_pRequest.IsRelated_" "
	set out = out_pRequest.IsExternal_$c(13,10)
	
	set tSC = ..Adapter.PutString(pRequest.FileName,out)
	
	Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Scan.EmailFileRequest"> 
		<Method>EmailFile</Method>
	</MapItem>
		<MapItem MessageType="Scan.AddressFileRequest"> 
		<Method>AddressFile</Method>
	</MapItem>
</MapItems>
}

}
