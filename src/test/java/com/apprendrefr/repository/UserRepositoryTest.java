package com.apprendrefr.repository;

import com.apprendrefr.entity.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
class UserRepositoryTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    void existsByUsername_and_existsByEmail() {
        User user = new User();
        user.setUsername("marie");
        user.setEmail("marie@test.com");
        user.setPassword("Password123");
        user.setRole("ROLE_USER");
        userRepository.save(user);

        assertTrue(userRepository.existsByUsername("marie"));
        assertTrue(userRepository.existsByEmail("marie@test.com"));
        assertFalse(userRepository.existsByUsername("inconnu"));
        assertFalse(userRepository.existsByEmail("inconnu@test.com"));
    }

    @Test
    void findByUsername_and_findByEmail() {
        User user = new User();
        user.setUsername("paul");
        user.setEmail("paul@test.com");
        user.setPassword("Password123");
        user.setRole("ROLE_USER");
        userRepository.save(user);

        assertTrue(userRepository.findByUsername("paul").isPresent());
        assertTrue(userRepository.findByEmail("paul@test.com").isPresent());
        assertTrue(userRepository.findByUsername("inconnu").isEmpty());
    }

    @Test
    void searchUsers_paginated() {
        User u1 = new User();
        u1.setUsername("alice");
        u1.setEmail("alice@mail.com");
        u1.setPassword("Password123");
        u1.setRole("ROLE_USER");

        User u2 = new User();
        u2.setUsername("bob");
        u2.setEmail("bob@mail.com");
        u2.setPassword("Password123");
        u2.setRole("ROLE_USER");

        userRepository.save(u1);
        userRepository.save(u2);

        Page<User> page = userRepository
                .findByUsernameContainingIgnoreCaseOrEmailContainingIgnoreCase(
                        "ali", "ali", PageRequest.of(0, 10));

        assertEquals(1, page.getTotalElements());
        assertEquals("alice", page.getContent().get(0).getUsername());
    }
}
