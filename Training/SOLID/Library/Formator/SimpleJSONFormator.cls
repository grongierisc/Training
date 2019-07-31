Class Training.SOLID.Library.Formator.SimpleJSONFormator Extends (%RegisteredObject, iFormator)
{

Method GetFormattedText(Content As %String, Key As %String, Value As %RegisteredObject) As %String [ Final ]
{
	Set tPair = " """_Key_""":"""_$g(Value)_""" "
			
	Set:(Content'="") Content = Content_", "_tPair
	Set:(Content="") Content = tPair
	Quit Content
}

}
