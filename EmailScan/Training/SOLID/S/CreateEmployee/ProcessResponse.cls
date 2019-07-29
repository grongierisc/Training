Class Training.SOLID.S.CreateEmployee.ProcessResponse Extends %RegisteredObject
{

Method Execute(objClient) As %Status
{
	Set tResponse = objClient.HttpResponse.Data.Read()
	Write !,tResponse
	
	Quit $$$OK
}

}
