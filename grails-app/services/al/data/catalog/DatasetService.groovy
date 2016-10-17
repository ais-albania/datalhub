package al.data.catalog

import grails.transaction.Transactional

@Transactional
class DatasetService {

    def getDatasetsPerOrganisation(Long id, Integer max) {
        return Dataset.executeQuery('from Dataset WHERE organisation_id=' +id+' order by rand()', [max: max])
    }

    def getRandomDatasets(Integer max) {
        return Dataset.executeQuery('from Dataset order by rand()', [max: max])
    }
}
