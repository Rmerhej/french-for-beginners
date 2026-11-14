package com.apprendrefr.integration;

import com.apprendrefr.repository.PwaEventRepository;
import com.apprendrefr.service.PwaStatsService;
import com.apprendrefr.service.VisitorTrackerService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
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

    @Autowired
    private VisitorTrackerService visitorTracker;

    @Autowired
    private PwaStatsService pwaStatsService;

    @Test
    void dailyCounter_countsTodaysLaunches_butNotTheAdmins() throws Exception {
        long before = pwaStatsService.stats().launchedToday();

        mockMvc.perform(post("/visitor/pwa-event").param("type", "launched").param("p", "ios")
                        .with(user("apprenant").roles("USER")))
                .andExpect(status().isNoContent());
        mockMvc.perform(post("/visitor/pwa-event").param("type", "launched").param("p", "ios")
                        .with(user("boss").roles("ADMIN")))
                .andExpect(status().isNoContent());

        assertEquals(before + 1, pwaStatsService.stats().launchedToday());
    }

    @Test
    void launchFromTheIcon_byTheAdmin_isNotCounted() throws Exception {
        long before = repository.countByEventType(PwaStatsService.LAUNCHED);

        mockMvc.perform(post("/visitor/pwa-event").param("type", "launched").param("p", "android")
                        .with(user("boss").roles("ADMIN")))
                .andExpect(status().isNoContent());

        assertEquals(before, repository.countByEventType(PwaStatsService.LAUNCHED));
    }

    @Test
    void launchFromTheIcon_byALearner_isCounted() throws Exception {
        long before = repository.countByEventType(PwaStatsService.LAUNCHED);

        mockMvc.perform(post("/visitor/pwa-event").param("type", "launched").param("p", "android")
                        .with(user("apprenant").roles("USER")))
                .andExpect(status().isNoContent());

        assertEquals(before + 1, repository.countByEventType(PwaStatsService.LAUNCHED));
    }

    @Test
    void adminHeartbeat_isNotCountedAsAnOnlineVisitor() throws Exception {
        int before = visitorTracker.getOnlineVisitors();

        mockMvc.perform(get("/visitor/heartbeat").with(user("boss").roles("ADMIN")))
                .andExpect(status().isOk());

        assertEquals(before, visitorTracker.getOnlineVisitors());
    }

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
