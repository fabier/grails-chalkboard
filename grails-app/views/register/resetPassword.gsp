<html>

<head>
    <title><g:message code='spring.security.ui.resetPassword.title'/></title>
    <meta name='layout' content='register'/>
</head>

<body>

<div class="container padding-top-20">
    <g:render template="/templates/pageHeader">
        RESET PASSWORD,
        <br/>
        RECOVER YOUR ACCOUNT.
    </g:render>

    <div class="row">
        <div class="col-sm-2 text-center margin-top-20">
            <g:render template="/templates/backHome"/>
        </div>

        <div class="col-sm-8">

            <g:render template="/templates/flashMessage"/>

            <s2ui:form width='475' height='250' elementId='resetPasswordFormContainer'
                       titleCode='spring.security.ui.resetPassword.header' center='true'>

                <g:form action='resetPassword' name='resetPasswordForm' autocomplete='off'>
                    <g:hiddenField name='t' value='${token}'/>
                    <div class="sign-in">

                        <br/>
                        <h4><g:message code='spring.security.ui.resetPassword.description'/></h4>

                        <table>
                            <s2ui:passwordFieldRow name='password' labelCode='resetPasswordCommand.password.label'
                                                   bean="${command}"
                                                   labelCodeDefault='Password' value="${command?.password}"/>

                            <s2ui:passwordFieldRow name='password2' labelCode='resetPasswordCommand.password2.label'
                                                   bean="${command}"
                                                   labelCodeDefault='Password (again)' value="${command?.password2}"/>
                        </table>

                        <s2ui:submitButton elementId='reset' form='resetPasswordForm'
                                           messageCode='spring.security.ui.resetPassword.submit'/>

                    </div>
                </g:form>

            </s2ui:form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#password').focus();
    });
</script>

</body>
</html>
