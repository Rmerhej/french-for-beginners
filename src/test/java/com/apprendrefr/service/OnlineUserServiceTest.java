package com.apprendrefr.service;

import org.junit.jupiter.api.Test;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class OnlineUserServiceTest {

    private final SessionRegistryImpl registry = new SessionRegistryImpl();
    private final OnlineUserService service = new OnlineUserService(registry);

    private static UserDetails person(String name, String role) {
        return User.withUsername(name).password("x").authorities(role).build();
    }

    @Test
    void administratorsAreNotCounted() {
        registry.registerNewSession("s1", person("alice", "ROLE_USER"));
        registry.registerNewSession("s2", person("boss", "ROLE_ADMIN"));

        assertEquals(1, service.getOnlineUsersCount());
        assertEquals(1, service.getActiveSessionsCount());
        assertEquals(java.util.List.of("alice"), service.getOnlineUsernames());
    }

    @Test
    void severalSessionsOfOneLearnerCountOnceAsUserButTwiceAsSessions() {
        UserDetails alice = person("alice", "ROLE_USER");
        registry.registerNewSession("s1", alice);
        registry.registerNewSession("s2", alice);
        registry.registerNewSession("s3", person("boss", "ROLE_ADMIN"));
        registry.registerNewSession("s4", person("boss", "ROLE_ADMIN"));

        assertEquals(1, service.getOnlineUsersCount());
        assertEquals(2, service.getActiveSessionsCount());
    }

    @Test
    void nobodyOnlineMeansZero() {
        assertEquals(0, service.getOnlineUsersCount());
        assertTrue(service.getOnlineUsernames().isEmpty());
    }

    @Test
    void anAdminAloneLeavesTheListEmpty() {
        registry.registerNewSession("s1", person("boss", "ROLE_ADMIN"));

        assertEquals(0, service.getOnlineUsersCount());
        assertFalse(service.getOnlineUsernames().contains("boss"));
    }
}
