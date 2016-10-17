package al.data.catalog

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrganisationController {

    def datasetService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    @Secured('ROLE_ADMIN')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Organisation.list(params), model:[organisationCount: Organisation.count()]
    }

    @Secured('permitAll')
    def indexpublic(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Organisation.list(params), model:[organisationCount: Organisation.count(),randomDatasets: datasetService.getRandomDatasets(15)]
    }

    @Secured('ROLE_ADMIN')
    def show(Organisation organisation) {
        respond organisation
    }

    @Secured('permitAll')
    def showpublic(Organisation organisation) {
        respond organisation, model:[randomDataSetPerOrganization: datasetService.getDatasetsPerOrganisation(organisation.id,5),totalDatasets:Dataset.countByOrganisation(organisation)]
    }

    @Secured('ROLE_ADMIN')
    def create() {
        respond new Organisation(params)
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def save(Organisation organisation) {
        if (organisation == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (organisation.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond organisation.errors, view:'create'
            return
        }

        organisation.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'organisation.label', default: 'Organisation'), organisation.id])
                redirect organisation
            }
            '*' { respond organisation, [status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Organisation organisation) {
        respond organisation
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def update(Organisation organisation) {
        if (organisation == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (organisation.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond organisation.errors, view:'edit'
            return
        }

        organisation.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'organisation.label', default: 'Organisation'), organisation.id])
                redirect organisation
            }
            '*'{ respond organisation, [status: OK] }
        }
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def delete(Organisation organisation) {

        if (organisation == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        organisation.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'organisation.label', default: 'Organisation'), organisation.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'organisation.label', default: 'Organisation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
