<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Grouper</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <#if user?? && name??>
            <li class="nav-item">
                <a class="nav-link" href="/main">Главная</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/user/profile">Профайл</a>
            </li>
            </#if>
            <#if isSuperuser>
            <li class="nav-item">
                <a class="nav-link" href="/data">Списки данных</a>
            </li>
            </#if>
            <#if isTeacher || isSuperuser>
             <li class="nav-item">
                 <a class="nav-link" href="/group/control">Управление группой</a>
             </li>
            </#if>
        </ul>
        <div class="navbar-text mr-3">
        <#if user?? && name?? >
            Привет, ${name}!
        <#else>
            <a href="/login">Войти в аккаунт</a>
        </#if>
        </div>
        <#if user?? && name?? >
         <@l.logout />
        </#if>
    </div>
</nav>