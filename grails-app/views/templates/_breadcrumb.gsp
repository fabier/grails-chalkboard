<ol class="breadcrumb">
    <li>
        <g:link uri="/">
            Accueil
        </g:link>
    </li>
    <g:each in="${breadcrumb}" var="item">
        <li>
            <a href="${item[1]}">
                ${item[0]}
            </a>
        </li>
    </g:each>
    <li class="active">
        ${pageTitle}
    </li>
</ol>