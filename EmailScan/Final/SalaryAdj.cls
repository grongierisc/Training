Class Final.SalaryAdj Extends Ens.BusinessProcessBPL [ ClassType = persistent ]
{

XData BPL
{
<process language='objectscript' request='Final.SalaryAdjReq' response='Final.SalaryAdjResp' >
<context>
<property name='Salary' type='%Numeric' />
<property name='SickDays' type='%Integer' />
<property name='AdjSalary' type='%Numeric' />
<property name='Success' type='%Boolean' />
</context>
<sequence >
<call name='Get Emp Details' xpos='500' ypos='200' target='Final.MaintainEmp' async='1' >
<request type='Final.GetEmpDetailReq' >
<assign property='callrequest.ID' value='request.ID' action='set' />
</request>
<response type='Final.GetEmpDetailResp' >
<assign property='context.Salary' value='callresponse.Salary' action='set' />
<assign property='context.SickDays' value='callresponse.SickDays' action='set' />
</response>
</call>
<sync name='Wait for Details' xpos='500' ypos='300' calls='Get Emp Details' timeout='30' type='all' />
<if name='Check Sick Days' xpos='500' ypos='400' condition='context.SickDays&gt;5' >
<true>
<assign name='&gt;5' xpos='390' ypos='600' property='context.AdjSalary' value='(context.Salary*(request.Percentage/100))-(100*context.SickDays)' action='set' />
</true>
<false>
<assign name='&lt;=5' xpos='610' ypos='600' property='context.AdjSalary' value='(context.Salary*(request.Percentage/100))-(50*context.SickDays)' action='set' />
</false>
</if>
<call name='Adjust Salary' xpos='500' ypos='800' target='Final.MaintainEmp' async='1' >
<request type='Final.AdjSalaryReq' >
<assign property='callrequest.ID' value='request.ID' action='set' />
<assign property='callrequest.AdjSalary' value='context.AdjSalary' action='set' />
</request>
<response type='Final.AdjSalaryResp' >
<assign property='context.Success' value='callresponse.Success' action='set' />
</response>
</call>
<sync name='Wait for Update' xpos='757' ypos='860' calls='Adjust Salary' timeout='30' type='all' />
<if name='Check Update' xpos='500' ypos='900' condition='context.Success=1' >
<true>
<assign name='Succeeded' xpos='390' ypos='1100' property='response.Success' value='context.Success' action='set' />
<assign name='Return New Salary' xpos='390' ypos='1200' property='response.NewSalary' value='context.AdjSalary' action='set' />
</true>
<false>
<assign name='Failed' xpos='610' ypos='1100' property='response.Success' value='context.Success' action='set' />
<assign name='Return Current Salary' xpos='610' ypos='1200' property='response.NewSalary' value='context.Salary' action='set' />
</false>
</if>
</sequence>
</process>

}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}

