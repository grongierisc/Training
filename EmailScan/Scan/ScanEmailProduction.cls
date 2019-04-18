Class Scan.ScanEmailProduction Extends Ens.Production [ ClassType = "", ProcedureBlock ]
{

XData ProductionDefinition
{
<Production Name="Scan.ScanEmailProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Scan.MakeFileOperation" Category="" ClassName="Scan.MakeFileOperation" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Adapter" Name="FilePath">c:\Integration\scan</Setting>
    <Setting Target="Adapter" Name="Overwrite">0</Setting>
    <Setting Target="Adapter" Name="Charset">Default</Setting>
    <Setting Target="Adapter" Name="OpenTimeout">5</Setting>
  </Item>
  <Item Name="Scan.GetEmployeeDetails" Category="" ClassName="Scan.GetEmployeeDetails" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Host" Name="RetryInterval">5</Setting>
    <Setting Target="Host" Name="FailureTimeout">15</Setting>
    <Setting Target="Adapter" Name="DSN">jdbc:Cache://127.0.0.1:1972/USER</Setting>
    <Setting Target="Adapter" Name="StayConnected">10</Setting>
    <Setting Target="Adapter" Name="ConnectTimeout">5</Setting>
    <Setting Target="Adapter" Name="Credentials">SuperUser</Setting>
    <Setting Target="Adapter" Name="JDBCClasspath">C:\InterSystems\Ensemble\dev\java\lib\JDK18\cache-jdbc-2.0.0.jar</Setting>
    <Setting Target="Adapter" Name="JDBCDriver">com.intersys.jdbc.CacheDriver</Setting>
    <Setting Target="Adapter" Name="JGService">JG</Setting>
  </Item>
  <Item Name="Scan.AddToAddressFile" Category="" ClassName="Scan.AddToAddressFile" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="Scan.GetEmployeeInfo" Category="" ClassName="Scan.GetEmployeeInfo" PoolSize="1" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="Scan.ScanCSPRequestService" Category="" ClassName="Scan.ScanCSPRequestService" PoolSize="0" Enabled="true" Foreground="false" DisableErrorTraps="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
  </Item>
  <Item Name="Scan.ScanFileService" Category="" ClassName="Scan.ScanFileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="InactivityTimeout">0</Setting>
    <Setting Target="Adapter" Name="FilePath">c:\Integration\Scan</Setting>
    <Setting Target="Adapter" Name="FileSpec">Email.txt</Setting>
  </Item>
  <Item Name="Scan.DetermineBlackList" Category="" ClassName="Scan.DetermineBlackList" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Scan.DetermineBlackListBusRule" Category="" ClassName="Scan.DetermineBlackListBusRule" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="JG" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Owner" Category="" ClassName="EnsLib.Workflow.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AutoCreateRole">1</Setting>
  </Item>
  <Item Name="Manager" Category="" ClassName="EnsLib.Workflow.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AutoCreateRole">1</Setting>
  </Item>
  <Item Name="Scan.RecordMapFileOperation" Category="" ClassName="EnsLib.RecordMap.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Filename">Address.txt</Setting>
    <Setting Target="Host" Name="RecordMap">Scan.AddressFileRecordMap</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\Integration\Scan\</Setting>
  </Item>
  <Item Name="Scan.RESTService" Category="" ClassName="Scan.RESTService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Scan.RESTOperation" Category="" ClassName="Scan.RESTOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">57772</Setting>
    <Setting Target="Adapter" Name="HTTPServer">localhost</Setting>
    <Setting Target="Adapter" Name="URL">/api/training/checkrelation</Setting>
  </Item>
</Production>
}

}
