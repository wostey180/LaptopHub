package com.laptopcoursework.util;

import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

public class ImageUtil {
    
    public String uploadImageAndGetPath(Part part, String appPath, String username) throws IOException {
        if (part == null || part.getSize() == 0 || username == null) {
            return null;
        }

        String uploadDir = appPath + File.separator + "images" + File.separator + "userimgs";
        File directory = new File(uploadDir);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        String fileName = username + "_" + System.currentTimeMillis() + getFileExtension(part);
        String filePath = uploadDir + File.separator + fileName;

        try (InputStream fileContent = part.getInputStream()) {
            Files.copy(fileContent, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        return "images/userimgs/" + fileName;
    }

    private String getFileExtension(Part part) {
        String fileName = part.getSubmittedFileName();
        if (fileName == null || !fileName.contains(".")) {
            return ".png";
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }
}