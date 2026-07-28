package com.apprendrefr.service;

import com.apprendrefr.entity.User;
import com.apprendrefr.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class UserServiceTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @InjectMocks
    private UserService userService;

    private User user;

    @BeforeEach
    void setUp() {
        user = new User();
        user.setId(1L);
        user.setUsername("jean");
        user.setEmail("jean@example.com");
        user.setPassword("Password123");
        user.setRole("ROLE_USER");
        user.setEnabled(true);
    }

    @Test
    void registerUser_success() {
        when(userRepository.existsByUsername("jean")).thenReturn(false);
        when(userRepository.existsByEmail("jean@example.com")).thenReturn(false);
        when(passwordEncoder.encode("Password123")).thenReturn("hashedPassword");
        when(userRepository.save(any(User.class))).thenReturn(user);

        userService.registerUser(user);

        verify(passwordEncoder).encode("Password123");
        verify(userRepository).save(argThat(u ->
                u.getRole().equals("ROLE_USER") &&
                        u.isEnabled() &&
                        u.getPassword().equals("hashedPassword")
        ));
    }

    @Test
    void registerUser_usernameAlreadyExists_throwsException() {
        when(userRepository.existsByUsername("jean")).thenReturn(true);

        RuntimeException exception = assertThrows(RuntimeException.class,
                () -> userService.registerUser(user));

        assertEquals("Ce nom d'utilisateur est déjà utilisé", exception.getMessage());
        verify(userRepository, never()).save(any());
    }

    @Test
    void registerUser_emailAlreadyExists_throwsException() {
        when(userRepository.existsByUsername("jean")).thenReturn(false);
        when(userRepository.existsByEmail("jean@example.com")).thenReturn(true);

        RuntimeException exception = assertThrows(RuntimeException.class,
                () -> userService.registerUser(user));

        assertEquals("Cet email est déjà utilisé", exception.getMessage());
        verify(userRepository, never()).save(any());
    }

    @Test
    void toggleEnabled_success() {
        when(userRepository.findById(1L)).thenReturn(Optional.of(user));
        when(userRepository.save(any(User.class))).thenReturn(user);

        userService.toggleEnabled(1L);

        assertFalse(user.isEnabled());
        verify(userRepository).save(user);
    }

    @Test
    void toggleEnabled_userNotFound_throwsException() {
        when(userRepository.findById(99L)).thenReturn(Optional.empty());

        assertThrows(RuntimeException.class, () -> userService.toggleEnabled(99L));
    }

    @Test
    void changeRole_success() {
        when(userRepository.findById(1L)).thenReturn(Optional.of(user));
        when(userRepository.save(any(User.class))).thenReturn(user);

        userService.changeRole(1L, "role_admin");

        assertEquals("ROLE_ADMIN", user.getRole());
        verify(userRepository).save(user);
    }

    @Test
    void findByUsername_found() {
        when(userRepository.findByUsername("jean")).thenReturn(Optional.of(user));

        Optional<User> result = userService.findByUsername("jean");

        assertTrue(result.isPresent());
        assertEquals("jean", result.get().getUsername());
    }
}
