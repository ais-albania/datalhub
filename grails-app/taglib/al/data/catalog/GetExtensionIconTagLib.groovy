package al.data.catalog

class GetExtensionIconTagLib {
    static namespace = "catalog"
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def getExtensionIcon = { attrs, body ->
        def icon= 'fa-file-code-o'
        if (attrs.format=="pdf"){
            icon='fa-file-pdf-o'
        }else if (attrs.format=="xls" || attrs.format=="xlsx" || attrs.format=="csv"){
            icon='fa-file-excel-o'
        }else if (attrs.format=="doc" || attrs.format=="docs"){
            icon='fa-file-word-o'
        }else if (attrs.format=="ppt" || attrs.format=="pptx"){
            icon='fa-powerpoint-o'
        }else if (attrs.format=="zip" || attrs.format=="rar"){
            icon= 'fa-archive-o'
        }else if (attrs.format=="png" || attrs.format=="jpg"){
            icon= 'fa-file-image-o'
        }

        out << icon
    }
}
