package chalkboard

class Country {

    String name

    Date lastUpdated
    Date dateCreated
    User creator

    static constraints = {
        name nullable: false, unique: true
    }

    static mapping = {
        name type: "text"
    }
}