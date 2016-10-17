package al.data.catalog

import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)

class DatasetController {
    def ConfigService
    def FileService
    def datasetService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured('ROLE_ADMIN')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Dataset.list(params), model: [datasetCount: Dataset.count()]
    }
    @Secured('permitAll')
    def indexpublic(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = "id"
        params.order = "desc"
        if (!params.offset) {
            params.offset = 0
        }
        if (params.organisationId && params.organisationId.isNumber()) {
            def datasets = Dataset.findAllByOrganisation(Organisation.load(params.organisationId), [max: 100, offset: params.offset, sort: "name", order: "desc"])
            return [datasetList: datasets, datasetCount: datasets.size(), paramkey: 'organisationId', paramvalue: params.organisationId,randomDataset: datasetService.getRandomDatasets(10)]
        }
        if (params.category) {
            def datasets = Dataset.findAllByCategory(Category.findAllByNameLike(params.name), [max: 100, offset: params.offset, sort: "name", order: "desc"])
            return [datasetList: datasets, datasetCount: datasets.size(), paramkey: 'category', paramvalue: "",randomDataset: datasetService.getRandomDatasets(10)]
        }

        return [datasetList: Dataset.list(params), datasetCount: Dataset.count(),randomDataset: datasetService.getRandomDatasets(10)]
    }

    @Secured('permitAll')
    def datasetcategory(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = "id"
        params.order = "desc"
        if (!params.offset) {
            params.offset = 0
        }
        def category = Category.findByUrlString(params.name)
        def datasets = Dataset.findAllByCategory(category, [max: 100, offset: params.offset, sort: "name", order: "desc"])

        render(view: "indexpublic", model: [datasetList: datasets, datasetCount: datasets.size(), paramkey: 'category', paramvalue:category.urlString, categoryName:category.name,randomDataset: datasetService.getRandomDatasets(10)])
    }


    @Secured('ROLE_ADMIN')
    def show(Dataset dataset) {
        respond dataset
    }

    @Secured('permitAll')
    def showpublic(Dataset dataset) {
        respond dataset, model: [randomDataSetPerOrganization: datasetService.getDatasetsPerOrganisation(dataset.organisation.id, 10)]
    }

    @Secured('ROLE_ADMIN')
    def create() {
        String uuidFolder = UUID.randomUUID().toString()
        params.folder = uuidFolder
        respond new Dataset(params), model: [uploadPath: configService.getUploadPath()]
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def save(Dataset dataset) {
        if (dataset == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (dataset.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond dataset.errors, view: 'create'
            return
        }

        dataset.save flush: true

        createDatum(dataset)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dataset.label', default: 'Dataset'), dataset.id])
                redirect dataset
            }
            '*' { respond dataset, [status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Dataset dataset) {
        respond dataset, model: [uploadPath: configService.getUploadPath()]
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def update(Dataset dataset) {
        dataset.tags.removeAll([""])
        if (dataset == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (dataset.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond dataset.errors, view: 'edit'
            return
        }
        dataset.save flush: true

        updateDatumFiles(dataset)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'dataset.label', default: 'Dataset'), dataset.id])
                redirect dataset
            }
            '*' { respond dataset, [status: OK] }
        }
    }

    @Transactional
    @Secured('ROLE_ADMIN')
    def delete(Dataset dataset) {

        if (dataset == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        dataset.delete flush: true

        //Delete files on disk
        fileService.deleteFolder(dataset.folder)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'dataset.label', default: 'Dataset'), dataset.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Secured('ROLE_ADMIN')
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dataset.label', default: 'Dataset'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    /**
     * Attach Datum to Dataset
     * @param dataset
     */
    private void createDatum(Dataset dataset) {
        def path = new File(configService.getUploadPath() + File.separator + dataset.folder)
        path.listFiles().each { file ->
            def dt = fileService.getFileMeta(file)
            dataset.addToDigitalData(new Datum(name: dt.name, md5: dt.md5, created: dt.created, format: dt.format, status: dt.status))
        }
        dataset.save flush: true
    }

    /**
     * On Update remove the Datum that have been deleted, and add the new ones
     * @param dataset
     */
    private void updateDatumFiles(Dataset dataset) {
        def path = new File(configService.getUploadPath() + File.separator + dataset.folder)
        List dataFromFolder = []
        path.listFiles().each { file ->
            def dt = fileService.getFileMeta(file)
            dataFromFolder.add(new Datum(name: dt.name, md5: dt.md5, created: dt.created, format: dt.format, status: dt.status))
        }
        def data = dataset.getDigitalData()


        def toDelete = data - dataFromFolder
        def toAdd = dataFromFolder - data
        toDelete.each {
            dataset.removeFromDigitalData(it)
            it.delete flush: true
        }

        toAdd.each { datum ->
            def file = new File(configService.getUploadPath() + File.separator + dataset.folder + File.separator + datum.name)
            def dt = fileService.getFileMeta(file)
            dataset.addToDigitalData(new Datum(name: dt.name, md5: dt.md5, created: dt.created, format: dt.format, status: dt.status))
        }
        dataset.save flush: true

    }

}
