<!DOCTYPE html>
<html>
<head>
    <title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
    <meta name="layout" content="main">
    <asset:stylesheet src="errors.css"/>
</head>

<body>
<div class="container">
    <g:renderException exception="${exception}"/>
</div>
</body>
</html>
