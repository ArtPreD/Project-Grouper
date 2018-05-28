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
            <label class="mb-2" for="inputState"><strong>Группа: </strong><#if group??>${group.name}<#else>не
                выбрана</#if></label>
            <#if !stat>
            <div class="mb-3">
                <a class="btn btn-primary mb-3" data-toggle="collapse" href="#collapseAddGroup" role="button"
                   aria-expanded="false"
                   aria-controls="collapseExample">Выбрать группу</a>
                <div class="collapse" id="collapseAddGroup">

 <#if groups??>
     <select id="inputState" class="form-control" name="group" id="group">
         <option selected>Выбери...</option>
        <#list groups as group>
        <option>${group.name}</option>
        </#list>
     </select>
     <button type="submit" class="btn btn-primary mt-3">Выбрать</button>
 <#else>
        <input value="Выбери..." id="group" name="group" hidden>
                У университета еще нет групп
 </#if>
                </div>
            </div>
            <#else>
                <h5>Ваша заявка на рассмотрении</h5>
            </#if>
        <#--Группа и ее выбор-->

            <hr>
            <h5>Данные пользователя</h5>
            <hr>
        <#--Данные юзверя-->

        <#--Смена пароля-->
                <div class="container">
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
        <#--Смена пароля-->

            <#--Email-->
            <div class="row">
                <label class="col-form-label ml-3 mr-5">Email:        </label>
                <div style="width: 547px" class="row">
                    <div class="input-group ml-5">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                        </div>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Почта" value="${user.email}" aria-describedby="inputGroupPrepend2">
                    </div>
                </div>
            </div>
            <#--Email-->

        <#--Данные юзверя-->

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary mt-3">Сохранить</button>
        </form>
    </div>
</div>

</@c.page>