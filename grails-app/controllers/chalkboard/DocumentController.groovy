package chalkboard

import grails.plugin.springsecurity.annotation.Secured

@Secured("hasRole('ROLE_USER')")
class DocumentController {

    static defaultAction = "index"

    def index() {
    }

    def download(long id) {
        Document document = Document.get(id)
        if (document) {
            render file: document.data, fileName: document.filename, contentType: "application/octet-stream"
        } else {
            render status: 404
        }
    }

    @Secured("hasRole('ROLE_ADMIN')")
    def delete(long id) {
        Document document = Document.get(id)
        College college = College.get(params.collegeId)
        CollegeDocument.findByCollegeAndDocument(college, document).delete()
        if (CollegeDocument.findAllByDocument(document).isEmpty()) {
            document.delete()
        }
        redirect controller: "college", action: "documents", id: params.collegeId
    }
}
