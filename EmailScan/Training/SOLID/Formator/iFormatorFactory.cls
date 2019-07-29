Class Training.SOLID.Formator.iFormatorFactory [ Abstract ]
{

Property ContentType As %String [ Private ];

Method %OnNew(ContentType As %String) As %Status [ Final ]
{
	Quit:($G(ContentType) = "") $$$ERROR($$$GeneralError,"ContentType muse be passed")
	
	Set ..ContentType = ContentType
	
	Quit $$$OK
}

Method GetFormator(Value As %String) As Training.SOLID.Library.Formator.iFormator [ Abstract ]
{
	Quit
}

}
