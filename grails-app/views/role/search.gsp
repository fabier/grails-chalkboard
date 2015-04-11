<html>

<head>
    <meta name='layout' content='main'/>
    <title><g:message code='spring.security.ui.role.search'/></title>
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
                <g:form action='roleSearch' name='roleSearchForm' class="form-horizontal">
                    <div class="form-group">
                        <label for="authority" class="col-sm-2 control-label">Role</label>

                        <div class="col-sm-8">
                            <input class="form-control" id="authority" name="authority" placeholder="Search"
                                   value="${params.authority ?: ""}"/>
                        </div>

                        <div class="col-sm-2">
                            <button type="submit" class="btn btn-primary">
                                Search
                            </button>
                        </div>
                    </div>
                </g:form>
            </div>

            <g:if test="${searched}">
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <table class="table table-striped small">
                                <thead>
                                <tr>
                                    <th class="col-sm-6">
                                        Authority
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${results}" var="role">
                                    <tr>
                                        <td>
                                            <g:link action="edit" id="${role.id}">
                                                ${fieldValue(bean: role, field: "authority")}
                                            </g:link>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>

                            <g:if test="${totalCount > results.size()}">
                                <nav class="text-center">
                                    <ul class="pagination">
                                        <g:paginate next="Forward" prev="Back" maxsteps="0" action="search"
                                                    total="${totalCount}"/>
                                    </ul>
                                </nav>
                            </g:if>
                        </div>
                    </div>
                </div>
            </g:if>
        </div>
    </div>
</div>
</body>
</html>
