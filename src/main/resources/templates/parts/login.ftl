<#macro login path isRegisterForm>

<div class="container">
    <div class="row main-form">
        <form action="${path}" role="form" method="post">

            <h5 align="center"><#if isRegisterForm>Регистрация пользователя<#else>Вход в систему</#if></h5>

            <div align="center" class="col-auto row">
                <label for="inlineFormInputGroup">Имя пользователя</label>
                <div class="input-group mb-2">
                    <div class="input-group-prepend">
                        <div class="input-group-text"><i class="fa fa-users fa" aria-hidden="true"></i></div>
                    </div>
                    <input type="text" name="username" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                           id="username" placeholder="Имя пользователя" value="<#if user??>${user.username}</#if>">
                    <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
                    </#if>
                </div>
            </div>

            <div align="center" class="col-auto row">
                <label for="inlineFormInputGroup">Пароль</label>
                <div class="input-group mb-2">
                    <div class="input-group-prepend">
                        <div class="input-group-text"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></div>
                    </div>
                    <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" name="password" id="password" placeholder="Ваш пароль">
                <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
                </#if>
                </div>
            </div>

    <#if isRegisterForm>
    <div align="center" class="col-auto row">
        <label for="inlineFormInputGroup">Подтверждение пароля</label>
        <div class="input-group mb-2">
            <div class="input-group-prepend">
                <div class="input-group-text"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></div>
            </div>
            <input type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}" name="password2"
                   id="password2" placeholder="Повторите пароль">
            <#if password2Error??>
            <div class="invalid-feedback">

                ${password2Error}
            </div>
            </#if>
        </div>
    </div>
    <#--Имя-->
        <div align="center" class="col-auto row">
            <label for="inlineFormInputGroup">Имя</label>
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fa fa-address-card-o" aria-hidden="true"></i></div>
                </div>
                <input type="text" class="form-control ${(firstNameError??)?string('is-invalid', '')}" name="first_name" id="first_name" placeholder="Ваше имя">
                <#if firstNameError??>
                <div class="invalid-feedback">
                    ${firstNameError}
                </div>
                </#if>
            </div>
        </div>
    <#--Имя-->
    <#--Фамилия-->
    <div align="center" class="col-auto row">
        <label for="inlineFormInputGroup">Фамилия</label>
        <div class="input-group mb-2">
            <div class="input-group-prepend">
                <div class="input-group-text"><i class="fa fa-address-card-o" aria-hidden="true"></i></div>
            </div>
            <input type="text" class="form-control ${(lastNameError??)?string('is-invalid', '')}" name="last_name" id="last_name" placeholder="Ваша фамилия">
        <#if lastNameError??>
                <div class="invalid-feedback">
                    ${lastNameError}
                </div>
        </#if>
        </div>
    </div>
    <#--Фамилия-->
    <#--Почта-->
        <div align="center" class="col-auto row">
            <label for="inlineFormInputGroup">Почта</label>
            <div class="input-group mb-2">
                <div class="input-group-prepend">
                    <div class="input-group-text"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                </div>
                <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}" name="email" id="email" placeholder="Ваша почта"
                       value="<#if user??>${user.email}</#if>">
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
        </div>
    <#--Почта-->

        <div class="col-auto mb-3 mt-3">
            <div class="g-recaptcha" data-sitekey="6LcZfFoUAAAAAKCArft2F2wgcKC--RQ1RK4LslwL"></div>
        <#if captchaError??>
    <div class="alert alert-danger" role="alert">
        ${captchaError}
    </div>
        </#if>
        </div>
    </#if>

            <div align="center" class="col-auto mb-2 mt-2">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div><input class="btn btn-lg btn-primary btn-block login-button" type="submit"
                            value="<#if isRegisterForm>Зарегистрироваться<#else>Войти</#if>"></div>
            </div>

        <#if !isRegisterForm>
        <div align="center">
            <hr>
            Нет аккаунта? <a href="/registration">Зарегистрируйся</a>
        </div>
        </#if>
        </form>
    </div>
</div>



</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button type="submit" class="btn btn-primary">Выйти</button>
</form>
</#macro>
