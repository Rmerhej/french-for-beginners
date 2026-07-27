package com.apprendrefr.repository;

import com.apprendrefr.entity.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;


@DataJpaTest
class UserRepositoryTest {


    @Autowired
    private UserRepository userRepository;


    private User adminUser;


    @BeforeEach
    void setUp() {


        userRepository.deleteAll();


        adminUser = new User();

        adminUser.setUsername("admin");
        adminUser.setEmail("admin@test.com");
        adminUser.setPassword("Admin1234");
        adminUser.setRole("ROLE_ADMIN");
        adminUser.setEnabled(true);


        User normalUser = new User();

        normalUser.setUsername("jean");
        normalUser.setEmail("jean@test.com");
        normalUser.setPassword("Jean1234");
        normalUser.setRole("ROLE_USER");
        normalUser.setEnabled(true);


        userRepository.save(adminUser);
        userRepository.save(normalUser);
    }


    @Test
    void findByUsername_shouldReturnUser() {


        Optional<User> result =
                userRepository.findByUsername("admin");


        assertThat(result)
                .isPresent();


        assertThat(result.get().getEmail())
                .isEqualTo("admin@test.com");
    }


    @Test
    void findByEmail_shouldReturnUser() {


        Optional<User> result =
                userRepository.findByEmail("jean@test.com");


        assertThat(result)
                .isPresent();


        assertThat(result.get().getUsername())
                .isEqualTo("jean");
    }


    @Test
    void existsByUsername_shouldReturnTrue() {


        boolean exists =
                userRepository.existsByUsername("admin");


        assertThat(exists)
                .isTrue();
    }


    @Test
    void existsByUsername_shouldReturnFalse() {


        boolean exists =
                userRepository.existsByUsername("unknown");


        assertThat(exists)
                .isFalse();
    }


    @Test
    void existsByEmail_shouldReturnTrue() {


        boolean exists =
                userRepository.existsByEmail("admin@test.com");


        assertThat(exists)
                .isTrue();
    }


    @Test
    void existsByEmail_shouldReturnFalse() {


        boolean exists =
                userRepository.existsByEmail("unknown@test.com");


        assertThat(exists)
                .isFalse();
    }


    @Test
    void searchUsers_shouldFindByUsername() {


        Page<User> result =
                userRepository
                        .findByUsernameContainingIgnoreCaseOrEmailContainingIgnoreCase(
                                "adm",
                                "adm",
                                PageRequest.of(0, 10)
                        );


        assertThat(result.getContent())
                .hasSize(1);


        assertThat(result.getContent()
                .get(0)
                .getUsername())
                .isEqualTo("admin");
    }


    @Test
    void searchUsers_shouldFindByEmail() {


        Page<User> result =
                userRepository
                        .findByUsernameContainingIgnoreCaseOrEmailContainingIgnoreCase(
                                "xxx",
                                "jean@",
                                PageRequest.of(0, 10)
                        );


        assertThat(result.getContent())
                .hasSize(1);


        assertThat(result.getContent()
                .get(0)
                .getEmail())
                .isEqualTo("jean@test.com");
    }


    @Test
    void findAll_shouldReturnAllUsers() {


        var users = userRepository.findAll();


        assertThat(users)
                .hasSize(2);
    }


    @Test
    void saveUser_shouldGenerateId() {


        User user = new User();

        user.setUsername("marie");
        user.setEmail("marie@test.com");
        user.setPassword("Marie1234");
        user.setRole("ROLE_USER");


        User saved =
                userRepository.save(user);


        assertThat(saved.getId())
                .isNotNull();


        assertThat(saved.getUsername())
                .isEqualTo("marie");
    }


    @Test
    void deleteUser_shouldRemoveUser() {


        Long id = adminUser.getId();


        userRepository.deleteById(id);


        assertThat(
                userRepository.findById(id)
        )
                .isEmpty();
    }

}