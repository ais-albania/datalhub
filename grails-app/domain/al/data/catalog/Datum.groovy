package al.data.catalog

class Datum {
    String name
    String md5
    Date created
    String format
    StatusEnum status
    static belongsTo = [parent:Dataset]

    static constraints = {
        name blank: false, nullable: false
        md5 nullable: true, blank: true
        created nullable: true, blank: true
        format nullable: true, blank: true
        status defauld:StatusEnum.ACTIVE
    }

    String toString() {
        return name
    }

    boolean equals(o) {
        if (this.is(o)) return true
        if (getClass() != o.class) return false

        Datum datum = (Datum) o

        if (md5 != datum.md5) return false
        if (name != datum.name) return false

        return true
    }

    int hashCode() {
        int result
        result = name.hashCode()
        result = 31 * result + md5.hashCode()
        return result
    }
}

enum StatusEnum {
    PENDING,
    ACTIVE,
    WITHDRAWN
}
