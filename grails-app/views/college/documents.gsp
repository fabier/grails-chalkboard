<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>${college.name.toUpperCase()}</title>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        ${college.name.toUpperCase()}
        <br/>
        WELCOME !
    </g:render>

    <div class="row">
        <div class="col-sm-2 text-center margin-top-20">
            <g:render template="/templates/backHome"/>
            <g:render template="/templates/lateralMenu" model="[college: college]"/>
        </div>

        <div class="col-sm-6 padding-leftright-20">

            <g:render template="/templates/flashMessage"/>

            <g:if test="${documents.isEmpty()}">
                <div class="alert alert-info">
                    Pas de documents à ce jour pour ${college.name}.
                </div>
            </g:if>
            <g:else>
                <div class="panel panel-default spinnaker">
                    <div class="panel-body">
                        <table class="table table-hover small">
                            <thead>
                            <tr>
                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                    <th class="col-sm-10">Nom du fichier</th>
                                </sec:ifAllGranted>
                                <sec:ifNotGranted roles="ROLE_ADMIN">
                                    <th class="col-sm-8">Nom du fichier</th>
                                </sec:ifNotGranted>
                                <th class="col-sm-2">Download</th>
                                <sec:ifAllGranted roles="ROLE_ADMIN">
                                    <th class="col-sm-2">Supprimer</th>
                                </sec:ifAllGranted>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${documents}" var="document">
                                <tr>
                                    <td>
                                        <g:link controller="document" action="download" id="${document.id}">
                                            <g:truncate id="document-name-${document.id}" maxlength="30">
                                                ${document.name}
                                            </g:truncate>
                                        </g:link>
                                    </td>
                                    <td>
                                        <g:link controller="document" action="download" id="${document.id}">
                                            <i class="glyphicon glyphicon-download-alt"></i>
                                        </g:link>
                                    </td>
                                    <sec:ifAllGranted roles="ROLE_ADMIN">
                                        <td>
                                            <g:link controller="document" action="delete" id="${document.id}"
                                                    params="[collegeId: college.id]">
                                                <i class="glyphicon glyphicon-trash"></i>
                                            </g:link>
                                        </td>
                                    </sec:ifAllGranted>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>
            </g:else>
        </div>

        <div class="col-sm-4">
            <div class="panel panel-info">
                <div class="panel-heading">
                    Upload your files here
                </div>

                <div class="panel-body">
                    <g:form action="uploadDocument" class="dropzone" name="upload-document" id="${college.id}">
                        <div class="fallback">
                            <input name="file" type="file" multiple/>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>