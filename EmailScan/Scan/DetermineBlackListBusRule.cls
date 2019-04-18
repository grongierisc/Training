Class Scan.DetermineBlackListBusRule Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

XData BPL
{
<process language='objectscript' request='Scan.CheckEmployeeRequest' response='Scan.CheckEmployeeResponse' height='2000' width='2000' >
<context>
<property name='Attributes' type='Scan.CheckEmployeeResponse' />
<property name='AddToBlackList' type='%Boolean' />
</context>
<sequence xend='550' yend='850' >
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
<rule name='Decide Which File' rule='DecideFile'  resultLocation='context.AddToBlackList' xpos='550' ypos='400' >
</rule>
<if name='Blacklist?' condition='context.AddToBlackList' xpos='550' ypos='500' xend='550' yend='750' >
<true>
<call name='Blacklist File' target='Scan.MakeFileOperation' async='1' xpos='820' ypos='650' >
<request type='Scan.EmailFileRequest' >
<assign property='callrequest.FileName' value='"BlackList.txt"' action='set' />
<assign property='callrequest.Contents' value='request' action='set' />
</request>
</call>
</true>
<false>
<call name='Safe Email File' target='Scan.MakeFileOperation' async='1' xpos='550' ypos='650' >
<request type='Scan.EmailFileRequest' >
<assign property='callrequest.FileName' value='"SafeEmail.txt"' action='set' />
<assign property='callrequest.Contents' value='request' action='set' />
</request>
</call>
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
