package com.apprendrefr.integration;

import com.apprendrefr.security.ActivityLog;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.user;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
class ActivityDashboardIntegrationTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ActivityLog activityLog;

    @Test
    void clickingLogoutIsRecordedOnce() throws Exception {
        mockMvc.perform(post("/logout").with(user("apprenant-test")).with(csrf()))
                .andExpect(status().is3xxRedirection());

        long count = activityLog.recent().stream()
                .filter(e -> e.getUsername().equals("apprenant-test"))
                .count();
        assertEquals(1, count);
        assertTrue(activityLog.recent().stream().anyMatch(e ->
                e.getUsername().equals("apprenant-test") && e.getType() == ActivityLog.Type.LOGOUT));
    }

    @Test
    void dashboardShowsTheRecentActivity() throws Exception {
        activityLog.record("pseudo-visible", ActivityLog.Type.LOGIN);

        mockMvc.perform(get("/admin/dashboard").with(user("admin").roles("ADMIN")))
                .andExpect(status().isOk())
                .andExpect(content().string(containsString("Activité récente")))
                .andExpect(content().string(containsString("pseudo-visible")));
    }
}
