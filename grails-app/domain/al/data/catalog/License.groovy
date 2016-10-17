package al.data.catalog

class License {
    String name
    String url
    static constraints = {
        name blank: false, nullable: false
        url blank: true, nullable: true
    }

    String toString() {
        return name
    }
}
