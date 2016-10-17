package al.data.catalog.api

import al.data.catalog.Datum
import grails.rest.RestfulController

class DatumresourceController extends RestfulController{
    static responseFormats = ['json', 'xml']

    DatumresourceController() {
        super(Datum)
    }
    def show(Datum datum) {
        if (datum == null) {
            respond status: 404
        } else {
            respond datum
        }
    }
}
