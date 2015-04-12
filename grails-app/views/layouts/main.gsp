<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="apple-touch-icon" sizes="57x57" href="${assetPath(src: 'icons/apple-touch-icon-57x57.png')}">
    <link rel="apple-touch-icon" sizes="60x60" href="${assetPath(src: 'icons/apple-touch-icon-60x60.png')}">
    <link rel="apple-touch-icon" sizes="72x72" href="${assetPath(src: 'icons/apple-touch-icon-72x72.png')}">
    <link rel="apple-touch-icon" sizes="76x76" href="${assetPath(src: 'icons/apple-touch-icon-76x76.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'icons/apple-touch-icon-114x114.png')}">
    <link rel="apple-touch-icon" sizes="120x120" href="${assetPath(src: 'icons/apple-touch-icon-120x120.png')}">
    <link rel="icon" type="image/png" href="${assetPath(src: 'icons/favicon-32x32.png')}" sizes="32x32">
    <link rel="icon" type="image/png" href="${assetPath(src: 'icons/favicon-96x96.png')}" sizes="96x96">
    <link rel="icon" type="image/png" href="${assetPath(src: 'icons/favicon-16x16.png')}" sizes="16x16">
    <link rel="manifest" href="${assetPath(src: 'icons/manifest.json')}">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="theme-color" content="#ffffff">
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav spinnaker">
                <li class="${controllerName == 'common' && actionName == "index" ? "active" : ""}">
                    <g:link uri="/">
                        Home
                    </g:link>
                </li>
            </ul>
            <ul class="nav navbar-nav pull-right spinnaker">
                <li class="${controllerName == 'common' && actionName == "about" ? "active" : ""}">
                    <g:link controller="common" action="about">
                        About
                    </g:link>
                </li>
                <li class="${controllerName == 'common' && actionName == "contact" ? "active" : ""}">
                    <g:link controller="common" action="contact">
                        Contact
                    </g:link>
                </li>
                <sec:ifLoggedIn>
                    <li class="dropdown ${controllerName in ['college', 'user', 'role', 'admin'] ? "active" : ""}">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-expanded="false">Mon compte <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <g:link controller="college">
                                    Mon compte
                                </g:link>
                            </li>
                            <sec:ifAllGranted roles="ROLE_ADMIN">
                                <li>
                                    <g:link controller="admin">
                                        Admin
                                    </g:link>
                                </li>
                            </sec:ifAllGranted>
                            <li>
                                <g:remoteLink controller="logout" method="post" asynchronous="false"
                                              onSuccess="location.href=${createLink(uri: "/")}">
                                    Logout
                                </g:remoteLink>
                            </li>
                        </ul>
                    </li>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <li class="${controllerName in ['login', 'register'] ? "active" : ""}">
                        <g:link controller="college">
                            Connexion
                        </g:link>
                    </li>
                </sec:ifNotLoggedIn>
            </ul>
        </div>
    </div>
</nav>

<g:layoutBody/>

<asset:javascript src="application.js"/>
</body>
</html>