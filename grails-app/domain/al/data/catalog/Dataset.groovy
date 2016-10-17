package al.data.catalog


class Dataset {
    String name
    String name_en
    String description

    Organisation organisation
    User author
    String maintainer
    Date created
    Date revision
    String lineage
    String geoCoverage
    String geoGranularity
    Category category
    String updateFrequency
    License license
    String folder

    static hasMany = [tags: String, digitalData:Datum]
    List tags

    static constraints = {
        name blank: false, nullable: false
        name_en nullable: true, blank: true
        description blank: true, nullable: true,type: 'text',size:0..2147483646, widget: 'textarea'
        organisation nullable: false, blank: false
        author nullable: false, blank: false
        maintainer nullable: true, blank: true
        created nullable: false, blank: false
        revision nullable: false, blank: false
        lineage nullable: true, blank: true
        geoCoverage nullable: true, blank: true
        geoGranularity nullable: true, blank: true
        category  nullable: false, blank: false
        updateFrequency nullable: true, blank: true
        license nullable: false, blank: false
        digitalData nullable: true, blank: true
        tags nullable: true, blank: true
    }

    String toString() {
        return name
    }
}


