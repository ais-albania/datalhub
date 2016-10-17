package al.data.catalog

class RssFeedTagLib {
   static defaultEncodeAs = [taglib:'none']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def feedAsLi = { attrs, body ->
        try {
            def rssFeed = attrs.url.toURL().text
            def rss = new XmlSlurper().parseText(rssFeed)
            StringBuilder bf = new StringBuilder()
            bf.append('<ul class="list-unstyled link-list">');
            def i=0;
            rss.channel.item.each{
                if (++i<4) {
                    bf.append('<li><a href="' + it.link + '" target="_blank">' + it.title + '</a><i class="fa"></i></li>')
                }
            }
            bf.append("</ul>");
            out << bf
        }catch (FileNotFoundException fe){
            log.info("Failed to load RSS "+fe.getLocalizedMessage())
        }catch (Exception e){
            log.info("Error occurred in RssFeedTagLib "+e.getLocalizedMessage())
        }

    }
}
