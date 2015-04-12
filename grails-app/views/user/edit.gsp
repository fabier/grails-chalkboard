<html>
<head>
    <meta name='layout' content='main'/>
    <title>User</title>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        ADMINISTRATION
        <br/>
        USERS
    </g:render>

    <div class="row">
        <div class="col-sm-2 text-center margin-top-20">
            <g:render template="/templates/lateralMenuAdmin"/>
        </div>

        <div class="col-sm-6 padding-leftright-20">
            <div class="row">

                <g:render template="/templates/flashMessage"/>

                <div class="alert alert-danger">
                    Attention, éditer un utilisateur est dangereux, soyez attentifs aux modifications apportées.
                </div>

                <g:form action="update" id="${user?.id}" name='userEditForm' class="button-style form-horizontal">
                    <g:hiddenField name="id" value="${user?.id}"/>
                    <g:hiddenField name="version" value="${user?.version}"/>

                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">Username</label>

                        <div class="col-sm-8">
                            <input class="form-control" id="username" name="username" placeholder="Username"
                                   value="${user?.username ?: ""}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email</label>

                        <div class="col-sm-8">
                            <input class="form-control" id="email" name="email" placeholder="email"
                                   value="${user?.email ?: ""}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">Password</label>

                        <div class="col-sm-8">
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="Password"
                                   value="${user?.password ?: ""}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-8 col-sm-offset-2">
                            <g:checkBox name="enabled" value="${user?.enabled}"/>
                            <label for="enabled">Enabled</label>
                        </div>
                    </div>

                    <g:each var="entry" in="${roleMap}">
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-2">
                                <g:checkBox name="${entry.key.authority}" value="${entry.value}"/>
                                <label for="${entry.key.authority}">${entry.key.authority.encodeAsHTML()}</label>
                            </div>
                        </div>
                    </g:each>

                    <div class="form-group">
                        <div class="col-sm-2">
                            <button type="submit" class="btn btn-primary">
                                Update
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
