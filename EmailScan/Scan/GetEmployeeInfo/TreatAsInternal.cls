/// Decides if an external email should be treated as internal. If so, sets context.IsExternal=0 and returns 0; otherwise, returns the existing IsExternal value. It returns a value to response.IsExternal.
Class Scan.GetEmployeeInfo.TreatAsInternal Extends Ens.Rule.Definition [ ProcedureBlock ]
{

Parameter RuleAssistClass = "Ens.Rule.GeneralBusinessRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="Scan.GetEmployeeInfo.Context" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<when condition="(ToAddress=&quot;SamSmooth@MIU.com&quot;)||(ToAddress=&quot;PaulaPromotions@MIU.com&quot;)">
<assign property="IsExternal" value="0"></assign>
<return>IsExternal</return>
</when>
</rule>
<return>IsExternal</return>
</ruleSet>
</ruleDefinition>
}

}
