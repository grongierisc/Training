Class Scan.REST Extends %CSP.REST
{

Parameter CHARSET = "utf-8";

/// This parameter controls the CSP session support. By default the CSP session will be
/// ended after each request in accordance with the spirit of REST. However this CAN be
/// overridden by the user. To use a session, it's necessary to manage the CSPSESSION cookie.
/// Browsers do this automatically but command line tools such as CURL require the setting of
/// options.<p>
/// Note that if you choose to use a session then this will use a CSP license until the session
/// is ended or expires and the grace period has been satisfied. If you use the default of no
/// session then this will be the same behavior as SOAP requests of holding a license for ten
/// seconds.
Parameter UseSession As %Integer = 1;

Parameter HandleCorsRequest As %Integer = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
	<Route Url="/checkrelation/:EmployeeID" Method="GET" Call="GetEmployeeInfo" Cors="true" />
</Routes>
}

ClassMethod GetEmployeeInfo(EmployeeID As %Integer) As %Status
{
	set tSC = $$$OK
	try {
		//Instantiate business service
		set tSC = ##class(Ens.Director).CreateBusinessService("Scan.RESTService",.tService)
		
		$$$ThrowOnError(tSC)
		
		//Pass along input from url to ProcessInput.
		set request = ##class(Ens.StringContainer).%New()
		set request.StringValue = EmployeeID
		set tSC = tService.ProcessInput(request, .output)
		
		$$$ThrowOnError(tSC)
		
		do %response.SetHeader("ContentType", "application/json")
	    
	    #Dim output As %Library.DynamicObject
	    
	    //Convert dynamic object to JSON and write to response object
	    write output.%ToJSON()
	}
	catch ex {
		set tSC = ex.AsStatus()
	}
	return tSC
}

/// This method Gets called prior to dispatch of the request. Put any common code here
/// that you want to be executed for EVERY request. If pContinue is set to 0, the
/// request will NOT be dispatched according to the UrlMap. If this case it's the
/// responsibility of the user to return a response.
ClassMethod OnPreDispatch(pUrl As %String, pMethod As %String, ByRef pContinue As %Boolean) As %Status
{
	set status = $$$OK
	
	try {
		#; MUST unlock the session
        Do %session.Unlock()
        If ('..AcceptsContentType("application/json")) {
	        	set pContinue = 0
            } else {
             	#; We always return json
             	Set %response.ContentType="application/json"
             	set pContinue = 1
            }
	} catch(ex) {
		set status = ex.AsStatus()
	}
    Quit status
}

/// Sets the response's localization domain (something that %CSP.REST should do, in theory) and then invokes default super class behavior
ClassMethod Page(skipheader As %Boolean = 1) As %Status [ ProcedureBlock = 0 ]
{
    #dim %response As %CSP.Response
    Set %response.Domain = "Demo"
    Quit ##super(skipheader)
}

}
