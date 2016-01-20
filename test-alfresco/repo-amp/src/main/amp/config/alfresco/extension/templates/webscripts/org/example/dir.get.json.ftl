{ 
  "server" : "Alfresco ${server.edition} Edition v${server.version}",
  "folder" :
  {
    "path" : "${folder.displayPath}",
    "name" : "${folder.name}" 
  },
  "children" : [
    <#list folder.children as child>
    {
        "isfolder" : <#if child.isContainer>true<#else>false</#if>,
        <#if verbose>
        "modifier" : "${child.properties.modifier}",
        "size" : <#if child.isDocument>
          ${child.properties.content.size?c}<#else>null</#if>,
        "modified" : "${child.properties.modified?date}",
        </#if>
        "name" : "${child.name}"
    }<#if child_has_next>,</#if>
  </#list>
  ]
}