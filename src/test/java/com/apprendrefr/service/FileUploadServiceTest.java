package com.apprendrefr.service;

import com.apprendrefr.exception.FileUploadException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.springframework.mock.web.MockMultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.assertArrayEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

class FileUploadServiceTest {

    @TempDir
    Path tempDir;

    private FileUploadService service;

    @BeforeEach
    void setUp() {
        service = new FileUploadService(tempDir.toString());
    }

    private static MockMultipartFile file(String name, String type) {
        return new MockMultipartFile("file", name, type, new byte[]{1, 2, 3});
    }

    private static MockMultipartFile realImage(String name, String type, int width, int height, boolean transparent) {
        return new MockMultipartFile("file", name, type, TestImages.png(width, height, transparent));
    }

    @Test
    void opaquePngPhotoIsStoredAsLightJpegWithARandomName() throws Exception {
        MockMultipartFile upload = realImage("ma photo.PNG", "image/png", 1600, 1200, false);

        String path = service.saveImage(upload);

        assertTrue(path.startsWith("/uploads/images/"));
        assertTrue(path.endsWith(".jpg"), "une photo opaque est enregistrée en JPEG");
        assertFalse(path.contains("photo"), "le nom envoyé n'est pas conservé");
        Path stored = tempDir.resolve("images").resolve(path.substring("/uploads/images/".length()));
        assertTrue(Files.exists(stored));
        assertTrue(Files.size(stored) < upload.getSize() / 3, "le fichier enregistré est bien plus léger");
        assertEquals(800, TestImages.decode(Files.readAllBytes(stored)).getWidth());
    }

    @Test
    void transparentPngKeepsItsFormat() {
        String path = service.saveImage(realImage("logo.png", "image/png", 200, 100, true));

        assertTrue(path.endsWith(".png"));
    }

    @Test
    void gifAndWebpAreStoredAsSent() throws Exception {
        MockMultipartFile webp = file("anim.webp", "image/webp");

        String path = service.saveImage(webp);

        assertTrue(path.endsWith(".webp"));
        assertArrayEquals(new byte[]{1, 2, 3},
                Files.readAllBytes(tempDir.resolve("images").resolve(path.substring("/uploads/images/".length()))));
    }

    @Test
    void fileNamedPngButNotAnImageIsRefused() {
        assertThrows(FileUploadException.class, () -> service.saveImage(file("fausse.png", "image/png")));
    }

    @Test
    void rejectsSvgAndHtmlImages() {
        assertThrows(FileUploadException.class, () -> service.saveImage(file("logo.svg", "image/svg+xml")));
        assertThrows(FileUploadException.class, () -> service.saveImage(file("page.html", "text/html")));
        assertThrows(FileUploadException.class, () -> service.saveImage(file("page.html", "image/png")));
    }

    @Test
    void rejectsImageWithNonImageMimeType() {
        assertThrows(FileUploadException.class, () -> service.saveImage(file("a.png", "text/html")));
        assertThrows(FileUploadException.class, () -> service.saveImage(file("a.png", null)));
    }

    @Test
    void rejectsPathTricksInTheExtension() {
        assertThrows(FileUploadException.class, () -> service.saveImage(file("a.png/../../x", "image/png")));
        assertThrows(FileUploadException.class, () -> service.saveImage(file("noextension", "image/png")));
    }

    @Test
    void acceptsAllowedAudio_evenWithGenericMimeType() {
        String path = service.saveAudio(file("son.mp3", "application/octet-stream"));

        assertTrue(path.startsWith("/uploads/audio/"));
        assertTrue(path.endsWith(".mp3"));
    }

    @Test
    void rejectsNonAudioFilesAndImagesAsAudio() {
        assertThrows(FileUploadException.class, () -> service.saveAudio(file("script.html", "audio/mpeg")));
        assertThrows(FileUploadException.class, () -> service.saveAudio(file("image.png", "image/png")));
        assertThrows(FileUploadException.class, () -> service.saveAudio(file("app.exe", "application/octet-stream")));
    }

    @Test
    void audioFileIsNotAcceptedAsImage() {
        assertThrows(FileUploadException.class, () -> service.saveImage(file("son.mp3", "audio/mpeg")));
    }

    @Test
    void emptyOrMissingFileReturnsNull() {
        assertNull(service.saveImage(null));
        assertNull(service.saveAudio(new MockMultipartFile("file", "a.mp3", "audio/mpeg", new byte[0])));
    }

    @Test
    void twoUploadsOfTheSameNameGetDifferentFiles() {
        String first = service.saveAudio(file("a.wav", "audio/wav"));
        String second = service.saveAudio(file("a.wav", "audio/wav"));
        assertFalse(first.equals(second));
    }
}
