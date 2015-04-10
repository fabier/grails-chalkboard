<head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.denied.title"/></title>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        ACCESS DENIED
        <br/>
        YOU SHOULD NOT BE AROUND HERE...
    </g:render>

    <div class="row">
        <div class="col-sm-2 text-center margin-top-20">
            <g:render template="/templates/backHome"/>
        </div>

        <div class="col-sm-8">

            <g:render template="/templates/flashMessage"/>

            <div class="panel panel-danger">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Erreur
                    </h3>
                </div>

                <div class="panel-body">
                    <div class='errors'><g:message code="springSecurity.denied.message"/></div>
                </div>
            </div>
        </div>

        <div class="col-md-2"></div>
    </div>
</div>
</body>
