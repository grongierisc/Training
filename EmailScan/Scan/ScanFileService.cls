Class Scan.ScanFileService Extends Ens.BusinessService
{

/// Name of the adapter class
Parameter ADAPTER = "EnsLib.File.InboundAdapter";

Method OnProcessInput(pInput As %Stream.Object, pOutput As %RegisteredObject) As %Status
{

		// The first line is 'Name:ID:ToAddress:EmailText'
		// Read the first line.
		Set tLine=pInput.ReadLine()
		// Create the request to send to DetermineBlackList
		Set tRequest = ##class(Scan.CheckEmployeeRequest).%New()
		Set tRequest.Name=$p(tLine,":",1)
		Set tRequest.ID=$p(tLine,":",2)
		Set tRequest.ToAddress=$p(tLine,":",3)
		Set tRequest.EmailText=$p(tLine,":",4)
			
		//Check email text for code word
		//if there, send async request to DetermineBlackList
		if $FIND(tRequest.EmailText, "gizmo") {
			set tSC = ..SendRequestAsync("Scan.DetermineBlackList",tRequest)
		}
	
		//if not there, send async request to MakeFileOperation
		ELSE {
			set tEmailFileRequest = ##class(Scan.EmailFileRequest).%New()
		set tEmailFileRequest.FileName = "SafeEmail.txt"
		set tEmailFileRequest.Contents = tRequest
		set tSC = ..SendRequestAsync("Scan.MakeFileOperation",tEmailFileRequest)
		}

		Quit $$$OK
}

}
