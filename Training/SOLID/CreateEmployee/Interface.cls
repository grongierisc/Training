Class Training.SOLID.CreateEmployee.Interface Extends %RegisteredObject
{

Method CallAPI(pName As %String, pSalary As %String, pAge As %String, ContentType As %String) As %Status
{
	Set FormatorFactoryObj = ##Class(Training.SOLID.Formator.RequestFormatorFactory).%New(ContentType)
	Set WriterObj = ##class(Training.SOLID.Writer.RequestWriter).%New(FormatorFactoryObj)
	
	Set BuilderObj = ##Class(Training.SOLID.CreateEmployee.Request.Builder).%New(WriterObj)
	
	Set RequestString = BuilderObj.Build(pName,pSalary,pAge)
	
	
	//Client
	
	//Process Error and Response
	
	
	Quit $$$OK
}

}
