package com.apprendrefr.integration;

import com.apprendrefr.repository.PwaEventRepository;
import com.apprendrefr.service.PwaStatsService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class PwaEventIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private PwaEventRepository repository;

    @Test
    void installEvent_isAcceptedWithoutLoginOrCsrf_andCounted() throws Exception {
        long before = repository.countByEventType(PwaStatsService.INSTALLED);

        mockMvc.perform(post("/visitor/pwa-event").param("type", "installed").param("p", "android"))
                .andExpect(status().isNoContent());

        assertEquals(before + 1, repository.countByEventType(PwaStatsService.INSTALLED));
    }

    @Test
    void unknownEventType_isRejected() throws Exception {
        long before = repository.count();

        mockMvc.perform(post("/visitor/pwa-event").param("type", "hack"))
                .andExpect(status().isBadRequest());

        assertEquals(before, repository.count());
    }
}
