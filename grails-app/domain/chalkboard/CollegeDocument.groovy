package chalkboard

class CollegeDocument {
    College college

    Document document

    Date dateCreated

    static constraints = {
    }

    static CollegeDocument create(College college, Document document, boolean flush = false) {
        def instance = new CollegeDocument(college: college, document: document)
        instance.save(flush: flush, insert: true)
        instance
    }
}
