package al.data.catalog

class UrlCleanerTagLib {
    def ConfigService
    static namespace = "catalog"
    static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def cleanUrl = { attrs, body ->
        out << attrs.name.replaceAll("[\\_ .,;/]", "-").replaceAll("ë","e").toLowerCase();
    }

    def canonicalUrl ={ attrs, body ->
        out << configService.getPublicUrl()
    }
}
