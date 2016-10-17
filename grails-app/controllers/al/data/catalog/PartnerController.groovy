package al.data.catalog

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PartnerController {

    def datasetService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured('ROLE_ADMIN')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Partner.list(params), model:[partnerCount: Partner.count()]
    }

    @Secured('permitAll')
    def indexpublic(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Partner.list(params), model:[partnerCount: Partner.count(),randomDatasets: datasetService.getRandomDatasets(15)]
    }

    @Secured('ROLE_ADMIN')
    def show(Partner partner) {
        respond partner
    }

    @Secured('ROLE_ADMIN')
    def create() {
        respond new Partner(params)
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def save(Partner partner) {
        if (partner == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (partner.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond partner.errors, view:'create'
            return
        }

        partner.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'partner.label', default: 'Partner'), partner.id])
                redirect partner
            }
            '*' { respond partner, [status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Partner partner) {
        respond partner
    }

    @Transactional
    def update(Partner partner) {
        if (partner == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (partner.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond partner.errors, view:'edit'
            return
        }

        partner.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'partner.label', default: 'Partner'), partner.id])
                redirect partner
            }
            '*'{ respond partner, [status: OK] }
        }
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def delete(Partner partner) {

        if (partner == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        partner.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'partner.label', default: 'Partner'), partner.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'partner.label', default: 'Partner'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
