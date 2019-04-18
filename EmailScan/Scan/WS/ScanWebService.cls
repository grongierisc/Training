Class Scan.WS.ScanWebService Extends EnsLib.SOAP.Service
{

Method ScanEmail(Name As %String, ID As %Integer, ToAddress As %String, EmailText As %String) As %Status [ WebMethod ]
{
		set tRequest = ##class(Scan.CheckEmployeeRequest).%New()
		set tRequest.Name = Name
		set tRequest.ID = ID
		set tRequest.ToAddress = ToAddress
		set tRequest.EmailText = EmailText
		Set tSC = ..ProcessInput(tRequest,.tResponse)
		if $$$ISERR(tSC) do ..ReturnMethodStatusFault(tSC)
	
		Quit $$$OK
}

Method OnProcessInput(pRequest As Scan.CheckEmployeeRequest, Output pResponse As %RegisteredObject) As %Status
{
		If $FIND($ZConvert(pRequest.EmailText,"U"),"GIZMO") { 
			Set tSC = ..SendRequestAsync("Scan.DetermineBlackList",pRequest)
		} 
		ELSE {
			Set tEmailFileRequest = ##class(Scan.EmailFileRequest).%New()
			Set tEmailFileRequest.FileName = "SafeEmail.txt"
			Set tEmailFileRequest.Contents = pRequest
			Set tSC = ..SendRequestAsync("Scan.MakeFileOperation",tEmailFileRequest)
		}
			

		Quit $$$OK
}

/// The SOAP name of this service.
/// Override this parameter in the subclass.
Parameter SERVICENAME = "ScanWebService";

}
