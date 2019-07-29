Class Training.SOLID.S.CreateEmployee.Client Extends %RegisteredObject
{

Method Execute(pJSON, ByRef pHttpRequest) As %Status
{
	Set tURL = "http://dummy.restapiexample.com/api/v1/create"
	do pHttpRequest.EntityBody.Write(pJSON)
	Set tSC = pHttpRequest.Send("POST",tURL)
	Quit tSC
}

}
