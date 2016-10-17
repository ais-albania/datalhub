package al.data.catalog

class DatasetsCountTagLib {

    static namespace = "catalog"
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def countDatasetsPerOrganisation = { attrs, body ->
        out << Dataset.countByOrganisation(attrs.id)
    }

    def countTotalDatasets = { attrs, body ->
        out << Dataset.count()
    }

    def countTotalData = { attrs, body ->
        out << Datum.count()
    }

    def countTotalDownloads = { attrs, body ->
        out << Count.count()
    }
    def countTotalOrganisations = { attrs, body ->
        out << Organisation.count()
    }
}