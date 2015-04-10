package chalkboard

class Document {

    String name

    String description

    String filename

    DocumentType documentType

    byte[] data

    Date lastUpdated
    Date dateCreated
    User creator

    static constraints = {
        name nullable: false
        description nullable: true
        filename nullable: false
    }

    static mapping = {
        name type: "text"
        description type: "text"
    }
}
