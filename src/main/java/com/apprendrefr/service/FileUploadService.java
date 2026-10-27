package com.apprendrefr.service;

import com.apprendrefr.exception.FileUploadException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;

@Service
public class FileUploadService {

    /** Formats acceptés : pas de SVG ni de HTML (ils pourraient contenir du script servi depuis notre site). */
    static final Set<String> IMAGE_EXTENSIONS = Set.of(".png", ".jpg", ".jpeg", ".gif", ".webp");
    static final Set<String> AUDIO_EXTENSIONS = Set.of(".mp3", ".wav", ".ogg", ".m4a");

    private final Path uploadDir;

    public FileUploadService(@Value("${app.upload.dir}") String uploadPath) {
        this.uploadDir = Paths.get(uploadPath);

        try {
            Files.createDirectories(uploadDir.resolve("images"));
            Files.createDirectories(uploadDir.resolve("audio"));
        } catch (IOException e) {
            throw new FileUploadException("Impossible de créer les dossiers uploads", e);
        }
    }

    public String saveImage(MultipartFile file) {
        return saveFile(file, "images", IMAGE_EXTENSIONS, "image/",
                "Image non autorisée : formats acceptés png, jpg, gif, webp");
    }

    public String saveAudio(MultipartFile file) {
        // Le type MIME est parfois mal détecté par le navigateur pour l'audio : seule l'extension compte.
        return saveFile(file, "audio", AUDIO_EXTENSIONS, null,
                "Audio non autorisé : formats acceptés mp3, wav, ogg, m4a");
    }

    private String saveFile(MultipartFile file, String subFolder, Set<String> allowedExtensions,
                            String requiredMimePrefix, String errorMessage) {

        if (file == null || file.isEmpty()) {
            return null;
        }

        String originalName = file.getOriginalFilename();
        String extension = "";
        if (originalName != null && originalName.contains(".")) {
            extension = originalName.substring(originalName.lastIndexOf(".")).toLowerCase(Locale.ROOT);
        }
        if (!allowedExtensions.contains(extension)) {
            throw new FileUploadException(errorMessage);
        }
        if (requiredMimePrefix != null) {
            String contentType = file.getContentType();
            if (contentType == null || !contentType.toLowerCase(Locale.ROOT).startsWith(requiredMimePrefix)) {
                throw new FileUploadException(errorMessage);
            }
        }

        try {
            Path subDir = uploadDir.resolve(subFolder);
            Files.createDirectories(subDir);

            // Nom aléatoire : le nom envoyé par l'utilisateur n'est jamais utilisé
            String newFileName = UUID.randomUUID() + extension;
            Path filePath = subDir.resolve(newFileName);

            try (var inputStream = file.getInputStream()) {
                Files.copy(inputStream, filePath, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
            }

            // Chemin relatif enregistré en base (ex : /uploads/audio/uuid.mp3)
            return "/uploads/" + subFolder + "/" + newFileName;

        } catch (IOException e) {
            throw new FileUploadException("Erreur lors de l'upload du fichier", e);
        }
    }
}
