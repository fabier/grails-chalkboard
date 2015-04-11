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

            <div class="alert alert-danger">
                <div class='errors'><g:message code="springSecurity.denied.message"/></div>
            </div>
        </div>

        <div class="col-md-2"></div>
    </div>
</div>
</body>
