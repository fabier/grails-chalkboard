<html>

<head>
    <meta name='layout' content='main'/>
    <title><g:message code='spring.security.ui.register.title'/></title>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        REGISTER,
        <br/>
        CREATE YOUR ACCOUNT NOW.
    </g:render>

    <div class="row">
        <div class="col-sm-2 text-center margin-top-20">
            <g:render template="/templates/backHome"/>
        </div>

        <div class="col-sm-8">

            <g:render template="/templates/flashMessage"/>

            <div class="panel panel-default">
                %{--<div class="panel-heading">--}%
                %{--<h3 class="panel-title">--}%
                %{--<strong><g:message code="chalkboard.createAccount"/></strong>--}%
                %{--</h3>--}%
                %{--</div>--}%

                <div class="panel-body">
                    <g:form action='register' name='registerForm' role="form" class="form-horizontal">

                        <g:if test='${emailSent}'>
                            <g:message code='chalkboard.emailSent'/>
                        </g:if>
                        <g:else>
                            Remplissez le formulaire, puis cliquez sur "Créer un compte".

                            <br/>
                            <br/>

                            <div class="form-group ${hasErrors(bean: command, field: "username") {
                                "has-error has-feedback"
                            }}">
                                <label for="username" class="col-sm-4 control-label">
                                    <g:message code="chalkboard.username" default="Nom"/>
                                </label>

                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="username" name="username"
                                           placeholder="Nom Prénom" value="${command.username}"/>
                                    <g:hasErrors bean="${command}" field="username">
                                        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                                    </g:hasErrors>
                                </div>

                                <g:hasErrors bean="${command}" field="username">
                                    <div class="row">
                                        <span class="col-sm-offset-4 text-danger">
                                            Vous devez spécifier un nom d'utilisateur
                                        </span>
                                    </div>
                                </g:hasErrors>
                            </div>

                            <div class="form-group ${hasErrors(bean: command, field: "email") {
                                "has-error has-feedback"
                            }}">
                                <label for="email" class="col-sm-4 control-label">
                                    <g:message code="chalkboard.email" default="E-mail"/>
                                </label>

                                <div class="col-sm-6">
                                    <input type="email" class="form-control" id="email" name="email"
                                           placeholder="Votre adresse email" value="${command.email}"/>
                                    <g:hasErrors bean="${command}" field="email">
                                        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                                    </g:hasErrors>
                                </div>

                                <g:hasErrors bean="${command}" field="email">
                                    <div class="row">
                                        <span class="col-sm-offset-4 text-danger">
                                            Saisissez un email valide
                                        </span>
                                    </div>
                                </g:hasErrors>
                            </div>

                            <div class="form-group ${hasErrors(bean: command, field: "password") {
                                "has-error has-feedback"
                            }}">
                                <label for="password" class="col-sm-4 control-label">
                                    <g:message code="chalkboard.password" default="Mot de passe"/>
                                </label>

                                <div class="col-sm-6">
                                    <input type="password" class="form-control" id="password" name="password"
                                           placeholder="Votre mot de passe" value="${command.password}"/>
                                    <g:hasErrors bean="${command}" field="password">
                                        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                                    </g:hasErrors>
                                </div>

                                <g:hasErrors bean="${command}" field="password">
                                    <div class="row">
                                        <span class="col-sm-offset-4 text-danger">
                                            Saisissez un mot de passe (6 caractères min.)
                                        </span>
                                    </div>
                                </g:hasErrors>
                            </div>

                            <div class="form-group ${hasErrors(bean: command, field: "password2") {
                                "has-error has-feedback"
                            }}">
                                <label for="password2" class="col-sm-4 control-label">
                                    <g:message code="chalkboard.password2" default="Mot de passe\n(répéter)"/>
                                </label>

                                <div class="col-sm-6">
                                    <input type="password" class="form-control" id="password2" name="password2"
                                           placeholder="Répéter votre mot de passe" value="${command.password2}"/>
                                    <g:hasErrors bean="${command}" field="password2">
                                        <span class="glyphicon glyphicon-remove form-control-feedback"></span>
                                    </g:hasErrors>
                                </div>

                                <g:hasErrors bean="${command}" field="password2">
                                    <div class="row">
                                        <span class="col-sm-offset-4 text-danger">
                                            Les mots de passe ne correspondent pas
                                        </span>
                                    </div>
                                </g:hasErrors>
                            </div>

                            <div class="form-group">
                                <label for="password2" class="col-sm-4 control-label">
                                </label>

                                <div class="col-sm-8">
                                    <button type="submit" class="btn btn-primary">
                                        Créer un compte
                                    </button>
                                </div>
                            </div>
                        </g:else>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#username').focus();
    });
</script>

</body>
</html>
