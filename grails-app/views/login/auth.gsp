<html>

<head>
    <g:set var="hideLoginBlock" value="${true}" scope="request"/>
    <title><g:message code='spring.security.ui.login.title'/></title>
    <meta name='layout' content='main'/>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        LOGIN,
        <br/>
        WELCOME TO CHALKBOARD.
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
                        %{--<strong><g:message code="chalkboard.connexion"/></strong>--}%
                    %{--</h3>--}%
                %{--</div>--}%

                <div class="panel-body">
                    <form action='${postUrl}' method='POST' id="loginForm" name="loginForm" autocomplete='off'
                          class="form-horizontal">
                        <div class="form-group">
                            <label for="username" class="col-sm-4 control-label">
                                <g:message code="chalkboard.email" default="Email"/>
                            </label>

                            <div class="col-sm-6">
                                <input name="j_username" id="username" size="20" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="col-sm-4 control-label">
                                <g:message code="chalkboard.password" default="Mot de passe"/>
                            </label>

                            <div class="col-sm-6">
                                <input type="password" name="j_password" id="password" size="20" class="form-control"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-4">
                                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me'
                                       <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                                <label for='remember_me'>
                                    <g:message code="chalkboard.rememberMe" default="Rester connecté"/>
                                </label>
                            </div>

                        </div>

                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    <g:message code="chalkboard.login" default="Se connecter"/>
                                </button>
                                <g:link controller="register" action="index" class="btn btn-success pull-right">
                                    <g:message code="chalkboard.createAccount"/>
                                </g:link>
                                <br/>
                                <br/>
                                <g:link controller='register' action='forgotPassword' class="paddingleft10">
                                    <g:message code="chalkboard.forgotPassword" default="Mot de passe oublié ?"/>
                                </g:link>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#username').focus();
    });

    <s2ui:initCheckboxes/>

</script>

</body>
</html>
