Class Training.DT.Dynamic Extends Ens.DataTransformDTL [ DependsOn = (Training.Message, Training.MessageResponse) ]
{

/// DTL Definition.
XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform targetClass='Training.MessageResponse' targetDocType='' sourceClass='Training.Message' sourceDocType='' create='new' language='objectscript'>
</transform>
}

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

}
