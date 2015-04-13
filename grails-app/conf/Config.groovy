// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
                      all          : '*/*', // 'all' maps to '*' or the first available format in withFormat
                      atom         : 'application/atom+xml',
                      css          : 'text/css',
                      csv          : 'text/csv',
                      form         : 'application/x-www-form-urlencoded',
                      html         : ['text/html', 'application/xhtml+xml'],
                      js           : 'text/javascript',
                      json         : ['application/json', 'text/json'],
                      multipartForm: 'multipart/form-data',
                      rss          : 'application/rss+xml',
                      text         : 'text/plain',
                      hal          : ['application/hal+json', 'application/hal+xml'],
                      xml          : ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}


grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart = false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

// configure passing transaction's read-only attribute to Hibernate session, queries and criterias
// set "singleSession = false" OSIV mode in hibernate configuration after enabling
grails.hibernate.pass.readonly = false
// configure passing read-only to OSIV session by default, requires "singleSession = false" OSIV mode
grails.hibernate.osiv.readonly = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // grails.serverURL = "http://www.chalkapp.com"
    }
}

// log4j configuration
log4j.main = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error 'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'

    warn 'grails.app.services.grails.plugin.springsecurity.ui.SpringSecurityUiService'

    info "grails.app"
}

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'chalkboard.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'chalkboard.UserRole'
grails.plugin.springsecurity.authority.className = 'chalkboard.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        '/'              : ['permitAll'],
        '/index'         : ['permitAll'],
        '/index.gsp'     : ['permitAll'],
        '/assets/**'     : ['permitAll'],
        '/**/js/**'      : ['permitAll'],
        '/**/css/**'     : ['permitAll'],
        '/**/images/**'  : ['permitAll'],
        '/**/favicon.ico': ['permitAll'],
        '/monitoring'    : ['permitAll'],
        '/monitoring/**' : ['permitAll']
]


grails.plugin.springsecurity.ui.register.postRegisterUrl = '/'
grails.plugin.springsecurity.ui.register.emailFrom = 'noreply@chalkbapp.com'
grails.plugin.springsecurity.ui.register.emailSubject = 'chalkboard - Valider votre email'
grails.plugin.springsecurity.ui.register.defaultRoleNames = ['ROLE_USER']
grails.plugin.springsecurity.ui.password.validationRegex = '^.*(?=.*[a-zA-Z\\d]).*$' // Au moins quelques caractères
grails.plugin.springsecurity.ui.password.minLength = 4
grails.plugin.springsecurity.ui.password.maxLength = 64
grails.plugin.springsecurity.userLookup.usernamePropertyName = 'email'
grails.plugin.springsecurity.logout.postOnly = false

grails {
    plugin {
        springsecurity {

            ui {

                encodePassword = false

                register {
                    emailBody = '''\
Bonjour $user.username,<br/>
<br/>
Vous venez de créer un compte sur <a href="http://www.chalkapp.com">chalkboard</a> et nous vous en remercions !<br/>
<br/>
Merci de <a href="$url">cliquer ici</a> pour terminer la procédure d'enregistrement.
<br/>
Merci de ne pas répondre à ce message automatique.
'''
                    emailFrom = 'chalkboard <noreply@chalkapp.com>'
                    emailSubject = 'chalkboard - Création de compte'
                    defaultRoleNames = ['ROLE_USER']
                    postRegisterUrl = null // use defaultTargetUrl if not set
                }

                forgotPassword {
                    emailBody = '''\
Hi $user.username,<br/>
<br/>
Vous, ou quelqu'un se faisant passer pour vous, venez de faire une demande de mise à zéro de votre mot de passe sur <a href="http://www.chalkboard.net">chalkboard</a>.<br/>
<br/>
SI vous n'avez pas fait cette demande, alors ignorez ce message et supprimez le, aucun changement de sera appliqué à votre compte.<br/>
<br/>
Si vous êtes bien celui qui a fait la demande, alors <a href="$url">cliquez ici</a> pour remettre à zéro votre mot de passe.
<br/>
Merci de ne pas répondre à ce message automatique.
'''
                    emailFrom = 'chalkboard <noreply@chalkbapp.com>'
                    emailSubject = 'chalkboard - Réinitialisation du mot de passe'
                    postResetUrl = null // use defaultTargetUrl if not set
                }
            }
        }
    }
}

grails {
    mail {
        host = "ssl0.ovh.net"
        port = 465
        username = "noreply@chalkbapp.com"
        password = "5O2ntH7p40Xl18JOqw"
        props = ["mail.smtp.auth"                  : "true",
                 "mail.smtp.socketFactory.port"    : "465",
                 "mail.smtp.socketFactory.class"   : "javax.net.ssl.SSLSocketFactory",
                 "mail.smtp.socketFactory.fallback": "true"]
        contact = "adrien@chalkboard.education"
        subscribe = "adrien@chalkboard.education"
        noreply = "noreply@chalkbapp.com"
    }
}

// Pour les soucis de pagination avec Bootstrap
grails.plugins.twitterbootstrap.fixtaglib = true

grails.cache.config = {
    defaultCache {
        maxElementsInMemory 10000
        eternal false
        timeToIdleSeconds 86400
        timeToLiveSeconds 86400
        overflowToDisk false
        maxElementsOnDisk 0
        diskPersistent false
        diskExpiryThreadIntervalSeconds 120
        memoryStoreEvictionPolicy 'LRU'
    }

    cache {
        name 'chalkboard'
        eternal false
        overflowToDisk true
        maxElementsInMemory 10000
        maxElementsOnDisk 10000000
    }

    domain {
        name 'chalkboard.Role'
        eternal false
        overflowToDisk false
        path "${System.getProperty("user.home")}/.ehcache"
    }

    diskStore {
        path "${System.getProperty("user.home")}/.ehcache"
    }
}

beans {
    cacheManager {
        shared = true
    }
}
