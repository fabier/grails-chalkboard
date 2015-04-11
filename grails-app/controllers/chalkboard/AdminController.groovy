package chalkboard

import grails.plugin.springsecurity.annotation.Secured

@Secured("hasRole('ROLE_ADMIN')")
class AdminController {

    def index() {
        redirect controller: "user", action: "search"
    }
}
