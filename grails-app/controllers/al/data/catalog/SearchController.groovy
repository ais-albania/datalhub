package al.data.catalog

import org.apache.commons.lang.StringEscapeUtils

class SearchController {

    def index() {
        def query = StringEscapeUtils.escapeHtml(params.query)
        respond Dataset.list(params), model: [datasetCount: Dataset.count(), queryPost:query]
    }
}
