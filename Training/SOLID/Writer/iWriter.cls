Class Training.SOLID.Writer.iWriter [ Abstract ]
{

Property FormatorFactory As Training.SOLID.Formator.iFormatorFactory [ Private ];

Property Content As %String [ Private ];

Method %OnNew(FormatorFactory As Training.SOLID.Formator.iFormatorFactory) As %Status [ Final ]
{
	Quit:'$IsObject(FormatorFactory) $$$ERROR($$$GeneralError, "Invalid FormatorFactory Object")
	
	Set ..FormatorFactory = FormatorFactory
	
	Quit $$$OK
}

Method Add(Key, Value) As %Status [ Abstract ]
{
	Quit $$$OK
}

Method GetContent() As %String [ Abstract ]
{
	Quit ""
}

}
