<#import "parts/common.ftl" as c>
<@c.page>

<div class="container section-un col-10">
    <h5 align="center">Управление группой</h5>
    <#if teacher && group??>
                <h6 align="center">Ваша группа: ${group.name}</h6>



        <#if teacher && group??>
        <#--Управление группой-->
<div class="container">
    <hr>
    <h5>Статистика группы</h5>
    <hr>
    <h6>Количество участников: <#if countUsers??>${countUsers}<#else>0</#if></h6>
    <h6>Количество сообщений: ${group.messages}</h6>
    <h6>Количество заявок: <#if countStat??>${countStat}<#else>0</#if></h6>

    <hr>
    <h5>Список участников</h5>
    <hr>

    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Имя</th>
                <th scope="col">Фамилия</th>
                <th scope="col">Адрес</th>
                <th scope="col">Email</th>
                <th scope="col">Ник</th>
                <th scope="col">Телефон</th>
                <th scope="col">Исключить</th>
            </tr>
            </thead>
            <tbody>
<#if users??>
<#list users as user>
<tr>
    <td style="white-space: nowrap"><#if user.first_name??>${user.first_name}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.last_name??>${user.last_name}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.address??>${user.address}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.email??>${user.email}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.username??>${user.username}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.phone??>${user.phone}<#else>unknown</#if></td>
    <td align="center"><a class="btn btn-primary" href="">Исключить</a></td>
</tr>
</#list>
</#if>
            </tbody>
        </table>
        <#if !users??>
        <h5 align="center">В группе нет участников</h5>
        </#if>
    </div>

    <hr>
    <h5>Список заявок</h5>
    <hr>
<#if statements??>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Имя</th>
                <th scope="col">Фамилия</th>
                <th scope="col">Адрес</th>
                <th scope="col">Email</th>
                <th scope="col">Ник</th>
                <th scope="col">Телефон</th>
                <th scope="col">Добавить</th>
                <th scope="col">Отклонить</th>
            </tr>
            </thead>
            <tbody>
<#list statements as user>
<tr>
    <td style="white-space: nowrap"><#if user.first_name??>${user.first_name}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.last_name??>${user.last_name}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.address??>${user.address}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.email??>${user.email}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.username??>${user.username}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.phone??>${user.phone}<#else>unknown</#if></td>
    <td align="center"><a class="btn btn-primary" href="/group/${user.id}">Добавить</a></td>
    <td align="center"><a class="btn btn-primary" href="">Отклонить</a></td>
</tr>
</#list>
</#if>
</tbody>
</table>
        <#if !statements??>
        <h5 align="center">Заявок нет</h5>
        </#if>
</div>

</div>
        <#--Управление группой-->
        </#if>

    <#else>
                <h6 align="center">У вас нет группы. Создать?</h6>
    <#--Создание группы-->
<div class="container">

    <div class="mb-2">
        <div align="left">
            <h6> <#if !university??>
                <div class="alert alert-danger" role="alert">
                    <h5 align="center">Ваш университет не выбран. Установите свой университет в <a href="/user/profile">профайле</a>
                    </h5>
                </div>
            <#else>
           Ваш университет: ${university.getName()}
            </#if></h6>
        </div>

        <#if university??>
            <form method="post" action="/create">
                <div class="form-group">
                    <label for="group_name">Имя группы</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Имя группы">
                </div>

                <div class="form-group">
                    <label for="group_abbreviation">Аббревиатура</label>
                    <input type="text" class="form-control" id="abbreviation" name="abbreviation"
                           placeholder="Аббревиатура">
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
         <#if !university??>
             <div>Не выбран университет. Установите свой университет в профайле</div>
         <#else>
         <input name="university" id="university" value="${university.getName()}" hidden="hidden">
         </#if>
                    <button type="submit" class="btn btn-primary" <#if !university??>disabled</#if>>Создать группу
                    </button>
                </div>
            </form>
        </#if>
    </div>
    </#if>
</div>
    <#--Создание группы-->
</div>
</@c.page>