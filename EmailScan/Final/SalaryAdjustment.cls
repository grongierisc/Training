Class Final.SalaryAdjustment Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Final.SalaryAdjustment" TestingEnabled="true">
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Final.MaintainEmp" ClassName="Final.MaintainEmp" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" InactivityTimeout="0">
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Adapter" Name="DSN">Access</Setting>
    <Setting Target="Adapter" Name="StayConnected">-1</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
  </Item>
  <Item Name="Final.SalaryAdj" ClassName="Final.SalaryAdj" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" InactivityTimeout="0">
  </Item>
  <Item Name="Final.SalaryAdjCSP" ClassName="Final.SalaryAdjCSP" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" InactivityTimeout="0">
  </Item>
</Production>
}

}

