package com.apprendrefr.service;

import com.apprendrefr.entity.User;
import com.apprendrefr.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
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
        user.setEmail("jean@test.com");
        user.setPassword("Password123");
        user.setRole("ROLE_USER");
        user.setEnabled(true);

    }


    @Test
    void registerUser_shouldCreateUser() {


        when(userRepository.existsByUsername("jean"))
                .thenReturn(false);


        when(userRepository.existsByEmail("jean@test.com"))
                .thenReturn(false);


        when(passwordEncoder.encode("Password123"))
                .thenReturn("encodedPassword");


        when(userRepository.save(any(User.class)))
                .thenReturn(user);


        userService.registerUser(user);


        assertThat(user.getPassword())
                .isEqualTo("encodedPassword");


        assertThat(user.getRole())
                .isEqualTo("ROLE_USER");


        verify(userRepository)
                .save(user);
    }


    @Test
    void registerUser_shouldThrowWhenUsernameAlreadyExists() {


        when(userRepository.existsByUsername("jean"))
                .thenReturn(true);


        assertThatThrownBy(() ->
                userService.registerUser(user)
        )
                .isInstanceOf(RuntimeException.class)
                .hasMessage(
                        "Ce nom d'utilisateur est déjà utilisé"
                );


        verify(userRepository, never())
                .save(any());
    }


    @Test
    void registerUser_shouldThrowWhenEmailAlreadyExists() {


        when(userRepository.existsByUsername("jean"))
                .thenReturn(false);


        when(userRepository.existsByEmail("jean@test.com"))
                .thenReturn(true);


        assertThatThrownBy(() ->
                userService.registerUser(user)
        )
                .isInstanceOf(RuntimeException.class)
                .hasMessage(
                        "Cet email est déjà utilisé"
                );


        verify(userRepository, never())
                .save(any());
    }


    @Test
    void findByUsername_shouldReturnUser() {


        when(userRepository.findByUsername("jean"))
                .thenReturn(Optional.of(user));


        Optional<User> result =
                userService.findByUsername("jean");


        assertThat(result)
                .isPresent();


        assertThat(result.get().getEmail())
                .isEqualTo("jean@test.com");
    }


    @Test
    void findByEmail_shouldReturnUser() {


        when(userRepository.findByEmail("jean@test.com"))
                .thenReturn(Optional.of(user));


        Optional<User> result =
                userService.findByEmail("jean@test.com");


        assertThat(result)
                .isPresent();
    }


    @Test
    void findAll_shouldReturnUsers() {


        when(userRepository.findAll())
                .thenReturn(List.of(user));


        List<User> result =
                userService.findAll();


        assertThat(result)
                .hasSize(1);
    }


    @Test
    void save_shouldSaveUser() {


        when(userRepository.save(user))
                .thenReturn(user);


        User result =
                userService.save(user);


        assertThat(result)
                .isEqualTo(user);


        verify(userRepository)
                .save(user);
    }


    @Test
    void deleteById_shouldDeleteUser() {


        userService.deleteById(1L);


        verify(userRepository)
                .deleteById(1L);
    }


    @Test
    void count_shouldReturnNumberOfUsers() {


        when(userRepository.count())
                .thenReturn(10L);


        long result =
                userService.count();


        assertThat(result)
                .isEqualTo(10L);
    }


    @Test
    void toggleEnabled_shouldChangeUserStatus() {


        user.setEnabled(true);


        when(userRepository.findById(1L))
                .thenReturn(Optional.of(user));


        userService.toggleEnabled(1L);


        assertThat(user.getEnabled())
                .isFalse();


        verify(userRepository)
                .save(user);
    }


    @Test
    void toggleEnabled_shouldThrowWhenUserNotFound() {


        when(userRepository.findById(1L))
                .thenReturn(Optional.empty());


        assertThatThrownBy(() ->
                userService.toggleEnabled(1L)
        )
                .isInstanceOf(RuntimeException.class)
                .hasMessage("Utilisateur non trouvé");

    }


    @Test
    void changeRole_shouldUpdateRole() {


        when(userRepository.findById(1L))
                .thenReturn(Optional.of(user));


        userService.changeRole(
                1L,
                "role_admin"
        );


        assertThat(user.getRole())
                .isEqualTo("ROLE_ADMIN");


        verify(userRepository)
                .save(user);
    }


    @Test
    void findAllPaginated_shouldReturnPage() {


        Page<User> page =
                new PageImpl<>(List.of(user));


        when(userRepository.findAll(any(Pageable.class)))
                .thenReturn(page);


        Page<User> result =
                userService.findAllPaginated(
                        PageRequest.of(0, 10)
                );


        assertThat(result.getContent())
                .hasSize(1);
    }


    @Test
    void searchUsers_shouldReturnPage() {


        Page<User> page =
                new PageImpl<>(List.of(user));


        when(
                userRepository
                        .findByUsernameContainingIgnoreCaseOrEmailContainingIgnoreCase(
                                eq("jean"),
                                eq("jean"),
                                any(Pageable.class)
                        )
        )
                .thenReturn(page);


        Page<User> result =
                userService.searchUsers(
                        "jean",
                        PageRequest.of(0, 10)
                );


        assertThat(result.getContent())
                .hasSize(1);
    }

}