package chalkboard

class DocumentType {

    String name

    String description

    String extension

    static constraints = {
        name nullable: false
        description nullable: true
        extension nullable: false, unique: true
    }

    static mapping = {
        name type: "text"
    }
}
