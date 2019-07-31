/// 
Class Training.BP Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='test' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='450' >
<call name='Call' target='Training.BO' async='0' xpos='200' ypos='250' >
<request type='Training.Message' >
<assign property="callrequest.jsonObject" value="{&quot;test&quot;:&quot;de message&quot;,&quot;tess&quot;:1}" action="set" />
</request>
<response type='Training.MessageResponse' >
<assign property="context.test" value="callresponse.json" action="set" />
</response>
</call>
<trace value='context.test' xpos='200' ypos='350' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
