/// Decides if entry should be made to BlackList.txt or SafeEmail.txt. The ResultLocation is context.AddToBlackList
Class Scan.DetermineBlackListBusRule.DecideFile Extends Ens.Rule.Definition [ ProcedureBlock ]
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<when condition="((Attributes.IsExternal)=(1))&amp;&amp;((Attributes.IsRelated)=(0))">
<return>1</return>
</when>
</rule>
<return>0</return>
</ruleSet>
</ruleDefinition>
}

}
