package com.apprendrefr.integration;

import com.apprendrefr.entity.Theme;
import com.apprendrefr.repository.ThemeRepository;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

import static org.hamcrest.Matchers.containsString;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/** Modification d'un thème : nouvel audio enregistré, ancien conservé si rien n'est envoyé, ancien fichier supprimé du disque. */
@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ThemeAudioEditIntegrationTest {

    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private ThemeRepository themeRepository;
    @Value("${app.upload.dir}")
    private String uploadDir;

    private Long themeId;
    private String oldAudio;   // /uploads/audio/<uuid>.mp3 : un fichier réellement créé par « l'application »

    @BeforeEach
    void setUp() throws Exception {
        oldAudio = createAudioFile(UUID.randomUUID() + ".mp3");
        themeId = saveTheme("theme_audio_test", oldAudio);
    }

    @AfterEach
    void cleanUp() throws Exception {
        themeRepository.findByNom("theme_audio_test").ifPresent(t -> {
            themeRepository.delete(t);
        });
        themeRepository.findByNom("theme_audio_seed").ifPresent(t -> {
            themeRepository.delete(t);
        });
        Files.deleteIfExists(fileOf(oldAudio));
        Files.deleteIfExists(fileOf("/uploads/audio/audio-origine.mp3"));
    }

    private String createAudioFile(String name) throws Exception {
        Path dir = Path.of(uploadDir).resolve("audio");
        Files.createDirectories(dir);
        Files.write(dir.resolve(name), new byte[]{1, 2, 3});
        return "/uploads/audio/" + name;
    }

    private Path fileOf(String audioPath) {
        return Path.of(uploadDir).resolve(audioPath.substring("/uploads/".length()));
    }

    private Long saveTheme(String nom, String audio) {
        Theme theme = new Theme();
        theme.setNom(nom);
        theme.setTitle("Titre d'origine");
        theme.setDialogueContent("Bonjour !");
        theme.setAudio(audio);
        return themeRepository.save(theme).getId();
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void editForm_acceptsAnAudioFile() throws Exception {
        mockMvc.perform(get("/admin/theme/edit/{id}", themeId))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("multipart/form-data")))
                .andExpect(content().string(containsString("name=\"audioFile\"")))
                .andExpect(content().string(containsString(oldAudio)));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void newAudio_replacesTheOldOne_andTheOldFileIsDeleted() throws Exception {
        MockMultipartFile audio = new MockMultipartFile("audioFile", "dialogue.mp3", "audio/mpeg", new byte[]{4, 5, 6});
        mockMvc.perform(multipart("/admin/theme/edit/{id}", themeId).file(audio)
                        .param("title", "Nouveau titre").param("nom", "theme_audio_test")
                        .param("dialogueContent", "Salut !").with(csrf()))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/themes"));

        Theme saved = themeRepository.findById(themeId).orElseThrow();
        assertEquals("Nouveau titre", saved.getTitle());
        assertEquals("Salut !", saved.getDialogueContent());
        assertTrue(saved.getAudio().startsWith("/uploads/audio/") && saved.getAudio().endsWith(".mp3"));
        assertTrue(!saved.getAudio().equals(oldAudio));
        assertTrue(Files.exists(fileOf(saved.getAudio())), "Le nouveau fichier doit être enregistré");
        assertFalse(Files.exists(fileOf(oldAudio)), "L'ancien fichier doit être supprimé");
        Files.deleteIfExists(fileOf(saved.getAudio()));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void withoutFile_theCurrentAudioIsKept() throws Exception {
        mockMvc.perform(multipart("/admin/theme/edit/{id}", themeId)
                        .param("title", "Autre titre").param("nom", "theme_audio_test")
                        .param("dialogueContent", "Bonjour !").with(csrf()))
                .andExpect(status().is3xxRedirection());

        Theme saved = themeRepository.findById(themeId).orElseThrow();
        assertEquals("Autre titre", saved.getTitle());
        assertEquals(oldAudio, saved.getAudio());
        assertTrue(Files.exists(fileOf(oldAudio)), "Sans nouveau fichier, l'ancien reste en place");
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void originalAudioFiles_areNeverDeleted() throws Exception {
        String seed = createAudioFile("audio-origine.mp3");   // nom non aléatoire : audio d'origine du site
        Long seedId = saveTheme("theme_audio_seed", seed);
        MockMultipartFile audio = new MockMultipartFile("audioFile", "nouveau.mp3", "audio/mpeg", new byte[]{7});
        mockMvc.perform(multipart("/admin/theme/edit/{id}", seedId).file(audio)
                        .param("title", "T").param("nom", "theme_audio_seed")
                        .param("dialogueContent", "D").with(csrf()))
                .andExpect(status().is3xxRedirection());

        assertTrue(Files.exists(fileOf(seed)), "Un audio d'origine n'est jamais supprimé");
        Files.deleteIfExists(fileOf(themeRepository.findById(seedId).orElseThrow().getAudio()));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void deletingATheme_deletesItsAudioFile() throws Exception {
        mockMvc.perform(post("/admin/theme/delete/{id}", themeId).with(csrf()))
                .andExpect(status().is3xxRedirection());

        assertFalse(themeRepository.findById(themeId).isPresent());
        assertFalse(Files.exists(fileOf(oldAudio)), "L'audio du thème supprimé doit disparaître du disque");
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void sharedAudio_isKeptWhileAnotherThemeUsesIt() throws Exception {
        Long otherId = saveTheme("theme_audio_seed", oldAudio);   // un 2e thème utilise le même fichier
        mockMvc.perform(post("/admin/theme/delete/{id}", themeId).with(csrf()))
                .andExpect(status().is3xxRedirection());

        assertTrue(Files.exists(fileOf(oldAudio)), "Le fichier reste tant qu'un autre thème l'utilise");
        assertTrue(themeRepository.findById(otherId).isPresent());
    }
}
