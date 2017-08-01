 <#escape x as jsonUtils.encodeJSONString(x)> 

<#macro renderUnit unit>
 {
 	"name": "${unit.name}",
 	"testEditing": "editing8",
 	"displayName": "${unit.displayName}",
 	"weight": "${unit.weight}",
 	"groupRef": "${unit.groupRef}",
 	"id": "${unit.id}",
	"isAdmin": "${unit.isAdmin}",
 	"children":
 	[
 		<#list unit.children as child>
 			<@renderUnit child /><#if child_has_next>,</#if>
 		</#list>
 	],
 	"supervisors":
 	[
 		<#list unit.supervisors as supervisor>
 			"${supervisor}"<#if supervisor_has_next>,</#if>
 		</#list>
 	],
 	"supervisorLogins":
 	[
 		<#list unit.supervisorLogins as supervisorLogin>
 			"${supervisorLogin}"<#if supervisorLogin_has_next>,</#if>
 		</#list>
 	]
 	<#--
 	 -->
 }
 </#macro>

 {
	<#if message?has_content>
	"message": "${message}",
	</#if>
 	"data":
 	[
		<#if tree??>
 		<@renderUnit tree />
		</#if>
 	]
 }
 </#escape>