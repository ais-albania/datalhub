package al.data.catalog

import grails.io.IOUtils
import org.springframework.util.FileCopyUtils

class DownloadController {
    def configService

    def download(Long datumId, Long datasetId) {
        Dataset dataset = Dataset.load(datasetId)
        Datum datum = Datum.load(datumId)
        def fileName = datum.name
        try {
            new Count(entityId: datum.id, entityType: "datum", date: new Date(), visitorIP: this.getIP()).save flush: true
        }catch (Exception e){
            log.error("Gathering visitor count failed "+ e.getLocalizedMessage())
        }
        def name = configService.getUploadPath() + File.separator + dataset.folder
        def file = new File(name, fileName)

        // path traversal protection
        if (file && file.exists() && fileName =~ /\\|\//) {
            response.sendError(400, "could not download '${fileName}': access denied")
            return false
        } else if (file && file.exists() && file.canRead()) {

            // download file
            response.setStatus(200)
            response.setContentType("application/octet-stream")
            response.setContentLength(file.size() as int)

            // browsers do not handle RFC5987 properly, so Safari will be unable to decode the unicode filename
            // @see http://greenbytes.de/tech/tc2231/
            response.setHeader("Content-Disposition", "attachment; filename=${URLEncoder.encode(fileName, 'ISO-8859-1')}; filename*= UTF-8''${URLEncoder.encode(fileName, 'UTF-8')}")

            // handle file upload
            try {
                FileCopyUtils.copy(new FileInputStream(file), response.outputStream)
            } catch (e) {
                log.error "download failed! $e.message"
            }
        } else if (file?.exists() && !file.canRead()) {
            // file not readable
            response.sendError(400, "could not download '${fileName}': access denied")
            return false
        } else {
            // file not found
            response.sendError(400, "could not download '${fileName}': file not found")
            return false
        }

        // return false as we do not have a view
        return false
    }

    private getIP() {
        def clientipaddress = request.getRemoteAddr()
        if (clientipaddress == null) {
            clientipaddress = request.getHeader("X-Forwarded-For")
        }
        if (clientipaddress == null) {
            clientipaddress = request.getHeader("Client-IP")
        }
        return clientipaddress

    }
}
