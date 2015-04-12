package chalkboard

import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.authentication.dao.NullSaltSource
import grails.util.GrailsNameUtils
import org.springframework.dao.DataIntegrityViolationException

@Secured("hasRole('ROLE_ADMIN')")
class UserController extends grails.plugin.springsecurity.ui.UserController {

    def saltSource
    def userCache

    @Secured("denyAll")
    def create() {
        def user = lookupUserClass().newInstance(params)
        [user: user, authorityList: sortedRoles()]
    }

    @Secured("denyAll")
    def save() {
        def user = lookupUserClass().newInstance(params)
        if (params.password) {
            String salt = saltSource instanceof NullSaltSource ? null : params.username
            user.password = springSecurityUiService.encodePassword(params.password, salt)
        }
        if (!user.save(flush: true)) {
            render view: 'create', model: [user: user, authorityList: sortedRoles()]
            return
        }

        addRoles(user)
        flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])}"
        redirect action: 'edit', id: user.id
    }

    def edit(long id) {
        String usernameFieldName = SpringSecurityUtils.securityConfig.userLookup.usernamePropertyName

        def user = params.username ? lookupUserClass().findWhere((usernameFieldName): params.username) : null
        if (!user) user = User.get(id)
        if (!user) return

        return buildUserModel(user)
    }

    def update(long id) {
        String passwordFieldName = SpringSecurityUtils.securityConfig.userLookup.passwordPropertyName

        def user = User.get(id)
        if (!user) return
        if (!versionCheck('user.label', 'User', user, [user: user])) {
            return
        }

        def oldPassword = user."$passwordFieldName"
        user.properties = params
        if (params.password && !params.password.equals(oldPassword)) {
            String salt = saltSource instanceof NullSaltSource ? null : params.username
            user."$passwordFieldName" = springSecurityUiService.encodePassword(params.password, salt)
        }

        if (!user.save(flush: true)) {
            render view: 'edit', model: buildUserModel(user)
            return
        }

        String usernameFieldName = SpringSecurityUtils.securityConfig.userLookup.usernamePropertyName

        lookupUserRoleClass().removeAll user
        addRoles user
        userCache.removeUserFromCache user[usernameFieldName]
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])}"
        redirect action: 'edit', id: user.id
    }

    @Secured("denyAll")
    def delete() {
        def user = findById()
        if (!user) return

        String usernameFieldName = SpringSecurityUtils.securityConfig.userLookup.usernamePropertyName
        try {
            lookupUserRoleClass().removeAll user
            user.delete flush: true
            userCache.removeUserFromCache user[usernameFieldName]
            flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect action: 'search'
        }
        catch (DataIntegrityViolationException e) {
            flash.error = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect action: 'edit', id: params.id
        }
    }

    def search() {
        def users = User.listOrderByUsername()
        users.each {
            it.colleges = CollegeUser.findAllByUser(it, [max: 5])*.college.name.join(", ")
        }
        render view: 'search', model: [results   : users,
                                       totalCount: users.size(),
                                       username  : params.username,
                                       searched  : true]
    }

    def userSearch() {

        boolean useOffset = params.containsKey('offset')
        setIfMissing 'max', 10, 100
        setIfMissing 'offset', 0

        def hql = new StringBuilder('FROM ').append(lookupUserClassName()).append(' u WHERE 1=1 ')
        def queryParams = [:]

        def userLookup = SpringSecurityUtils.securityConfig.userLookup
        String usernameFieldName = userLookup.usernamePropertyName

        for (name in [username: usernameFieldName]) {
            if (params[name.key]) {
                hql.append " AND LOWER(u.${name.value}) LIKE :${name.key}"
                queryParams[name.key] = params[name.key].toLowerCase() + '%'
            }
        }

        String enabledPropertyName = userLookup.enabledPropertyName
        String accountExpiredPropertyName = userLookup.accountExpiredPropertyName
        String accountLockedPropertyName = userLookup.accountLockedPropertyName
        String passwordExpiredPropertyName = userLookup.passwordExpiredPropertyName

        for (name in [enabled        : enabledPropertyName,
                      accountExpired : accountExpiredPropertyName,
                      accountLocked  : accountLockedPropertyName,
                      passwordExpired: passwordExpiredPropertyName]) {
            Integer value = params.int(name.key)
            if (value) {
                hql.append " AND u.${name.value}=:${name.key}"
                queryParams[name.key] = value == 1
            }
        }

        int totalCount = lookupUserClass().executeQuery("SELECT COUNT(DISTINCT u) $hql", queryParams)[0]

        Integer max = params.int('max')
        Integer offset = params.int('offset')

        String orderBy = ''
        if (params.sort) {
            orderBy = " ORDER BY u.$params.sort ${params.order ?: 'ASC'}"
        }

        def results = lookupUserClass().executeQuery(
                "SELECT DISTINCT u $hql $orderBy",
                queryParams, [max: max, offset: offset])
        def model = [results: results, totalCount: totalCount, searched: true]

        // add query params to model for paging
        for (name in ['username', 'enabled', 'accountExpired', 'accountLocked',
                      'passwordExpired', 'sort', 'order']) {
            model[name] = params[name]
        }

        results.each {
            it.colleges = CollegeUser.findAllByUser(it, [max: 5])*.college.name.join(", ")
        }

        render view: 'search', model: model
    }

    /**
     * Ajax call used by autocomplete textfield.
     */
    def ajaxUserSearch() {

        def jsonData = []

        if (params.term?.length() > 2) {
            String username = params.term
            String usernameFieldName = SpringSecurityUtils.securityConfig.userLookup.usernamePropertyName

            setIfMissing 'max', 10, 100

            def results = lookupUserClass().executeQuery(
                    "SELECT DISTINCT u.$usernameFieldName " +
                            "FROM ${lookupUserClassName()} u " +
                            "WHERE LOWER(u.$usernameFieldName) LIKE :name " +
                            "ORDER BY u.$usernameFieldName",
                    [name: "${username.toLowerCase()}%"],
                    [max: params.max])

            for (result in results) {
                jsonData << [value: result]
            }
        }

        render text: jsonData as JSON, contentType: 'text/plain'
    }

    protected void addRoles(user) {
        String upperAuthorityFieldName = GrailsNameUtils.getClassName(
                SpringSecurityUtils.securityConfig.authority.nameField, null)

        for (String key in params.keySet()) {
            if (key.contains('ROLE') && 'on' == params.get(key)) {
                lookupUserRoleClass().create user, lookupRoleClass()."findBy$upperAuthorityFieldName"(key), true
            }
        }
    }

    protected Map buildUserModel(user) {

        String authorityFieldName = SpringSecurityUtils.securityConfig.authority.nameField
        String authoritiesPropertyName = SpringSecurityUtils.securityConfig.userLookup.authoritiesPropertyName

        List roles = sortedRoles()
        Set userRoleNames = user[authoritiesPropertyName].collect { it[authorityFieldName] }
        def granted = [:]
        def notGranted = [:]
        for (role in roles) {
            String authority = role[authorityFieldName]
            if (userRoleNames.contains(authority)) {
                granted[(role)] = userRoleNames.contains(authority)
            } else {
                notGranted[(role)] = userRoleNames.contains(authority)
            }
        }

        return [user: user, roleMap: granted + notGranted]
    }

    protected findById() {
        def user = lookupUserClass().get(params.id)
        if (!user) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect action: 'search'
        }

        user
    }

    protected List sortedRoles() {
        lookupRoleClass().list().sort { it.authority }
    }
}
