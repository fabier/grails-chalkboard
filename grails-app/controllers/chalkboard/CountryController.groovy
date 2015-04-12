package chalkboard

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured("hasRole('ROLE_ADMIN')")
class CountryController {

    SpringSecurityService springSecurityService

    def search() {
        def countries = Country.listOrderByName()
        render view: 'search', model: [results   : countries,
                                       totalCount: countries.size(),
                                       name      : params.name,
                                       searched  : true]
    }

    def edit(long id) {
        Country country = Country.get(id)
        render view: "edit", model: [country: country]
    }

    def update(long id) {
        Country country = Country.get(id)
        bindData(country, params)
        if (country.validate()) {
            country.save()
            flash.message = "Update successful"
            redirect action: "edit", id: id
        } else {
            flash.error = "Impossible to update college"
            redirect action: "edit", id: id
        }
    }

    def countrySearch() {
        def countries = Country.findAllByNameIlike("%${params.name}%", [sort: "name"])
        int totalCount = countries.size()
        render view: 'search', model: [results   : countries,
                                       totalCount: totalCount,
                                       name      : params.name,
                                       searched  : true]
    }

    def create() {
        render view: "create"
    }

    def save() {
        User user = springSecurityService.currentUser
        Country country = new Country(name: params.name, creator: user)
        if (country.validate()) {
            country.save()
            flash.message = "Country creation successful"
            redirect action: "edit", id: country.id
        } else {
            flash.error = "Error creating country"
            redirect action: "create"
        }
    }

    def delete(long id) {
        Country country = Country.get(id)
        country.delete()
        flash.message = "Country deleted"
        redirect action: "search"
    }
}
