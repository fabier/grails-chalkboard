<html>
<head>
    <meta name='layout' content='main'/>
    <title>Universities</title>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        ADMINISTRATION
        <br/>
        UNIVERSITIES
    </g:render>

    <div class="row">
        <div class="col-sm-2 text-center margin-top-20">
            <g:render template="/templates/lateralMenuAdmin"/>
        </div>

        <div class="col-sm-6 padding-leftright-20">
            <div class="row">

                <g:render template="/templates/flashMessage"/>

                <div class="alert alert-danger">
                    Attention, éditer une université est dangereux, faites attention à toute modification apportée.
                </div>

                <g:form action="update" id="${college?.id}" name='collegeEditForm' class="button-style form-horizontal">
                    <g:hiddenField name="id" value="${college?.id}"/>
                    <g:hiddenField name="version" value="${college?.version}"/>

                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">Name</label>

                        <div class="col-sm-8">
                            <input class="form-control" id="name" name="name" placeholder="Name"
                                   value="${college?.name ?: ""}"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="country" class="col-sm-2 control-label">Country</label>

                        <div class="col-sm-8">
                            <g:select name="country" from="${countries}" value="${college?.country.id}" optionKey="id"
                                      optionValue="name" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-primary">
                                Update
                            </button>

                            <g:link action="delete" id="${college.id}" class="btn btn-danger pull-right">
                                Delete
                            </g:link>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
