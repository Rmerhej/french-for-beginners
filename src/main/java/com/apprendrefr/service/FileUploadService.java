package com.apprendrefr.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class FileUploadService {

    private final Path uploadDir = Paths.get("uploads");

    public FileUploadService() {
        try {
            Files.createDirectories(uploadDir);
        } catch (IOException e) {
            throw new RuntimeException("Impossible de créer le dossier uploads", e);
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

        // Vérification du type de fichier
        String contentType = file.getContentType();
        if (contentType == null ||
                (!contentType.startsWith("image/") && !contentType.startsWith("audio/"))) {
            throw new RuntimeException("Type de fichier non autorisé");
        }

        try {
            // Création du sous-dossier
            Path subDir = uploadDir.resolve(subFolder);
            Files.createDirectories(subDir);

            // Nom unique sécurisé
            String originalName = file.getOriginalFilename();
            String extension = originalName != null ?
                    originalName.substring(originalName.lastIndexOf(".")) : "";
            String newFileName = UUID.randomUUID() + extension;

            Path filePath = subDir.resolve(newFileName);
            file.transferTo(filePath);

            // Retourne le chemin accessible via URL
            return "/uploads/" + subFolder + "/" + newFileName;

        } catch (IOException e) {
            throw new RuntimeException("Erreur lors de l'upload du fichier", e);
        }
    }
}