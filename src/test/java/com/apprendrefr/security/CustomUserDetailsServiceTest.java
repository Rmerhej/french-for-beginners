package com.apprendrefr.security;

import com.apprendrefr.entity.User;
import com.apprendrefr.repository.UserRepository;
import org.junit.jupiter.api.Test;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class CustomUserDetailsServiceTest {
    private UserDetails load(String storedRole) {
        UserRepository repository = mock(UserRepository.class);
        User user = new User();
        user.setUsername("jean");
        user.setPassword("hash");
        user.setRole(storedRole);

        when(repository.findByUsername("jean")).thenReturn(Optional.of(user));

        return new

                CustomUserDetailsService(repository).loadUserByUsername("jean");
    }

    @Test
    void prefixedRole_isNotPrefixedTwice() {
        UserDetails details = load("ROLE_ADMIN");
        assertEquals("ROLE_ADMIN",

                details.getAuthorities().iterator().next().getAuthority());
    }

    @Test
    void legacyUnprefixedRole_isPrefixed() {
        UserDetails details = load("ADMIN");


        assertEquals("ROLE_ADMIN",

                details.getAuthorities().iterator().next().getAuthority());
    }
}