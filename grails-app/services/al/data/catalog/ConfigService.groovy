package al.data.catalog

import grails.web.context.ServletContextHolder as sch


class ConfigService {
    def grailsApplication

    def getUploadPath() {
        def uploadPath = grailsApplication.config.getProperty('al.data.catalog.upload.path')
        if (uploadPath == "") {
            def webrootDir = sch.servletContext.getRealPath("/")+"uploads"
            return webrootDir.toString()
        }
        return uploadPath
    }

    def getPublicUrl(){
        return grailsApplication.config.getProperty('al.data.catalog.upload.path')
    }
}
