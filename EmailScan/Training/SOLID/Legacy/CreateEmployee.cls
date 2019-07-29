Class Training.SOLID.Legacy.CreateEmployee Extends %RegisteredObject
{

ClassMethod Execute(pName As %String, pSalary As %String, pAge As %String) As %Status
{
	//Request Object
	Set tJSON = "{"
	if $Data(pName) 
	{
		Set tJSON=tJSON_"""name"":"""_pName_""""
	}
	if $Data(pSalary) 
	{
		if tJSON = "{"
		{
			Set tJSON=tJSON_"""salary"":"""_pSalary_""""
		}
		else
		{
			Set tJSON=tJSON_", ""salary"":"""_pSalary_""""
		}
	} 
	
	if $Data(pAge) 
	{
		if tJSON = "{"
		{
			Set tJSON=tJSON_"""age"":"""_pAge_""""
		}
		else
		{
			Set tJSON=tJSON_", ""age"":"""_pAge_""""
		}
	} 
	Set tJSON = tJSON_"}"
	
	
	//Rest Client, Build Request Body and POST
	Set objClient = ##Class(%Net.HttpRequest).%New()
	Set tURL = "http://dummy.restapiexample.com/api/v1/create"
	do objClient.EntityBody.Write(tJSON)
	Set tSC = objClient.Post(tURL)
	
	
	//Handle Errors and write Response
	if $$$ISERR(tSC)
	{
		Write !,"Error - "_$System.Status.GetErrorText(tSC)
	}
	else
	{
		Set tResponse = objClient.HttpResponse.Data.Read()
		Write !,tResponse
	}
	Quit $$$OK
}

}
