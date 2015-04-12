<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>College selection</title>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        SELECT YOUR COLLEGE
        <br/>
        IN THIS LIST
    </g:render>

    <div class="row">
        <div class="col-sm-2 text-center margin-top-20">
            <g:render template="/templates/backHome"/>
        </div>

        <div class="col-sm-6">

            <g:render template="/templates/flashMessage"/>

            <div class="panel panel-default">
            <div class="panel-body">
                <g:form action="updateCollege" role="form">
                    <div class="form-group">
                        <label for="college">College</label>
                        <g:select class="form-control" name="college" from="${colleges}" optionKey="id"
                                  optionValue="name"/>
                    </div>


                    <div class="form-group">
                        <button class="btn btn-primary" type="submit">
                            OK
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