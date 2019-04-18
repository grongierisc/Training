Class Scan.ScanCSPRequestService Extends Ens.BusinessService
{

Method OnProcessInput(pCSPRequest As %CSP.Request, pOutput As Ens.StringContainer) As %Status
{
	//Send the email to the DetermineBlackList Business Process if the email text
	//contains the product name; otherwise, send it to the MakeFileOperation Business Operation to put in 
	//a file for safe emails.
	
	//Create CheckEmployeeRequest. This request is used for either call.
		//Note: Using .Data("x",1) is quicker than .Get("x")to retrieve the data,
		//but this will use the simpler Get().
	Set $ZT="Trap",tSC=$$$OK
	do {
		Set tRequest = ##class(Scan.CheckEmployeeRequest).%New()
		Set tRequest.Name = pCSPRequest.Get("Name")
		Set tRequest.ID = pCSPRequest.Get("ID")
		Set tRequest.ToAddress = pCSPRequest.Get("ToAddress")
		Set tRequest.EmailText = pCSPRequest.Get("EmailText")
				
		//Check for the product name "gizmo" in the email.	
	IF $FIND(tRequest.EmailText,"gizmo") { 
		//The email contains the product name, 
		//so send it to the DetermineBlackList Business Process for further checking.
		Set tSC = ..SendRequestAsync("Scan.DetermineBlackList",tRequest)
	}
	ELSE {
		//No product name was found, so send the email to the MakeFileOperation Business Operation
		//to write it to SafeEmail.txt.
		Set tEmailFileRequest = ##class(Scan.EmailFileRequest).%New()
		Set tEmailFileRequest.FileName = "SafeEmail.txt"
		Set tEmailFileRequest.Contents = tRequest
		Set tSC = ..SendRequestAsync("Scan.MakeFileOperation",tEmailFileRequest)
	}
		
		
		Quit
	} while (0)
Exit
	Quit tSC
Trap
	Set $ZT="",tSC=$$$EnsSystemError
	Goto Exit
}

}
