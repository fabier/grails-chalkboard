<html>

<head>
    <g:set var="hideLoginBlock" value="${true}" scope="request"/>
    <meta name='layout' content='main'/>
    <title>Mot de passe perdu</title>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        FORGOT PASSWORD ?
        <br/>
        WE'RE HERE TO HELP
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
                        %{--<strong><g:message code="chalkboard.forgotPassword.title"/></strong>--}%
                    %{--</h3>--}%
                %{--</div>--}%

                <div class="panel-body">
                    <g:form controller="register" action="forgotPassword" class="form-horizontal" role="form"
                            method="POST">
                        <g:if test='${emailSent}'>
                            <br/>
                            <g:message code='spring.security.ui.forgotPassword.sent'/>
                        </g:if>
                        <g:else>
                            <div class="form-group">
                                <label for="username" class="col-md-4 control-label">
                                    <g:message code="chalkboard.email" default="Email"/>
                                </label>

                                <div class="col-md-4">
                                    <input name="username" id="username" size="20" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-4">
                                </div>

                                <div class="col-md-8">
                                    <button type="submit" class="btn btn-primary">
                                        Récupérer mon mot de passe
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
