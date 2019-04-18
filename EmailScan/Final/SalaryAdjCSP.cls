Class Final.SalaryAdjCSP Extends Ens.BusinessService
{

Method OnProcessInput(pInput As %CSP.Request, pOutput As %RegisteredObject) As %Status
{

	Set tSalaryAdj = ##class(Final.SalaryAdjReq).%New()
	Set tSalaryAdj.ID = pInput.Get("ID")
	Set tSalaryAdj.Percentage = pInput.Get("SalaryAdjustment")
	Set tResponse=##class(Final.SalaryAdjResp).%New()
	Set tSC = ..SendRequestSync("Final.SalaryAdj",tSalaryAdj,.tResponse)
	if tResponse.Success {
		Set pOutput = ##class(Ens.StringContainer).%New("Your new salary is "_tResponse.NewSalary_".")
	} else {
		set pOutput= ##class(Ens.StringContainer).%New("Your salary adjustment failed.")
	}
	Quit $$$OK
}

}

