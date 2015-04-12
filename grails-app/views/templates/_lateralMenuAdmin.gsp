<ul class="nav nav-pills nav-stacked lateral-menu">
    <li role="presentation" class="${controllerName == 'user' ? "active" : ""}">
        <g:link controller="user" action="search" class="lateral-menu">
            <i class="glyphicon glyphicon-user"></i>
            Utilisateurs
        </g:link>
    </li>
    <li role="presentation" class="${controllerName == 'role' ? "active" : ""}">
        <g:link controller="role" action="search" class="lateral-menu">
            <i class="glyphicon glyphicon-check"></i>
            Roles
        </g:link>
    </li>
    <li role="presentation" class="${controllerName == 'college' ? "active" : ""}">
        <g:link controller="college" action="search" class="lateral-menu">
            <i class="glyphicon glyphicon-book"></i>
            Universities
        </g:link>
    </li>
    <li role="presentation" class="${controllerName == 'country' ? "active" : ""}">
        <g:link controller="country" action="search" class="lateral-menu">
            <i class="glyphicon glyphicon-flag"></i>
            Countries
        </g:link>
    </li>
</ul>