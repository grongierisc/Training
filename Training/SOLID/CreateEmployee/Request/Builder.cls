Class Training.SOLID.CreateEmployee.Request.Builder Extends %RegisteredObject
{

Property RequestWriter As Training.SOLID.Writer.iWriter [ Private ];

Method %OnNew(RequestWriter As Training.SOLID.Writer.iWriter) As %Status
{
	Quit:'$IsObject(RequestWriter) $$$ERROR($$$GeneralError, "Invalid RequestWriter Object")
	Set ..RequestWriter = RequestWriter
	Quit $$$OK
}

Method Build(Name As %String, Salary As %String, Age As %String) As %String
{
	do ..RequestWriter.Add("name", Name)
	do ..RequestWriter.Add("salary", Salary)
	do ..RequestWriter.Add("age", Age)
	
	Quit ..RequestWriter.GetContent()
}

}
