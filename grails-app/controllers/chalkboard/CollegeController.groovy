package chalkboard

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import org.apache.commons.io.FilenameUtils
import org.springframework.web.multipart.commons.CommonsMultipartFile

@Secured("hasRole('ROLE_USER')")
class CollegeController {

    static defaultAction = "index"

    SpringSecurityService springSecurityService

    def index() {
        User user = springSecurityService.currentUser
        def colleges = CollegeUser.findAllByUser(user)*.college
        if (colleges.isEmpty()) {
            redirect action: "selectCollege"
        } else if (colleges.size() == 1) {
            redirect action: "documents", id: colleges[0].id
        } else {
            redirect action: "chooseCollege"
        }
    }

    def selectCollege() {
        render view: "selectCollege", model: [colleges: College.all]
    }

    def chooseCollege() {
        User user = springSecurityService.currentUser
        render view: "selectCollege", model: [colleges: CollegeUser.findAllByUser(user)*.college]
    }

    def documents(long id) {
        College college = College.get(id)
        List<Document> documents = CollegeDocument.findAllByCollege(college)*.document
        render view: "documents", model: [college: college, documents: documents]
    }

    def updateCollege() {
        def college = College.get(params.college)
        User user = springSecurityService.currentUser
        CollegeUser.findOrSaveByUserAndCollege(user, college)
        redirect action: "index"
    }

    def uploadDocument(long id) {
        College college = College.get(id)
        User user = springSecurityService.currentUser
        def file = params.file
        if (file instanceof CommonsMultipartFile) {
            DocumentType documentType = DocumentType.findByExtension(FilenameUtils.getExtension(file.originalFilename))
            if (documentType) {
                Document document = new Document()
                document.creator = user
                document.name = file.originalFilename
                document.filename = file.originalFilename
                document.data = file.bytes
                document.documentType = documentType
                document.save(flush: true)

                CollegeDocument.create(college, document)

                flash.message = "Upload complete"
            } else {
                flash.error = "Document type unknown, impossible to upload this file."
            }
        } else {
            flash.error = "Impossible to upload this kind of file (internal error)"
        }
        render "OK"
    }
}
