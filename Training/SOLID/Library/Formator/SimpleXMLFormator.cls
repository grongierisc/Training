Class Training.SOLID.Library.Formator.SimpleXMLFormator Extends (%RegisteredObject, iFormator)
{

Method GetFormattedText(Content As %String, Key As %String, Value As %RegisteredObject) As %String [ Final ]
{
	Quit Content_"<"_Key_">"_Value_"</"_Key_">"
}

}
