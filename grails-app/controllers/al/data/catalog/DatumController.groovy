package al.data.catalog

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class DatumController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Datum.list(params), model:[datumCount: Datum.count()]
    }

    def show(Datum datum) {
        respond datum
    }

    def create() {
        respond new Datum(params)
    }

    @Transactional
    def save(Datum datum) {
        if (datum == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (datum.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond datum.errors, view:'create'
            return
        }

        datum.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'datum.label', default: 'Datum'), datum.id])
                redirect datum
            }
            '*' { respond datum, [status: CREATED] }
        }
    }

    def edit(Datum datum) {
        respond datum
    }

    @Transactional
    def update(Datum datum) {
        if (datum == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (datum.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond datum.errors, view:'edit'
            return
        }

        datum.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'datum.label', default: 'Datum'), datum.id])
                redirect datum
            }
            '*'{ respond datum, [status: OK] }
        }
    }

    @Transactional
    def delete(Datum datum) {

        if (datum == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        datum.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'datum.label', default: 'Datum'), datum.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'datum.label', default: 'Datum'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
