Class Training.SOLID.S.CreateEmployee.RequestBuilder Extends %RegisteredObject
{

/// { "" : "<Name>" , "salary" : "<Salary>", "age" : "<Age>" }
Method Build(pName As %String, pSalary As %String, pAge As %String) As %String
{
	Set objRequestWriter = ##Class(Training.SOLID.Library.RequestWriter).%New()
	Do objRequestWriter.Add("name",pName,0)
	Do objRequestWriter.Add("salary",pSalary,0)
	Do objRequestWriter.Add("age",pAge,0)
	
	Set tJSON = objRequestWriter.GetRequestString()
	
	Quit tJSON
}

}
