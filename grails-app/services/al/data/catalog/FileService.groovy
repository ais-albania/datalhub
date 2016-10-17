package al.data.catalog

import org.apache.commons.io.FilenameUtils

import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.attribute.BasicFileAttributes
import java.util.concurrent.TimeUnit


class FileService {

    def ConfigService

    private Map getFileMeta(File file) {
        return [name: file.getName(), md5: file.encodeAsMD5(), created: this.getCreationDate(file), format: FilenameUtils.getExtension(file.toString()), status: StatusEnum.ACTIVE]
    }

    /**
     * Get Creation Date for a File
     * @param file
     * @return
     */
    private Date getCreationDate(File file) {
        Path filePath = file.toPath();

        BasicFileAttributes attributes = null;
        try {
            attributes =
                    Files.readAttributes(filePath, BasicFileAttributes.class);
        }
        catch (IOException exception) {
            log.error("Exception handled when trying to get file " +
                    "attributes: " + exception.getMessage());
        }
        return new Date (attributes.creationTime().toMillis())
    }

    def Map getFileRelatedInfo(File file){

    }

    def deleteFolder (folderName){
        def path = new File(configService.getUploadPath() + File.separator + folderName)
        path.deleteDir()
    }

}



