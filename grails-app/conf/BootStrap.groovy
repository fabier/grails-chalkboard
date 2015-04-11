import chalkboard.*
import grails.plugin.springsecurity.SpringSecurityService

class BootStrap {
    SpringSecurityService springSecurityService

    def init = { servletContext ->
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: "ROLE_ADMIN").save(failOnError: true, flush: true)
        def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: "ROLE_USER").save(failOnError: true, flush: true)

        def adminUser = User.findByUsername('admin') ?: new User(username: 'admin', password: '5O2ntH7p40Xl18JOqw', email: "noreply@chalkbapp.com", enabled: true).save(failOnError: true, flush: true)
        if (!UserRole.findByUserAndRole(adminUser, adminRole)) {
            UserRole.create adminUser, adminRole, true
        }
        if (!UserRole.findByUserAndRole(adminUser, userRole)) {
            UserRole.create adminUser, userRole, true
        }

        Country southAfrica = findOrSaveFlushCountry("South Africa")
        Country ghana = findOrSaveFlushCountry("Ghana")

        College accra = findOrSaveFlushCollege("Accra University", ghana)
        College johannesburg = findOrSaveFlushCollege("Johannesburg University", southAfrica)
        College pretoria = findOrSaveFlushCollege("Pretoria University", southAfrica)

        DocumentType pdf = DocumentType.findOrSaveByNameAndExtension("PDF", "pdf")
        DocumentType doc = DocumentType.findOrSaveByNameAndExtension("WORD (.doc)", "doc")
        DocumentType docx = DocumentType.findOrSaveByNameAndExtension("WORD (.docx)", "docx")
    }

    College findOrSaveFlushCollege(String name, Country country) {
        College.findOrSaveByNameAndCountryAndCreator(name, country, User.admin())
    }

    def findOrSaveFlushCountry(String name) {
        Country.findByName(name) ?: new Country(name: name, creator: User.admin()).save(failOnError: true, flush: true)
    }

    def destroy = {

    }
}
