Class Scan.GetEmployeeDetails Extends Ens.BusinessOperation [ Language = cache ]
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method CheckRelation(pRequest As Scan.CheckRelationRequest, Output pResponse As Scan.CheckRelationResponse) As %Status
{


	Set pResponse = ##class(Scan.CheckRelationResponse).%New()
	//need to pass tResult by reference explicitly in ObjectScript
	//Use an adapter to run a query in the Employee database.
	Set tSC = ..Adapter.ExecuteQuery(.tResult,"Select RelationshipToOwner from Employee where EmployeeID="_pRequest.ID)
	Quit:$$$ISERR(tSC) tSC
	//Check the result to determine the relationship to the owner.
		//The query returns a result set. To use a result set, use tResult.Next()
		//to be positioned at the first returned row of the result set.
		//Since there is only one result in the result set, no looping is required.
		//GetData(x) returns the xth field asked for in the Select statement.
	
	do tResult.Next()
	set relation = tResult.GetData(1)
	if ((relation = "None") || (relation="")) {
		set pResponse.IsRelated=0
		} else {
		set pResponse.IsRelated=1
	}
	
	Quit $$$OK
}

Method ValidateToAddress(pRequest As Scan.ValidateToAddressRequest, Output pResponse As Scan.ValidateToAddressResponse) As %Status
{
	set pResponse = ##class(Scan.ValidateToAddressResponse).%New()
	
	//Use an adapter to run a query in the Employee database.
	set tSC = ..Adapter.ExecuteQuery(.tResult,"Select FirstName from Employee where Email='"_pRequest.ToAddress_"'")
		
	//If the result set is empty, then the address is an external address.
	If tResult.Next() { 
		set pResponse.IsExternal=0
	} else {
		set pResponse.IsExternal=1
	}
	
	Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Scan.CheckRelationRequest"> 
		<Method>CheckRelation</Method>
	</MapItem>
	<MapItem MessageType="Scan.ValidateToAddressRequest"> 
		<Method>ValidateToAddress</Method>
	</MapItem>
</MapItems>
}

}
