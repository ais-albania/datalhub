package al.data.catalog

class Organisation {
    String name
    String description
    String website

    static constraints = {
        name blank: false, nullable: false
        description nullable: true, blank: true, type: 'text',size:0..2147483646, widget: 'textarea'
        name blank: true, nullable: true
    }

    String toString() {
        return name
    }
}
