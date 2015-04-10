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
}
