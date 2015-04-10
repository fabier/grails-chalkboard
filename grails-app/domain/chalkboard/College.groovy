package chalkboard

class College {

    String name

    String description

    Country country

    Date lastUpdated
    Date dateCreated
    User creator

    static constraints = {
        name nullable: false, unique: true
        description nullable: true
        country nullable: false
    }

    static mapping = {
        name type: "text"
        description type: "text"
    }
}
