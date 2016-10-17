package al.data.catalog

class TopicTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    def topicList = { attrs, body ->
        try {
            println al.data.catalog.Category.list()

            out << bf
        }catch (Exception e){
            log.info("Error occurred in RssFeedTagLib "+e.getLocalizedMessage())
        }

    }
}
