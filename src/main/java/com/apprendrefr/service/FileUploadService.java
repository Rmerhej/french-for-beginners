package com.apprendrefr.service;

import com.apprendrefr.exception.FileUploadException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;

@Service
public class FileUploadService {

    /** Formats acceptés : pas de SVG ni de HTML (ils pourraient contenir du script servi depuis notre site). */
    static final Set<String> IMAGE_EXTENSIONS = Set.of(".png", ".jpg", ".jpeg", ".gif", ".webp");
    static final Set<String> AUDIO_EXTENSIONS = Set.of(".mp3", ".wav", ".ogg", ".m4a");

    /** Ces formats sont recompressés (largeur 800 px, JPEG pour les photos) ; GIF et WebP sont gardés tels quels. */
    private static final Set<String> COMPRESSED_EXTENSIONS = Set.of(".png", ".jpg", ".jpeg");

    private final Path uploadDir;
    private final ImageCompressor imageCompressor = new ImageCompressor();

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
        String errorMessage = "Image non autorisée : formats acceptés png, jpg, gif, webp";
        if (file == null || file.isEmpty()) {
            return null;
        }
        String extension = checkedExtension(file, IMAGE_EXTENSIONS, "image/", errorMessage);

        if (COMPRESSED_EXTENSIONS.contains(extension)) {
            try {
                ImageCompressor.Result result = imageCompressor.compress(file.getBytes());
                return write(result.bytes(), "images", result.extension());
            } catch (IOException e) {
                throw new FileUploadException("Erreur lors de l'upload du fichier", e);
            }
        }
        return copy(file, "images", extension);
    }

    public String saveAudio(MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return null;
        }
        // Le type MIME est parfois mal détecté par le navigateur pour l'audio : seule l'extension compte.
        String extension = checkedExtension(file, AUDIO_EXTENSIONS, null,
                "Audio non autorisé : formats acceptés mp3, wav, ogg, m4a");
        return copy(file, "audio", extension);
    }

    /** Vérifie l'extension (et le type MIME s'il est exigé) et renvoie l'extension en minuscules. */
    private String checkedExtension(MultipartFile file, Set<String> allowedExtensions,
                                    String requiredMimePrefix, String errorMessage) {
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
        return extension;
    }

    private String copy(MultipartFile file, String subFolder, String extension) {
        try (var inputStream = file.getInputStream()) {
            Path subDir = uploadDir.resolve(subFolder);
            Files.createDirectories(subDir);
            String newFileName = UUID.randomUUID() + extension;
            Files.copy(inputStream, subDir.resolve(newFileName), StandardCopyOption.REPLACE_EXISTING);
            return "/uploads/" + subFolder + "/" + newFileName;
        } catch (IOException e) {
            throw new FileUploadException("Erreur lors de l'upload du fichier", e);
        }
    }

    private String write(byte[] data, String subFolder, String extension) {
        try {
            Path subDir = uploadDir.resolve(subFolder);
            Files.createDirectories(subDir);
            // Nom aléatoire : le nom envoyé par l'utilisateur n'est jamais utilisé
            String newFileName = UUID.randomUUID() + extension;
            Files.write(subDir.resolve(newFileName), data);
            // Chemin relatif enregistré en base (ex : /uploads/images/uuid.jpg)
            return "/uploads/" + subFolder + "/" + newFileName;
        } catch (IOException e) {
            throw new FileUploadException("Erreur lors de l'upload du fichier", e);
        }
    }
}
