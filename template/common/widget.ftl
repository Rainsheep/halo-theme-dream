<#macro widget position>
<aside class="column column-side column-${position} <#if position == 'left'><#if settings.left_sidebar_sticky?? && settings.left_sidebar_sticky == 'top'>is-sticky</#if><#if settings.left_sidebar_sticky?? && settings.left_sidebar_sticky == 'bottom'>is-sticky left-bottom</#if><#else><#if settings.right_sidebar_sticky?? && settings.right_sidebar_sticky == 'top'>is-sticky</#if><#if settings.right_sidebar_sticky?? && settings.right_sidebar_sticky == 'bottom'>is-sticky right-bottom</#if></#if>">
    <#assign sidebar_list=[]>
    <#list settings?keys as key>
        <#if key?index_of('sidebar_priority_') != -1>
            <#assign property = "sidebar_" + key?substring(17)>
            <#if settings[property]?? && settings[property] == position>
                <#assign priority = settings[key]!'0'?number>
                <#assign sidebar_list=sidebar_list + [{"property": "${key?substring(17)}", "priority": "${priority}"}]>
            </#if>
        </#if>
    </#list>
    <#list sidebar_list?sort_by('priority')?reverse as sidebar>
        <#include "../widget/${sidebar.property}.ftl">
    </#list>
    <#if position == 'left'>
        <div class="column-right-shadow is-hidden-desktop">
        </div>
    </#if>
</aside>
</#macro>