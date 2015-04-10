<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Subscribe</title>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        SUBSCRIBE,
        <br/>
        SO WE STAY IN TOUCH !
    </g:render>


    <div class="row">
        <div class="col-sm-2 text-center margin-top-20">
            <g:render template="/templates/backHome"/>
        </div>

        <div class="col-sm-6">
            <g:render template="/templates/flashMessage"/>

            <g:form controller="common" action="sendMailSubscribe" role="form">

                <div class="form-group">
                    <label for="email">Email</label>

                    <sec:ifLoggedIn>
                        <input type="email" class="form-control" id="email" name="email"
                               placeholder="Your email adress"
                               value="${sec.loggedInUserInfo(field: "username")}"/>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <input type="email" class="form-control" id="email" name="email"
                               placeholder="Your email adress" value="${params.email ?: ""}"/>
                    </sec:ifNotLoggedIn>
                </div>

                <div class="form-group">
                    <label for="name">Name</label>
                    <input class="form-control" id="name" name="name" placeholder="Your name"
                           value="${params.name ?: ""}"/>
                </div>

                <div class="form-group">
                    <label for="message">Why did you join Chalkboard? Tell us about you :)</label>
                    <textarea class="form-control" id="message" name="message" rows="5"
                              placeholder="Type your message here">${params.message ?: ""}</textarea>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary pull-right">
                        Subscribe
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>