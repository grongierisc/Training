Class Scan.RESTService Extends Ens.BusinessService
{

Method OnProcessInput(pInput As Ens.StringContainer, Output pOutput As %RegisteredObject) As %Status
{
	
	set tSC = $$$OK
	try {
		set tRequest = ##class(Scan.CheckRelationRequest).%New()
		
		set tRequest.ID = pInput.StringValue
		
		set tSC = ..SendRequestSync("Scan.GetEmployeeDetails", tRequest, .tResponse)
		
		$$$ThrowOnError(tSC)
		
		#Dim tResponse as Scan.CheckRelationResponse
		
		//Create Dynamic Object to be returned
		set pOutput = {}
	    set pOutput.Related = tResponse.IsRelated
	}
	catch ex {
		set tSC = ex.AsStatus()
	}
	return tSC
}

}
