Class Training.SOLID.Writer.RequestWriter Extends (%RegisteredObject, iWriter)
{

Method Add(Key, Value) As %Status
{
	Set Formator = ..FormatorFactory.GetFormator(Value)
	Set ..Content = Formator.GetFormattedText(Key, Value)
	Quit $$$OK
}

Method GetContent() As %String
{
	Quit ..Content
}

}
