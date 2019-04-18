Class Final.MaintainEmp Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method AdjSalary(pRequest As Final.AdjSalaryReq, Output pResponse As Final.AdjSalaryResp) As %Status
{
	s pResponse=##class(Final.AdjSalaryResp).%New()
	s SQL="update employee set Salary="_pRequest.AdjSalary_" where EmployeeID="_pRequest.ID
	s tSC=..Adapter.ExecuteUpdate(.tResult,SQL)
	s pResponse.Success=tResult
	Quit $$$OK
}

Method GetEmpDetail(pRequest As Final.GetEmpDetailReq, Output pResponse As Final.GetEmpDetailResp) As %Status
{
	s pResponse=##class(Final.GetEmpDetailResp).%New()
	s SQL="select salary, sickdays from employee where employeeid="_pRequest.ID
	s tSC=..Adapter.ExecuteQuery(.tResult,SQL)
	do tResult.Next()
	s pResponse.Salary=tResult.GetData(1)
	s pResponse.SickDays=tResult.GetData(2)
	Quit $$$OK
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Final.GetEmpDetailReq"> 
		<Method>GetEmpDetail</Method>
	</MapItem>
	<MapItem MessageType="Final.AdjSalaryReq"> 
		<Method>AdjSalary</Method>
	</MapItem>
</MapItems>
}

}

