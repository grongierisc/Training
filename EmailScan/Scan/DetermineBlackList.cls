Class Scan.DetermineBlackList Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

XData BPL
{
<process language='objectscript' request='Scan.CheckEmployeeRequest' response='Scan.CheckEmployeeResponse' height='2000' width='2000' >
<context>
<property name='Attributes' type='Scan.CheckEmployeeResponse' />
<property name='Action' type='%String' />
</context>
<sequence xend='550' yend='1300' >
<call name='Get Employee Info' target='Scan.GetEmployeeInfo' async='1' xpos='550' ypos='200' >
<request type='Scan.CheckEmployeeRequest' >
<assign property='callrequest' value='request' action='set' />
</request>
<response type='Scan.CheckEmployeeResponse' >
<assign property='response' value='callresponse' action='set' />
<assign property='context.Attributes' value='callresponse' action='set' />
</response>
</call>
<sync name='Wait For Response' calls='Get Employee Info' timeout='30' type='all' xpos='550' ypos='300' />
<if name='Blacklist?' condition='&apos;context.Attributes.IsRelated &amp; context.Attributes.IsExternal' xpos='550' ypos='400' xend='550' yend='1200' >
<true>
<call name='Call Owner' target='Owner' async='1' xpos='550' ypos='550' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property='callrequest.%Subject' value='"Review BlackList Email"' action='set' />
<assign property='callrequest.%Actions' value='"Allow Email,Fire Employee,Sue Employee"' action='set' />
<assign property='callrequest.%Message' value='request.ToAddress_"; "_request.EmailText' action='set' />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property='context.Action' value='callresponse.%Action' action='set' />
</response>
</call>
<sync name='Wait for Workflow' calls='Call Owner' type='all' xpos='550' ypos='650' />
<if name='Check Action Taken' condition='context.Action="Allow Email"' xpos='550' ypos='750' xend='550' yend='1000' >
<true>
<call name='Blacklist File' target='Scan.MakeFileOperation' async='1' xpos='685' ypos='900' >
<request type='Scan.EmailFileRequest' >
<assign property='request.EmailText' value='context.Action_" "_request.EmailText' action='set' />
<assign property='callrequest.FileName' value='"BlackList.txt"' action='set' />
<assign property='callrequest.Contents' value='request' action='set' />
</request>
</call>
</true>
</if>
</true>
<false>
<transform name='Update data' class='Scan.ChangeForSafeEmailDTL' source='request' target='request' xpos='1090' ypos='550' />
<call name='Call Manager' target='Manager' async='1' xpos='1090' ypos='650' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property='callrequest.%Subject' value='"Check email for "_request.Name' action='set' />
<assign property='callrequest.%Message' value='request.EmailText' action='set' />
<assign property='callrequest.%Actions' value='"Approve Email,Contact Employee"' action='set' />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property='context.Action' value='callresponse.%Action' action='set' />
</response>
</call>
<sync name='Wait for Workflow' calls='Call Manager' type='all' xpos='1090' ypos='750' />
<if name='Check Action Taken' condition='context.Action="Approve Email"' xpos='1090' ypos='850' xend='1090' yend='1100' >
<true>
<call name='Safe Email File' target='Scan.MakeFileOperation' async='1' xpos='1360' ypos='1000' >
<request type='Scan.EmailFileRequest' >
<assign property='callrequest.FileName' value='"SafeEmail.txt"' action='set' />
<assign property='callrequest.Contents' value='request' action='set' />
</request>
</call>
</true>
<false>
<empty name='Not Yet Implemnted' xpos='1090' ypos='1000' />
</false>
</if>
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
