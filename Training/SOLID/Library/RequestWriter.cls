Class Training.SOLID.Library.RequestWriter Extends %RegisteredObject
{

Property RequestString As %String [ Private ];

Method Add(pKey As %String, pValue As %String, pAllowNullValues As %Boolean = 1) As %Status
{
	Quit:$G(pKey)="" $$$OK
	
	Set tRequest = ""
	
	if (($D(pValue)) || (pAllowNullValues))
	{
			Set tRequest = " """_pKey_""":"""_$g(pValue)_""" "
			
			Set:(..RequestString'="") ..RequestString = ..RequestString_", "_tRequest
			Set:(..RequestString="") ..RequestString = tRequest
	}
	Quit $$$OK
}

Method GetRequestString() As %String
{
	Quit "{"_..RequestString_"}"
}

}
