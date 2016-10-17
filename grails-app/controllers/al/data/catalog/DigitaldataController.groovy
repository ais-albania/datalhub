package al.data.catalog

class DigitaldataController {
    def datasetService

    def index() {}

    def show(Datum datum) {
        Dataset dataset = datum.getParent()
        if (datum == null) {
            respond status: 404
        } else {
            def totalDownloads=0
            try {
                totalDownloads = Count.countByEntityIdAndEntityType(datum.id,"datum")
            }catch (Exception e){
                log.error("Could not get total download count "+e.getLocalizedMessage())
            }
            respond datum, model: [dataset: dataset, randomDataSetPerOrganization: datasetService.getDatasetsPerOrganisation(dataset.organisation.id,5), totalDownloads:totalDownloads]
        }
    }
}
