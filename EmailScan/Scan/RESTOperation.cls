Class Scan.RESTOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method CheckRelation(pRequest As Scan.CheckRelationRequest, Output pResponse As Scan.CheckRelationResponse) As %Status
{
	set tSC = $$$OK
	try {
		set tURL = $$$URLENCODE(..Adapter.URL_"/"_pRequest.ID)
		
		set tSC = ..Adapter.GetURL(tURL,.tHttpResponse)
		
		$$$ThrowOnError(tSC)
		
		#dim tHttpResponse as %Net.HttpResponse
		set tObj = ##class(%DynamicObject).%FromJSON(tHttpResponse.Data)
		
		set pResponse = ##class(Scan.CheckRelationResponse).%New()
		
		set pResponse.IsRelated = tObj.Related
	}
	catch ex {
		set tSC = ex.AsStatus()
	}
	
	return tSC
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Scan.CheckRelationRequest"> 
		<Method>CheckRelation</Method>
	</MapItem>
</MapItems>
}

}
