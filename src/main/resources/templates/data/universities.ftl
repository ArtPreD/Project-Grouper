<#macro page universities>
<div>
    <h4 align="centre">Список университетов</h4>
</div>

<div class="table-responsive">
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Название</th>
            <th scope="col">Аббревиатура</th>
            <th scope="col">Адрес</th>
            <th scope="col">Редактировать</th>
            <th scope="col">Удалить</th>
        </tr>
        </thead>
        <tbody>
<#list universities as university>
<tr>
    <th scope="row">${university.id}</th>
    <td style="white-space: nowrap">${university.name}</td>
    <td style="white-space: nowrap">${university.abbreviation}</td>
    <td style="white-space: nowrap">${university.address}</td>
    <td align="center"><a class="btn btn-primary" href="">Редактировать</a></td>
    <td align="center"><a class="btn btn-primary" href="">Удалить</a></td>
</tr>
</#list>
        </tbody>
    </table>
</div>
</#macro>