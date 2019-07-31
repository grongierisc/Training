Class Training.BO Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method Echo(pRequest As Training.Message, Output pResponse As Training.Message) As %Status
{

	set pResponse = ##class(Training.MessageResponse).%New()

	set msg = pRequest.jsonObject.%Get("test")
	set msg = msg _ "test"
	
	
	d pResponse.jsonObject.%Set("test",msg)

	Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Training.Message"> 
		<Method>Echo</Method>
	</MapItem>
</MapItems>
}

}
