Class Training.SOLID.S.CreateEmployee.EntryPoint1 Extends %RegisteredObject
{

Method Execute(pName As %String, pSalary As %String, pAge As %String) As %Status
{
	//Build Request
	Set tJSON = ##Class(Training.SOLID.S.CreateEmployee.RequestBuilder).%New().Build(pName,pSalary,pAge)
	
	//Client
	Set tHttpRequest = ##class(%Net.HttpRequest).%New()
	Set tSC = ##Class(Training.SOLID.S.CreateEmployee.Client).%New().Execute(tJSON, .tHttpRequest)
	
	//Process Error and Response
	if '(##Class(Training.SOLID.S.CreateEmployee.ProcessError).%New().IsError(tSC))
	{
		Do ##Class(Training.SOLID.S.CreateEmployee.ProcessResponse).%New().Execute(tHttpRequest.HttpResponse)
	}
	QUIT $$$OK
}

}
