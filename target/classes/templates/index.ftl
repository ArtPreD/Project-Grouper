<#import "parts/common.ftl" as c>
<@c.page>

<div class="container">

    <!-- header start -->
    <div align="center" id="header" class="section">
        <img  alt="" class="img-circle" width="215" height="200" src="http://i.piccy.info/i9/ecc5c37c5d2959c4b6046d9386b4bdc0/1526979635/122760/1246012/DSC_7501.jpg">
        <h4><strong>Артем Предводителев</strong></h4>
    </div>
    <!-- header end -->

    <!-- About Me section start -->
    <div class="section">
        <h1 align="center"><span class="about">Обо мне</span></h1>
        <hr>
        <p>
            Привет, меня зовут <strong>Артем</strong>. Программирование изменило мою жизнь. Когда-то давно
            я и подумать не мог, что стану программистом. Сколько ни пытались меня учить этому в школе или
            институте - ничего из этого не выходило. Я или не хотел понимать, или боялся, но на программистов
            смотрел с восхищением, эти люди с компьютерами творили чудеса. Компьютеры делали все, что они хотели!
        </p>
        <p>
            Шли годы, прошла учеба, началась работа. Я реализовывал себя в разных сферах, но я не чувствовал,
            что  занимаюсь тем, чем бы хотел заниматься всю жизнь. И как-то раз у меня появилось время
            попробовать что-то новое. И тут я вспомнил о программировании. Мое изучение началось с выбора языка
            программирования. Я долго размышлял, что же я, все таки, хочу делать. И я остановился на языке
            <strong>Java</strong>. Почему именно он? Мне нравится его кроссплатформенность, у него  хорошая
            документация и огромное сообщество, готовое помочь советом в трудную минуту. Еще я полюбил <strong>Java</strong>
            за его универсальность. Вчера ты писал десктопные программы, сегодня игры и приложеня для телефонов и планшетов,
            а завтра уже веб приложения. Как это, например  :)
        </p>
        <p>
            Сегодня хочу показать вам приложение <strong>Grouper</strong>. Может, оно и не инновационное, но, возможно,
            кому-то и будет полезное. Лично для меня, оно стало кладезем новой информации и бесценным опытом.
            И пройдя этот путь, я хочу с уверенностью заявить - это то, чем я хочу заниматься в этой жизни.
        </p>
        <p><strong>Быть программистом!</strong></p>
    </div>
    <!-- About Me section end -->


    <!-- My Skills section start -->
    <#--<div class="section">-->
        <#--<h1><span>My Skills</span></h1>-->
        <#--<ul>-->
            <#--<li>HTML <br />-->
                <#--<progress min="0" max="100" value="80"></progress>-->
            <#--</li>-->
            <#--<li>JavaScript <br />-->
                <#--<progress min="0" max="100" value="50"></progress>-->
            <#--</li>-->
            <#--<li>Python <br />-->
                <#--<progress min="0" max="100" value="30"></progress>-->
            <#--</li>-->
        <#--</ul>-->
    <#--</div>-->
    <!-- My Skills section end -->

    <!-- About Project section start -->
    <div class="section">
        <h1 align="center"><span class="about">О проекте</span></h1>
        <hr>
        <p>
            Что такое "Grouper"? Начнем с самого начала. Идея проекта родилась, когда я учился в IT школе
            <a href="https://lemon.school"><strong>Lemon School</strong></a>. "Grouper" был моим финальным заданием.
            Правда, тогда его функционал был скуден, и разрабатывался он как приложения для Android. Сейчас же это web-приоложение.
            Суть приложения не нова. Это что-то наподобие социальной сети для студентов. В базе хранится список университетов.
            Учитель выбирает свой университет, и создает группу. У группы есть список студентов, расписание группы, дисциплины.
            Также у каждой группы есть своя "стена", где каждый участник группы может публиковать сообщения. Стена видна всем
            участникам группы.
        <p>Учитель вправе добавлять или удалять студентов из группы, удалять сообщения со стены. Также ему доступен список всех
            участников группы с подробной информацией о каждом (адрес, телефон, оценки).
        </p>
        <p>
            Студент же может после регистрации выбрать свой университет, группу и отправить заявку на вступление. После одобрения
            заявки учителем группы студент становится ее участником. Он может видеть стену группы, оставлять сообщения не ней, ему доступно
            рассписание группы. Дисциплины группы будут добавлены студенту в зачетную книжку.
        </p>
        <strong>Технологии:</strong>
        <ul>
            <li>Spring boot
                <ul>
                    <li>security</li>
                    <li>freemarker</li>
                    <li>mail</li>
                    <li>session-jdbc</li>
                </ul>
            </li>
            <li>Hibernate</li>
            <li>Postgres</li>
            <li>Bootstrap</li>
            <li>HTML</li>
            <li>CSS</li>
        </ul>
        </p>
        <p>
            Исходный код проекта можно посмотреть на <a href="">GitHub</a>. Так как у Gruoper'a есть иерархия прав
            (студент, учитель), то при создании пользователя будет установлен статус "сутдент". Чтобы посмотреть, что доступно
            учителю по <a href="">ссылке</a> будет  информации об уже созданных аккаунтах со статусом "учитель".
        </p>
    </div>
    <!-- About Project section end -->

    <!-- Contacts section start -->
    <div align="center" class="section" id="contacts">
        <h1><span>Контакты</span></h1>
        <hr>
        <div>
        <p><strong>Email: </strong> artem.predvoditelev@gmail.com</p>
        <p><strong>Telephone: </strong> +38(093)-60-20-186</p>
        <p><strong>Github: </strong> <a href="https://github.com/ArtPreD/">github.com/ArtPreD</a></p>
        </div>
        <hr>
    </div>
    <!-- Contacts section end -->
</div>
</@c.page>