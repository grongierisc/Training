/// 
Class Scan.GetEmployeeInfo Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Scan.CheckEmployeeRequest' response='Scan.CheckEmployeeResponse' height='2000' width='2000' >
<context>
<property name='IsRelated' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='IsExternal' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='ToAddress' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='850' >
<call name='Check Relation' target='Scan.GetEmployeeDetails' async='1' xpos='200' ypos='250' >
<request type='Scan.CheckRelationRequest' >
<assign property="callrequest.ID" value="request.ID" action="set" />
</request>
<response type='Scan.CheckRelationResponse' >
<assign property="response.IsRelated" value="callresponse.IsRelated" action="set" />
<assign property="context.IsRelated" value="callresponse.IsRelated" action="set" />
</response>
</call>
<call name='Check Email' target='Scan.GetEmployeeDetails' async='1' xpos='200' ypos='350' >
<request type='Scan.ValidateToAddressRequest' >
<assign property="callrequest.ToAddress" value="request.ToAddress" action="set" />
</request>
<response type='Scan.ValidateToAddressResponse' >
<assign property="response.IsExternal" value="callresponse.IsExternal" action="set" />
<assign property="context.IsExternal" value="callresponse.IsExternal" action="set" />
</response>
</call>
<sync name='Wait for Responses' calls='Check Relation,Check Email' timeout='30' type='all' xpos='200' ypos='450' />
<assign name="Assign to context" property="context.ToAddress" value="request.ToAddress" action="set" xpos='200' ypos='550' />
<rule name='Treat As Internal Email?' rule='TreatAsInternal'  resultLocation='response.IsExternal' xpos='200' ypos='650' >
</rule>
<call name='Add Address to File' target='Scan.AddToAddressFile' async='1' xpos='200' ypos='750' >
<request type='Scan.AddAddressRequest' >
<assign property="callrequest.IsExternal" value="context.IsRelated" action="set" />
<assign property="callrequest.IsRelated" value="context.IsExternal" action="set" />
<assign property="callrequest.ToAddress" value="request.ToAddress" action="set" />
</request>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Library.CacheStorage</Type>
}

}
