package com.apprendrefr.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class FileUploadService {

    private final Path uploadDir;

    public FileUploadService(@Value("${app.upload.dir}") String uploadPath) {
        this.uploadDir = Paths.get(uploadPath);

        try {
            Files.createDirectories(uploadDir.resolve("images"));
            Files.createDirectories(uploadDir.resolve("audio"));
        } catch (IOException e) {
            throw new RuntimeException("Impossible de créer les dossiers uploads", e);
        }
    }

    public String saveImage(MultipartFile file) {
        return saveFile(file, "images");
    }

    public String saveAudio(MultipartFile file) {
        return saveFile(file, "audio");
    }

    private String saveFile(MultipartFile file, String subFolder) {

        if (file == null || file.isEmpty()) {
            return null;
        }

        String contentType = file.getContentType();

        if (contentType == null ||
                (!contentType.startsWith("images/") && !contentType.startsWith("audio/"))) {
            throw new RuntimeException("Type de fichier non autorisé");
        }

        try {
            Path subDir = uploadDir.resolve(subFolder);
            Files.createDirectories(subDir);

            String originalName = file.getOriginalFilename();
            String extension = "";

            if (originalName != null && originalName.contains(".")) {
                extension = originalName.substring(originalName.lastIndexOf("."));
            }

            String newFileName = UUID.randomUUID() + extension;

            Path filePath = subDir.resolve(newFileName);

            file.transferTo(filePath.toFile());

            return "/uploads/" + subFolder + "/" + newFileName;

        } catch (IOException e) {
            throw new RuntimeException("Erreur lors de l'upload du fichier", e);
        }
    }
}