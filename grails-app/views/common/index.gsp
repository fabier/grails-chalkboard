<html>
<head>
    <meta name="layout" content="main"/>
    <title>Chalkboard</title>
    <asset:stylesheet src="homepage.css"/>
</head>

<body>

<div class="container homepage-block-1">
    <div class="jumbotron">
        <div class="container padding-under-nav">
            <h4>CREATE YOUR CURRICULUM.</h4>
            <h4>CREATE YOUR ENVIRONMENT.</h4>
            <h4>CREATE YOUR DESTINY.</h4>
            <br/>
            <br/>

            <p>
                <g:link class="link btn btn-primary" controller="common" action="subscribe"
                        params="[type: 'student']">SUBSCRIBE AS A STUDENT</g:link><g:link class="link btn btn-primary"
                                                                                          controller="common"
                                                                                          action="subscribe"
                                                                                          params="[type: 'student']">></g:link>
            </p>

            <p>
                <g:link class="link btn btn-primary" controller="common" action="subscribe"
                        params="[type: 'teacher']">YOU'RE A TEACHER OR AN INSTITUTE</g:link><g:link
                        class="link btn btn-primary" controller="common" action="subscribe"
                        params="[type: 'student']">></g:link>
            </p>
        </div>
    </div>
</div>

<div class="container homepage-block-2">
    <div class="row">
        <div class="col-sm-6 homepage-module">
            <g:render template="/templates/homepageModule"
                      model="[image: 'marker.svg', head: 'USE IT WHATEVER YOUR CONNEXION',
                              text : 'CHALKBOARD works on any device (any computer, mobile or smartphone) and uses very low data.   Connect when you want, but use it every time.']"/>
        </div>

        <div class="col-sm-6 homepage-module">
            <g:render template="/templates/homepageModule"
                      model="[image: 'graph.svg', head: 'MEET FELLOW STUDENTS AROUND YOU',
                              text : 'Share your knowledge with other enthusiasts of your courses and build your projects with a community of students living around you.']"/>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6 homepage-module">
            <g:render template="/templates/homepageModule"
                      model="[image: 'pen.svg', head: 'HANDLE IT LIKE A CHALKBOARD',
                              text : 'Upload you content and create your online classroom by yourself, with an easy-to-handle application.']"/>
        </div>

        <div class="col-sm-6 homepage-module">
            <g:render template="/templates/homepageModule"
                      model="[image: 'award.svg', head: 'GET THE DEGREE OF YOUR DREAM',
                              text : 'Attend the courses you are interested in, learn what you want to learn, and get the degree you need, without go to the campus when you cannot go.']"/>
        </div>
    </div>
</div>

<div class="container-fluid homepage-block-3">
    <div class="container">
        <div class="col-sm-6">
            <p>GET MORE STUDENTS AT A LOWER COST.</p>
            <small>
                Online distance learning is the best solution for universities and institutes that face difficulties to grow and host new students. Contact us to calculate how much you can save using Chalkboard.​
            </small>
            <br/>
            <br/>

            <div class="text-center">
                <asset:image src="devices.png"/>
            </div>
        </div>

        <div class="col-sm-6">
            <div class="row display-block">
                %{--<div class="hidden-sm hidden-xs">--}%
                <asset:image src="screenshot.jpg" class=""/>
                <asset:image src="screenshot2.jpg" class="hidden-sm hidden-xs"/>
                %{--</div>--}%
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="pull-right">
                        <g:link class="link btn btn-primary" controller="common" action="contact">
                            CONTACT US
                        </g:link><g:link class="link btn btn-primary" controller="common" action="contact">
                            >
                        </g:link>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<div class="container-fluid homepage-block-4">
    <div class="container">
        <div class="row">
            <div class="col-sm-4 col-sm-offset-4 follow-us text-center display-block">
                Follow us :
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12 text-center display-block">
                <a href="http://www.facebook.com/mychalkboard" class="padding-leftright-10">
                    <asset:image src="facebook.png"/>
                </a>
                <a href="http://www.twitter.com/teamchalkboard" class="padding-leftright-10">
                    <asset:image src="twitter.png"/>
                </a>
                <a href="https://www.linkedin.com/company/chalkboard-education" class="padding-leftright-10">
                    <asset:image src="linkedin.png"/>
                </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>