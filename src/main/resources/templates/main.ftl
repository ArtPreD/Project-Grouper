<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

<div class="container col-10">
    <div class="row">
    <#--Блок с университетом-->
        <div class="container col-3 section-un">
            <div>
            <#if university??>
                <h5 align="center">${university.name}</h5>
            <#else>
                <h5 align="center">Университет не выбран</h5>
            </#if>
            </div>

           <#if university??>
               <#if group??>
            <h5 align="center">Сегодня: ${date}</h5>
            <h6 align="center">Рассписание на завтра</h6>

            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                    <tr>
                        <th scope="col">Пара</th>
                        <th scope="col">Название</th>
                        <th scope="col">Время</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">Первая</th>
                        <th scope="row">Типа пара</th>
                        <th scope="row">9:45</th>
                    </tr>
                    <tr>
                        <th scope="row">Вторая</th>
                        <th scope="row">Типа пара</th>
                        <th scope="row">11:00</th>
                    </tr>
                    <tr>
                        <th scope="row">Третья</th>
                        <th scope="row">Типа пара</th>
                        <th scope="row">13:00</th>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div><a href=""><h6 align="center">Рассписание на неделю</h6></a></div>

            <div><a href=""><h6 align="center">Список участников группы</h6></a></div>
            <div><a href=""><h6 align="center">Сообщения группы</h6></a></div>
            <div><a href=""><h6 align="center">Мои оценки</h6></a></div>
               <#else>
             <div class="alert alert-danger" role="alert">
                 <h5 align="center">Для отоброжения информации вы должны состоять в группе</h5>
             </div>
               </#if>
           </#if>

        </div>
    <#--Блок с университетом-->

    <#--Блок с группой-->
    <div class="container col-8 section-main">
            <#if group??>
                <h5 align="center">Ваша группа: ${group.name} (${group.abbreviation})</h5>
            <#else>
                <h5 align="center">Вы не состоите в группе</h5>
            </#if>

    <#if group??>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <form method="get" action="/main" class="form-inline">
                        <input type="text" name="filter" class="form-control" value="${filter?ifExists}"
                               placeholder="Поиск по тегу">
                        <button type="submit" class="btn btn-primary  ml-3">Найти</button>
                    </form>
                </div>
            </div>

            <a class="btn btn-primary mb-3" data-toggle="collapse" href="#collapseAddMessage" role="button"
               aria-expanded="false"
               aria-controls="collapseExample">Добавить новое сообщение</a>

            <div class="collapse <#if message??>show</#if>" id="collapseAddMessage">
                <div class="form-group mt-3">
                    <form method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <input type="text" name="text"
                                   class="form-control ${(textError??)?string('is-invalid', '')}"
                                   value="<#if message??>${message.text}</#if>" placeholder="Введите сообщение"/>
            <#if textError??>
            <div class="invalid-feedback">
                ${textError}
            </div>
            </#if>
                        </div>
                        <div class="form-group">
                            <input type="text" name="tag" class="form-control ${(tagError??)?string('is-invalid', '')}"
                                   placeholder="Тег"
                                   value="<#if message??>${message.tag}</#if>"/>
            <#if tagError??>
            <div class="invalid-feedback">
                ${tagError}
            </div>
            </#if>
                        </div>

                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Добавить</button>
                        </div>
                    </form>
                </div>
            </div>

            <h5 align="center">Сообщения группы:</h5>
        <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <div class="m-2"
                <i>${message.tag}:</i>
                <span>${message.text}</span>
            </div>
            <div class="card-footer text-muted">
                Автор: ${message.authorName}
            </div>
</div>
        <#else>
У группы еще нет сообщений
        </#list>
        </div>
    </#if>
    </div>
<#--Блок с группой-->
</div>
</div>
</@c.page>