<html>
<head>
    <meta name='layout' content='main'/>
    <title>Countries</title>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        ADMINISTRATION
        <br/>
        COUNTRIES
    </g:render>

    <div class="row">
        <div class="col-sm-2 text-center margin-top-20">
            <g:render template="/templates/lateralMenuAdmin"/>
        </div>

        <div class="col-sm-6 padding-leftright-20">
            <div class="row">

                <g:render template="/templates/flashMessage"/>

                <g:form action="save" name='collegeSaveForm' class="button-style form-horizontal">
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Name</label>

                        <div class="col-sm-8">
                            <input class="form-control" id="name" name="name" placeholder="Name"
                                   value=""/>
                        </div>

                        <div class="col-sm-2">
                            <button type="submit" class="btn btn-primary">
                                Save
                            </button>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>

%{--<g:if test='${canRunAs}'>--}%
%{--<form name='runAsForm' action='${request.contextPath}/j_spring_security_switch_user' method='POST'>--}%
%{--<g:hiddenField name='j_username' value="${user.username}"/>--}%
%{--<input type='submit' class='s2ui_hidden_button'/>--}%
%{--</form>--}%
%{--</g:if>--}%

</body>
</html>
