package com.apprendrefr.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/** Suppression des anciens audios : seuls les fichiers créés par l'application peuvent disparaître. */
class FileUploadServiceDeleteTest {

    @TempDir
    Path tempDir;

    private FileUploadService service;

    @BeforeEach
    void setUp() {
        service = new FileUploadService(tempDir.toString());
    }

    private Path audio(String name) throws Exception {
        Path file = tempDir.resolve("audio").resolve(name);
        Files.write(file, new byte[]{1, 2, 3});
        return file;
    }

    @Test
    void generatedAudioIsDeleted() throws Exception {
        String name = UUID.randomUUID() + ".mp3";
        Path file = audio(name);

        assertTrue(service.deleteAudio("/uploads/audio/" + name));
        assertFalse(Files.exists(file));
    }

    @Test
    void originalAudioKeepsItsFile() throws Exception {
        Path file = audio("restaurant.mp3");

        assertFalse(service.deleteAudio("/uploads/audio/restaurant.mp3"));
        assertTrue(Files.exists(file));
    }

    @Test
    void pathsOutsideTheAudioFolderAreIgnored() throws Exception {
        Path outside = tempDir.resolve("secret.mp3");
        Files.write(outside, new byte[]{1});
        String name = UUID.randomUUID() + ".mp3";

        assertFalse(service.deleteAudio("/uploads/audio/../secret.mp3"));
        assertFalse(service.deleteAudio("/uploads/audio/../../" + name));
        assertFalse(service.deleteAudio("/uploads/images/" + name));
        assertFalse(service.deleteAudio("/etc/passwd"));
        assertFalse(service.deleteAudio(null));
        assertFalse(service.deleteAudio(""));
        assertTrue(Files.exists(outside));
    }

    @Test
    void missingFileIsNotAnError() {
        assertFalse(service.deleteAudio("/uploads/audio/" + UUID.randomUUID() + ".mp3"));
    }
}
