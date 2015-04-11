package chalkboard

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import grails.util.GrailsNameUtils
import org.springframework.dao.DataIntegrityViolationException

@Secured("hasRole('ROLE_ADMIN')")
class RoleController extends grails.plugin.springsecurity.ui.RoleController {

    @Secured("denyAll")
    def create() {
        [role: lookupRoleClass().newInstance(params)]
    }

    @Secured("denyAll")
    def save() {
        def role = lookupRoleClass().newInstance(params)
        if (!role.save(flush: true)) {
            render view: 'create', model: [role: role]
            return
        }

        flash.message = "${message(code: 'default.created.message', args: [message(code: 'role.label', default: 'Role'), role.id])}"
        redirect action: 'edit', id: role.id
    }

    def edit(long id) {
        String upperAuthorityFieldName = GrailsNameUtils.getClassName(
                SpringSecurityUtils.securityConfig.authority.nameField, null)

        def role = params.name ? Role.findByAuthority(params.name):null
        if (!role) role = Role.get(id)
        if (!role) return

        setIfMissing 'max', 10, 100

        def roleClassName = GrailsNameUtils.getShortName(lookupRoleClassName())
        def userField = GrailsNameUtils.getPropertyName(GrailsNameUtils.getShortName(lookupUserClassName()))

        def users = lookupUserRoleClass()."findAllBy$roleClassName"(role, params)*."$userField"
        int userCount = lookupUserRoleClass()."countBy$roleClassName"(role)

        [role: role, users: users, userCount: userCount]
    }

    def update(long id) {
        Role role = Role.get(id)
        if (!role) return
        if (!versionCheck('role.label', 'Role', role, [role: role])) {
            return
        }

        if (!springSecurityService.updateRole(role, params)) {
            render view: 'edit', model: [role: role]
            return
        }

        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'role.label', default: 'Role'), role.id])}"
        redirect action: 'edit', id: role.id
    }

    @Secured("denyAll")
    def delete() {
        def role = findById()
        if (!role) return

        try {
            lookupUserRoleClass().removeAll role
            springSecurityService.deleteRole(role)
            flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'role.label', default: 'Role'), params.id])}"
            redirect action: 'search'
        }
        catch (DataIntegrityViolationException e) {
            flash.error = "${message(code: 'default.not.deleted.message', args: [message(code: 'role.label', default: 'Role'), params.id])}"
            redirect action: 'edit', id: params.id
        }
    }

    def search() {
        render view: 'search', model: [results   : Role.all,
                                       totalCount: Role.count,
                                       authority : params.authority,
                                       searched  : true]
    }

    def roleSearch() {

        String authorityField = SpringSecurityUtils.securityConfig.authority.nameField

        boolean useOffset = params.containsKey('offset')
        setIfMissing 'max', 10, 100
        setIfMissing 'offset', 0

        String name = params.authority ?: 'ROLE_'
        def roles = doSearch(name, false, 10, params.int('offset'))
        if (roles.size() == 1 && !useOffset) {
            forward action: 'edit', params: [name: roles[0][authorityField]]
            return
        }

        String hql =
                "SELECT COUNT(DISTINCT r) " +
                        "FROM ${lookupRoleClassName()} r " +
                        "WHERE LOWER(r.${authorityField}) LIKE :name"
        int total = lookupRoleClass().executeQuery(hql, [name: "%${name.toLowerCase()}%"])[0]

        render view: 'search', model: [results   : roles,
                                       totalCount: total,
                                       authority : params.authority,
                                       searched  : true]
    }

    /**
     * Ajax call used by autocomplete textfield.
     */
    def ajaxRoleSearch() {

        def jsonData = []

        if (params.term?.length() > 1) {
            setIfMissing 'max', 10, 100
            setIfMissing 'offset', 0

            def names = doSearch(params.term, true, params.int('max'), params.int('offset'))
            for (name in names) {
                jsonData << [value: name]
            }
        }

        render text: jsonData as JSON, contentType: 'text/plain'
    }

    protected doSearch(String name, boolean nameOnly, Integer max, Integer offset) {
        String authorityField = SpringSecurityUtils.securityConfig.authority.nameField
        String hql =
                "SELECT DISTINCT ${nameOnly ? 'r.' + authorityField : 'r'} " +
                        "FROM ${lookupRoleClassName()} r " +
                        "WHERE LOWER(r.${authorityField}) LIKE :name " +
                        "ORDER BY r.${authorityField}"
        lookupRoleClass().executeQuery hql, [name: "%${name.toLowerCase()}%"], [max: max, offset: offset]
    }

    protected findById() {
        def role = lookupRoleClass().get(params.id)
        if (!role) {
            flash.error = "${message(code: 'default.not.found.message', args: [message(code: 'role.label', default: 'Role'), params.id])}"
            redirect action: 'search'
            return null
        }

        role
    }
}
