package al.data.catalog.api

import al.data.catalog.Dataset
import grails.converters.JSON
import grails.rest.RestfulController

class DatasetresourceController extends RestfulController {
    static responseFormats = ['json', 'xml']

    DatasetresourceController() {
        super(Dataset)
    }

    def show(Dataset dataset) {
        if (dataset == null) {
            respond status: 404
        } else {
            respond dataset
        }
    }

    def listexhibit() {
        def items=[]
        Dataset.list().each {
            def item =[id:it.id,type:"dataset",label: it.name,  link:g.createLink(mapping: 'dataset',params:[id:it.id, name:catalog.cleanUrl(name:it.name)]),organisation: it.organisation.name, author: it.author.username,  digitalData:it.digitalData, created: it.created, geoCoverage: it.geoCoverage, geoGranularity: it.geoGranularity, category: it.category.name, updateFrequency: it.updateFrequency, license: it.license.name, tag: it.tags]
            items<< item
        }

        render items  as JSON
    }

    def showrdf(Dataset dataset) {
        model:
        [dataset: dataset]
    }
}
