package chalkboard

class Role {

    String authority

    Date lastUpdated
    Date dateCreated

    transient users

    static transients = ['users']

    static mapping = {
        cache true
    }

    static constraints = {
        authority blank: false, unique: true
    }
}
