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
        String originalName = file.getOriginalFilename();
        String extension = "";

        if (originalName != null && originalName.contains(".")) {
            extension = originalName.substring(originalName.lastIndexOf(".")).toLowerCase();
        }

        // Ajout d'une tolérance pour les fichiers audio dont le type MIME est parfois mal détecté par le navigateur (ex: application/octet-stream)
        boolean isImage = contentType != null && contentType.startsWith("image/");
        boolean isAudio = (contentType != null && contentType.startsWith("audio/")) ||
                (extension.equals(".mp3") || extension.equals(".wav") || extension.equals(".ogg") || extension.equals(".m4a"));

        if (!isImage && !isAudio) {
            throw new RuntimeException("Type de fichier non autorisé : " + contentType);
        }

        try {
            Path subDir = uploadDir.resolve(subFolder);
            Files.createDirectories(subDir);

            // Génération du nom unique
            String newFileName = UUID.randomUUID() + extension;
            Path filePath = subDir.resolve(newFileName);

            Files.deleteIfExists(filePath);

// Copie le flux du fichier directement vers le vrai chemin absolu cible
            try (var inputStream = file.getInputStream()) {
                Files.copy(inputStream, filePath, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            }

            // Retourne le chemin relatif pour la BDD (ex: /uploads/audio/uuid.mp3)
            return "/uploads/" + subFolder + "/" + newFileName;

        } catch (IOException e) {
            throw new RuntimeException("Erreur lors de l'upload du fichier", e);
        }
    }
}