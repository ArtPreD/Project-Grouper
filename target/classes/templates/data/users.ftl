<#macro page users>
<div>
    <h4 align="centre">Список пользователей</h4>
</div>

<div class="table-responsive">
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Имя</th>
            <th scope="col">Фамилия</th>
            <th scope="col">Адрес</th>
            <th scope="col">Email</th>
            <th scope="col">Активность</th>
            <th scope="col">Ник</th>
            <th scope="col">Телефон</th>
            <th scope="col">Статус</th>
            <th scope="col">Редактировать</th>
            <th scope="col">Сбросить пароль</th>
            <th scope="col">Удалить</th>
        </tr>
        </thead>
        <tbody>
<#list users as user>
<tr>
    <th scope="row">${user.id}</th>
    <td style="white-space: nowrap"><#if user.first_name??>${user.first_name}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.last_name??>${user.last_name}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.address??>${user.address}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.email??>${user.email}<#else>unknown</#if></td>
    <td style="white-space: nowrap">${user.active?string}</td>
    <td style="white-space: nowrap"><#if user.username??>${user.username}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#if user.phone??>${user.phone}<#else>unknown</#if></td>
    <td style="white-space: nowrap"><#list user.roles as role>${role}<#sep>, </#list></td>
    <td align="center"><a class="btn btn-primary" href="/data/${user.id}">Редактировать</a></td>
    <td align="center"><a class="btn btn-primary" href="">Сбросить</a></td>
    <td align="center"><a class="btn btn-primary" href="">Удалить</a></td>
</tr>
</#list>
        </tbody>
    </table>
</div>
</#macro>