<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="QuerySuggestion" generation="1" functional="0" release="0" Id="b7dd44e2-1534-42da-9010-b16141be74f1" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="QuerySuggestionGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="QuerySuggestionWebRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/QuerySuggestion/QuerySuggestionGroup/LB:QuerySuggestionWebRole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="QuerySuggestionWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/QuerySuggestion/QuerySuggestionGroup/MapQuerySuggestionWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="QuerySuggestionWebRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/QuerySuggestion/QuerySuggestionGroup/MapQuerySuggestionWebRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:QuerySuggestionWebRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/QuerySuggestion/QuerySuggestionGroup/QuerySuggestionWebRole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapQuerySuggestionWebRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/QuerySuggestion/QuerySuggestionGroup/QuerySuggestionWebRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapQuerySuggestionWebRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/QuerySuggestion/QuerySuggestionGroup/QuerySuggestionWebRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="QuerySuggestionWebRole" generation="1" functional="0" release="0" software="C:\Users\Chau\Documents\Visual Studio 2013\Projects\Web\QuerySuggestion\QuerySuggestion\csx\Debug\roles\QuerySuggestionWebRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;QuerySuggestionWebRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;QuerySuggestionWebRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/QuerySuggestion/QuerySuggestionGroup/QuerySuggestionWebRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/QuerySuggestion/QuerySuggestionGroup/QuerySuggestionWebRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/QuerySuggestion/QuerySuggestionGroup/QuerySuggestionWebRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="QuerySuggestionWebRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="QuerySuggestionWebRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="QuerySuggestionWebRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="b4d314a8-d4f2-4e00-8943-b5ffa250ce27" ref="Microsoft.RedDog.Contract\ServiceContract\QuerySuggestionContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="7ecb8993-13d5-4943-b430-4233a031860b" ref="Microsoft.RedDog.Contract\Interface\QuerySuggestionWebRole:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/QuerySuggestion/QuerySuggestionGroup/QuerySuggestionWebRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>