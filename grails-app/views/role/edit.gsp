<html>

<head>
    <meta name='layout' content='main'/>
    <title>Role</title>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        ADMINISTRATION
        <br/>
        ROLES
    </g:render>

    <div class="row">
        <div class="col-sm-2 text-center margin-top-20">
            <g:render template="/templates/lateralMenuAdmin"/>
        </div>

        <div class="col-sm-6 padding-leftright-20">
            <div class="row">
                <div class="alert alert-danger">
                    Attention, éditer un role peut couper les droits à l'ensemble des utilisateurs, y compris vous même !
                    <br>
                    Soyez absolument sûrs de ce que vous faites avant de modifier un rôle !
                </div>

                <g:form action='update' class="form-horizontal" id="${role.id}">
                    <g:hiddenField name="id" value="${role?.id}"/>
                    <g:hiddenField name="version" value="${role?.version}"/>

                    <div class="form-group">
                        <label for="authority" class="col-sm-2 control-label">Role</label>

                        <div class="col-sm-8">
                            <input class="form-control" id="authority" name="authority" placeholder="Name"
                                   value="${role.authority ?: ""}"/>
                        </div>

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

</body>
</html>
