/// A sample class for training.
Class Training.Person Extends (%Persistent, %Populate)
{

Property PhoneNumber As %String(MAXLEN = 12, POPSPEC = "USPhone()");

Index PhoneNumberIndex On (PhoneNumber);

Property Name As %String [ Required ];

Index NameIndex On (Name);

Property Email As %String(POPSPEC = "##class(Training.Person).Email()");

Property DOB As %Date(FORMAT = 5, MAXVAL = "+$H");

ClassMethod Email()
{
	Set email=##class(%PopulateUtils).FirstName()
	_"@"
	_##class(%PopulateUtils).Syllable(10)
	
	Set suffix=$Piece(".com,.net,.org",",",$Random(3)+1)
	
	Set email=email_suffix
	
	Quit $ZStrip(email,"*W")
}

Storage Default
{
<Data name="PersonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PhoneNumber</Value>
</Value>
<Value name="3">
<Value>Name</Value>
</Value>
<Value name="4">
<Value>Email</Value>
</Value>
<Value name="5">
<Value>DOB</Value>
</Value>
</Data>
<DataLocation>^Training.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<IdLocation>^Training.PersonD</IdLocation>
<IndexLocation>^Training.PersonI</IndexLocation>
<Property name="%%CLASSNAME"/>
<Property name="DOB"/>
<Property name="Email"/>
<Property name="Name"/>
<Property name="PhoneNumber"/>
<StreamLocation>^Training.PersonS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

