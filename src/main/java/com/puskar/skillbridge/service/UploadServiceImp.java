package com.puskar.skillbridge.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@Service
public class UploadServiceImp implements UploadService {

    @Override
    public String uploadProfileImg(MultipartFile imageFile) {
        try {
            if (imageFile == null || imageFile.isEmpty()) {
                return null;
            }

            String originalName = imageFile.getOriginalFilename();

            if (originalName == null || originalName.isBlank()) {
                return null;
            }

            String extension = getExtension(originalName);
            String fileName = UUID.randomUUID() + extension;

            Path uploadPath = Paths.get("uploads/profile/");
            Files.createDirectories(uploadPath);

            Path filePath = uploadPath.resolve(fileName);

            Files.copy(
                    imageFile.getInputStream(),
                    filePath,
                    StandardCopyOption.REPLACE_EXISTING
            );

            return fileName;

        } catch (IOException e) {
            System.out.println("Profile image upload exception: " + e.getMessage());
            return null;
        }
    }

    @Override
    public String uploadResumePdf(MultipartFile resumeFile) {
        try {
            if (resumeFile == null || resumeFile.isEmpty()
                    || !"application/pdf".equalsIgnoreCase(resumeFile.getContentType())) {
                return null;
            }

            String originalName = resumeFile.getOriginalFilename();
            if (originalName == null || !originalName.toLowerCase().endsWith(".pdf")) {
                return null;
            }

            String fileName = UUID.randomUUID() + ".pdf";
            Path uploadPath = Paths.get("uploads/resumes/");
            Files.createDirectories(uploadPath);
            Files.copy(
                    resumeFile.getInputStream(),
                    uploadPath.resolve(fileName),
                    StandardCopyOption.REPLACE_EXISTING
            );
            return fileName;
        } catch (IOException e) {
            System.out.println("Resume upload exception: " + e.getMessage());
            return null;
        }
    }

    private String getExtension(String fileName) {
        int lastDot = fileName.lastIndexOf(".");

        if (lastDot == -1) {
            return ".jpg";
        }

        String extension = fileName.substring(lastDot).toLowerCase();

        if (!extension.equals(".jpg")
                && !extension.equals(".jpeg")
                && !extension.equals(".png")
                && !extension.equals(".webp")) {
            throw new IllegalArgumentException("Only JPG, PNG, and WEBP files are allowed.");
        }

        return extension;
    }
}