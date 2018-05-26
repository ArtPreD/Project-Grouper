<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<div class="container">
    <div style="min-width: 50%" class="container section">
        <form method="post">
            <h5>Профайл пользователя ${username}</h5>
            <hr>
            <h5>Университет и группа</h5>
            <hr>
        <#--Университет и его выбор-->
            <label class="mb-2" for="inputState"><strong>Университет: </strong><#if univer??>${univer.name}<#else>не
                выбран</#if></label>
            <div class="mb-3">
                <a class="btn btn-primary mb-3" data-toggle="collapse" href="#collapseAddMessage" role="button"
                   aria-expanded="false"
                   aria-controls="collapseExample">Выбрать университет</a>

                <div class="collapse" id="collapseAddMessage">
                    <select id="inputState" class="form-control" name="university" id="university">
                        <option selected>Выбери...</option>
        <#list universities as university>
        <option>${university.name}</option>
        </#list>
                    </select>
                    <button type="submit" class="btn btn-primary mt-3">Выбрать</button>
                </div>
            </div>
        <#--Университет и его выбор-->

        <#--Группа и ее выбор-->
            <label class="mb-2" for="inputState"><strong>Группа: </strong><#if teacher??>${teacher.name}<#else>не
                выбрана</#if></label>
            <div class="mb-3">
                <a class="btn btn-primary mb-3" data-toggle="collapse" href="#collapseAddGroup" role="button"
                   aria-expanded="false"
                   aria-controls="collapseExample">Выбрать группу</a>

                <div class="collapse" id="collapseAddGroup">
 <#if groups??>
     <select id="inputState" class="form-control" name="" id="">
         <option selected>Выбери...</option>
        <#list groups as group>
        <option>${group.name}</option>
        </#list>
     </select>
     <button type="submit" class="btn btn-primary mt-3">Выбрать</button>
 <#else>
                У университета еще нет групп
 </#if>
                </div>
            </div>
        <#--Группа и ее выбор-->

            <hr>
            <h5>Данные пользователя</h5>
            <hr>
        <#--Данные юзверя-->
            <div class="row">
                <div class="container">
                    <label>Сменить пароль:</label>
                    <label>Сменить пароль:</label>
                    <label>Сменить пароль:</label>
                    <label>Сменить пароль:</label>
                    <label>Сменить пароль:</label>
                </div>

            <#--Пароль-->
                <div class="container html-editor-align-left col-6">
                <#--Старый пароль-->
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></div>
                        </div>
                        <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                               name="password" id="password" placeholder="Старый пароль">
                    </div>
                <#--Старый пароль-->

                <#--Новый пароль-->
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></div>
                        </div>
                        <input type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                               name="password2" id="password2" placeholder="Новый пароль">
                    </div>
                <#--Новый пароль-->
                </div>
            </div>

        <#--Данные юзверя-->

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary mt-3">Сохранить</button>
        </form>
    </div>
</div>

</@c.page>