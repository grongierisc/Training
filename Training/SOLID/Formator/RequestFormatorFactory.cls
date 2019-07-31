Class Training.SOLID.Formator.RequestFormatorFactory Extends (%RegisteredObject, iFormatorFactory)
{

Method GetFormator(Value As %String) As Training.SOLID.Library.Formator.iFormator
{
	#dim RetObj As Training.SOLID.Library.Formator.iFormator 
		
	Set UpContentType = $ZCONVERT(..ContentType,"U")
	
	if (UpContentType [ "XML")
	{
		Set RetObj = ##class(Training.SOLID.Library.Formator.SimpleXMLFormator).%New()
	}
	elseif (UpContentType [ "JSON")
	{
		Set RetObj = ##class(Training.SOLID.Library.Formator.SimpleJSONFormator).%New()
	}
	else
	{
		THROW $$$ERROR($$$GeneralError,"Unhandled ContentType")
	}
	
	Quit RetObj
}

}
