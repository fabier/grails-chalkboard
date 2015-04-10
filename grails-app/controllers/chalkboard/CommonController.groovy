package chalkboard

import grails.plugin.mail.MailService
import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])
class CommonController {

    static defaultAction = "index"

    MailService mailService

    def index() {
        render view: "index"
    }

    def about() {
        render view: "about"
    }

    def contact() {
        render view: "contact"
    }

    def subscribe() {
        render view: "subscribe"
    }

    def sendMailContact(ContactCommand contactCommand) {
        if (contactCommand.hasErrors()) {
            flash.message = "Merci de renseigner votre adresse email, votre sujet et votre message"
            flash.level = "warning"
            forward action: "contact", params: params
        } else {
            String messageWithBr = contactCommand.message.replaceAll("\\n", "<br/>")
            String message = "<html><head></head><body>${messageWithBr}</body></html>"
            String messageAck = "<html><head></head><body>Bonjour,<br/><br/>" +
                    "Vous venez d'envoyer le message suivant à Chalkboard.<br/>" +
                    "Nous nous efforçons de répondre à votre demande dans les plus brefs délais.<br/><br/>" +
                    "Cordialement,<br/><br/>" +
                    "L'équipe Chalkboard.<br/><br/>" +
                    "#######################<br/><br/>" +
                    "Sujet : ${contactCommand.subject}<br/><br/>" +
                    "Message : <br/><br/>" +
                    "${messageWithBr}</body></html>"
            mailService.sendMail {
                async true
                to "Chalkboard <${grailsApplication.config.grails.mail.contact}>"
                subject "[Chalkboard Contact] ${contactCommand.subject}"
                html message
                from contactCommand.email
            }
            mailService.sendMail {
                async true
                to contactCommand.email
                subject "Chalkboard - Confirmation d'envoi d'un message"
                html messageAck
                from "Chalkboard <${grailsApplication.config.grails.mail.noreply}>"
            }
            flash.message = "Votre message a été envoyé, il sera traité dans les plus brefs délais."
            flash.level = "info"
            redirect action: "contact"
        }
    }

    def sendMailSubscribe(SubscribeCommand subscribeCommand) {
        if (subscribeCommand.hasErrors()) {
            flash.message = "Merci de renseigner votre adresse email, votre nom et votre message"
            flash.level = "warning"
            forward action: "subscribe", params: params
        } else {
            String messageWithBr = subscribeCommand.message.replaceAll("\\n", "<br/>")
            String message = "<html><head></head><body>${messageWithBr}</body></html>"
            String messageAck = "<html><head></head><body>Bonjour,<br/><br/>" +
                    "Vous venez d'envoyer le message suivant à Chalkboard.<br/>" +
                    "Nous nous efforçons de répondre à votre demande dans les plus brefs délais.<br/><br/>" +
                    "Cordialement,<br/><br/>" +
                    "L'équipe Chalkboard.<br/><br/>" +
                    "#######################<br/><br/>" +
                    "Name : ${subscribeCommand.name}<br/><br/>" +
                    "Message : <br/><br/>" +
                    "${messageWithBr}</body></html>"
            mailService.sendMail {
                async true
                to "Chalkboard <${grailsApplication.config.grails.mail.subscribe}>"
                subject "[Chalkboard Subscribe] ${subscribeCommand.name}"
                html message
                from subscribeCommand.email
            }
            mailService.sendMail {
                async true
                to subscribeCommand.email
                subject "Chalkboard - Confirmation de demande de souscription"
                html messageAck
                from "Chalkboard <${grailsApplication.config.grails.mail.noreply}>"
            }
            flash.message = "Votre demande d'inscription a été envoyée, elle sera traitée dans les plus brefs délais."
            flash.level = "info"
            redirect action: "subscribe"
        }
    }
}

class ContactCommand {

    String email
    String subject
    String message

    static constraints = {
        email(email: true)
        subject(blank: false)
        message(blank: false)
    }
}

class SubscribeCommand {

    String email
    String name
    String message

    static constraints = {
        email(email: true)
        name(blank: false)
        message(blank: false)
    }
}