Class Training.SOLID.S.CreateEmployee.ProcessError Extends %RegisteredObject
{

Method IsError(pStatus As %String) As %Boolean
{
	if $$$ISERR(pStatus)
	{
		Write !,"Error - "_$System.Status.GetErrorText(pStatus)
		Quit 1
	}
	Quit 0
}

}
