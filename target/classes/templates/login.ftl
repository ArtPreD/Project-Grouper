<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<#if message??>
    <div class="alert alert-success" role="alert">
        ${message}
    </div>
</#if>
    <#if messageError??>
    <div class="alert alert-danger" role="alert">
        ${messageError}
    </div>
    </#if>
<#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
    <div class="alert alert-danger" role="alert">
        ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
    </div>
</#if>
<@l.login "/login" false />
</@c.page>
