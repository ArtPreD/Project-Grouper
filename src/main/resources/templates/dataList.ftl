<#import "parts/common.ftl" as common>
<#import "data/users.ftl" as u>
<#import "data/universities.ftl" as un>

<@common.page>

<div class="container section col-10">
    <div class="form-row mb-3">
        <form method="get" action="/data/user">
            <button type="submit" class="btn btn-secondary ml-2 mr-4">Пользователи</button>
        </form>
        <form method="get" action="/data/university">
            <button type="submit" class="btn btn-secondary mr-4">Университеты</button>
        </form>
        <form method="get" action="/data/group">
            <button type="submit" class="btn btn-secondary">Группы</button>
        </form>
    </div>


<#if select==("users")>
    <@u.page users/>
</#if>
    <#if select==("university")>
        <@un.page universities/>
    </#if>
    <#if select==("group")>
       Тут будет список груп
    </#if>
</div>
</@common.page>

