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

        <div class="col-sm-10 padding-leftright-20">
            <div class="row">

                <g:render template="/templates/flashMessage"/>

                <div class="col-sm-6">
                    <g:form action='countrySearch' name='countrySearchForm' class="form-horizontal">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Name</label>

                            <div class="col-sm-8">
                                <input class="form-control" id="name" name="name" placeholder="Search"
                                       value="${params.name ?: ""}"/>
                            </div>

                            <div class="col-sm-2">
                                <button type="submit" class="btn btn-primary">
                                    Search
                                </button>
                            </div>
                        </div>
                    </g:form>
                </div>

                <div class="col-sm-6">
                    <g:link controller="country" action="create" class="btn btn-success pull-right">
                        <i class="glyphicon glyphicon-plus-sign"></i>
                        Create country
                    </g:link>
                </div>
            </div>

            <g:if test="${searched}">
                <div class="row">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <table class="table table-striped small">
                                <thead>
                                <tr>
                                    <th class="col-sm-12">
                                        Name
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${results}" var="country">
                                    <tr>
                                        <td>
                                            <g:link action="edit" id="${country.id}">
                                                ${fieldValue(bean: country, field: "name")}
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
