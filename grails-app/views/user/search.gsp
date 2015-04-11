<html>

<head>
    <meta name='layout' content='main'/>
    <title>Users</title>
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
                <g:form action='userSearch' name='userSearchForm' class="form-horizontal">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">Username</label>

                        <div class="col-sm-8">
                            <input class="form-control" id="username" name="username" placeholder="Search"
                                   value="${params.username ?: ""}"/>
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
                                    <th class="col-sm-4">
                                        Username
                                    </th>
                                    <th class="col-sm-6">
                                        Email
                                    </th>
                                    <th class="col-sm-2">
                                        Enabled
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${results}" var="user">
                                    <tr>
                                        <td>
                                            <g:link action="edit" id="${user.id}">
                                                ${fieldValue(bean: user, field: "username")}
                                            </g:link>
                                        </td>
                                        <td>
                                            <g:link action="edit" id="${user.id}">
                                                ${fieldValue(bean: user, field: "email")}
                                            </g:link>
                                        </td>
                                        <td>
                                            <g:link action="edit" id="${user.id}">
                                                <g:formatBoolean boolean="${user.enabled}"/>
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

<script>
    $(document).ready(function () {
        $("#username").focus().autocomplete({
            minLength: 3,
            cache: false,
            source: "${createLink(action: 'ajaxUserSearch')}"
        });
    });

    <s2ui:initCheckboxes/>

</script>

</body>
</html>
