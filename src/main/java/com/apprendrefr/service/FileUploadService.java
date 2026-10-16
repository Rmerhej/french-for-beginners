package com.apprendrefr.service;
import com.apprendrefr.exception.FileUploadException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Pattern;
/**
* Enregistre les fichiers envoyés par les administrateurs.
*
* Le type du fichier n'est jamais déduit du nom ni du type MIME fournis par
le client :
* l'extension doit figurer dans une liste blanche et le contenu (octets
d'en-tête)
* doit correspondre à cette extension.
*/
@Service
public class FileUploadService {
private static final Set<String> IMAGE_EXTENSIONS = Set.of("png", "jpg",
"jpeg", "gif", "webp");
private static final Set<String> AUDIO_EXTENSIONS = Set.of("mp3", "wav",
"ogg", "m4a");
private static final long MAX_IMAGE_BYTES = 10L * 1024 * 1024;
private static final long MAX_AUDIO_BYTES = 20L * 1024 * 1024;
//Corrections pas à pas – French For Beginners

//Page 5 of 25

private static final Pattern SAFE_EXTENSION = Pattern.compile("[a-z0-9]{1,5}");
private static final int HEADER_LENGTH = 12;
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
return saveFile(file, "images", IMAGE_EXTENSIONS, MAX_IMAGE_BYTES);
}
public String saveAudio(MultipartFile file) {
return saveFile(file, "audio", AUDIO_EXTENSIONS, MAX_AUDIO_BYTES);
}
private String saveFile(MultipartFile file, String subFolder, Set<String>
allowedExtensions, long maxBytes) {

if (file == null || file.isEmpty()) {
return null;
}
if (file.getSize() > maxBytes) {
throw new FileUploadException("Fichier trop volumineux");
}
String extension = extractExtension(file.getOriginalFilename());
if (!allowedExtensions.contains(extension)) {
throw new FileUploadException("Extension de fichier non autorisée");
}
try {
if (!hasValidSignature(extension, readHeader(file))) {

//Corrections pas à pas – French For Beginners

//Page 6 of 25

throw new FileUploadException("Le contenu du fichier ne correspond pas à son extension");

}
Path subDir = uploadDir.resolve(subFolder).normalize();
Files.createDirectories(subDir);
// Nom généré côté serveur : aucune partie du nom d'origine n'est conservée

String newFileName = UUID.randomUUID() + "." + extension;
Path filePath = subDir.resolve(newFileName).normalize();
if (!filePath.startsWith(subDir)) {
throw new FileUploadException("Chemin de destination invalide");
}
try (InputStream inputStream = file.getInputStream()) {
Files.copy(inputStream, filePath);
}
// Chemin relatif enregistré en base (ex :/uploads/audio/uuid.mp3)

return "/uploads/" + subFolder + "/" + newFileName;
} catch (IOException e) {
throw new FileUploadException("Erreur lors de l'upload du fichier", e);
}
}
/** Retourne l'extension en minuscules, ou une chaîne vide si elle n'est
pas sûre. */
private static String extractExtension(String originalName) {
if (originalName == null) {
return "";
}
int dot = originalName.lastIndexOf('.');
if (dot < 0 || dot == originalName.length() - 1) {
return "";
}
String extension = originalName.substring(dot + 1).toLowerCase();
return SAFE_EXTENSION.matcher(extension).matches() ? extension : "";
}
private static byte[] readHeader(MultipartFile file) throws IOException {
try (InputStream in = file.getInputStream()) {

//Corrections pas à pas – French For Beginners

//Page 7 of 25

return in.readNBytes(HEADER_LENGTH);
}
}
private static boolean hasValidSignature(String extension, byte[] h) {
return switch (extension) {
case "png" -> matches(h, 0, 0x89, 'P', 'N', 'G');
case "jpg", "jpeg" -> matches(h, 0, 0xFF, 0xD8, 0xFF);
case "gif" -> matches(h, 0, 'G', 'I', 'F', '8');
case "webp" -> matches(h, 0, 'R', 'I', 'F', 'F') && matches(h, 8,

'W', 'E', 'B', 'P');

case "wav" -> matches(h, 0, 'R', 'I', 'F', 'F') && matches(h, 8,

'W', 'A', 'V', 'E');

case "ogg" -> matches(h, 0, 'O', 'g', 'g', 'S');
case "mp3" -> matches(h, 0, 'I', 'D', '3')

|| (h.length > 1 && (h[0] & 0xFF) == 0xFF && (h[1] &

0xE0) == 0xE0);

case "m4a" -> matches(h, 4, 'f', 't', 'y', 'p');
default -> false;
};
}
private static boolean matches(byte[] data, int offset, int... expected)
{

if (data.length < offset + expected.length) {
return false;
}
for (int i = 0; i < expected.length; i++) {
if ((data[offset + i] & 0xFF) != expected[i]) {
return false;
}
}
return true;
}
}