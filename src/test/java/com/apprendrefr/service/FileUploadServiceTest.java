package com.apprendrefr.service;
import com.apprendrefr.exception.FileUploadException;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.springframework.mock.web.MockMultipartFile;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import static org.junit.jupiter.api.Assertions.*;
class FileUploadServiceTest {
    private static final byte[] PNG = {(byte) 0x89, 'P', 'N', 'G', 0x0D, 0x0A, 0x1A, 0x0A, 0, 0, 0, 0};
    private static final byte[] MP3 = {'I', 'D', '3', 3, 0, 0, 0, 0, 0, 0, 0, 0};
    private static final byte[] HTML = "<script>alert(1)</script>".getBytes(StandardCharsets.UTF_8);

    @TempDir
    Path tempDir;
    private FileUploadService service() {
        return new FileUploadService(tempDir.toString());
    }
    @Test
    void saveImage_validPng_isStoredUnderGeneratedName() {
        MockMultipartFile file = new MockMultipartFile("file", "Photo.PNG", "image/png", PNG);

        String path = service().saveImage(file);
        assertTrue(path.startsWith("/uploads/images/"));
        assertTrue(path.endsWith(".png"));
        assertFalse(path.contains("Photo"));

        assertTrue(Files.exists(tempDir.resolve("images").resolve(path.substring("/uploads/images/".length()))));
    }
    @Test
    void saveImage_htmlFileDeclaredAsImage_isRejected() {
        MockMultipartFile file = new MockMultipartFile("file", "page.html", "image/png", HTML);

        assertThrows(FileUploadException.class, () ->

                service().saveImage(file));
    }

    @Test
    void saveImage_contentDoesNotMatchExtension_isRejected() {
        MockMultipartFile file = new MockMultipartFile("file", "evil.png", "image/png", HTML);

        assertThrows(FileUploadException.class, () ->

                service().saveImage(file));
    }
    @Test
    void saveImage_pathTraversalInExtension_isRejected() {
        MockMultipartFile file = new MockMultipartFile("file", "a.png/../../x", "image/png", PNG);

        assertThrows(FileUploadException.class, () ->

                service().saveImage(file));
    }
    @Test
    void saveImage_audioFile_isRejected() {
        MockMultipartFile file = new MockMultipartFile("file", "son.mp3", "audio/mpeg", MP3);

        assertThrows(FileUploadException.class, () ->

                service().saveImage(file));
    }
    @Test
    void saveAudio_validMp3_isStored() {
        MockMultipartFile file = new MockMultipartFile("file", "son.mp3", "application/octet-stream", MP3);

        String path = service().saveAudio(file);
        assertTrue(path.startsWith("/uploads/audio/"));
        assertTrue(path.endsWith(".mp3"));
    }
    @Test
    void save_emptyFile_returnsNull() {
        MockMultipartFile file = new MockMultipartFile("file", "vide.png", "image/png", new byte[0]);
        assertNull(service().saveImage(file));
    }
}