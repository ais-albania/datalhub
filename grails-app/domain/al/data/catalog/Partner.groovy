package al.data.catalog

class Partner {
    String name
    String description
    String urlString

    static constraints = {
        name blank: false, nullable: false
        description blank: true, nullable: true,type: 'text',size:0..2147483646, widget: 'textarea'
    }

    String toString() {
        return name
    }
}
