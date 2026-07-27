package com.apprendrefr.integration;

import com.apprendrefr.entity.User;
import com.apprendrefr.repository.UserRepository;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;

import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.*;



@SpringBootTest
@AutoConfigureMockMvc
class AuthenticationIntegrationTest {


    @Autowired
    private MockMvc mockMvc;


    @Autowired
    private UserRepository userRepository;


    @Autowired
    private PasswordEncoder passwordEncoder;



    @BeforeEach
    void setUp() {

        userRepository.deleteAll();


        User admin = new User();

        admin.setUsername("admin");
        admin.setEmail("admin@test.com");

        admin.setPassword(
                passwordEncoder.encode("Admin1234")
        );

        admin.setRole("ROLE_ADMIN");
        admin.setEnabled(true);


        userRepository.save(admin);



        User user = new User();

        user.setUsername("user");
        user.setEmail("user@test.com");

        user.setPassword(
                passwordEncoder.encode("User1234")
        );

        user.setRole("ROLE_USER");
        user.setEnabled(true);


        userRepository.save(user);
    }





    @Test
    void adminLogin_shouldRedirectToAdminDashboard() throws Exception {


        mockMvc.perform(
                        formLogin("/login")
                                .user("admin")
                                .password("Admin1234")
                )

                .andExpect(status().is3xxRedirection())

                .andExpect(
                        redirectedUrl("/")
                );
    }





    @Test
    void userLogin_shouldRedirectToHome() throws Exception {


        mockMvc.perform(
                        formLogin("/login")
                                .user("user")
                                .password("User1234")
                )


                .andExpect(status().is3xxRedirection())

                .andExpect(
                        redirectedUrl("/")
                );
    }





    @Test
    void loginWithWrongPassword_shouldFail() throws Exception {


        mockMvc.perform(
                        formLogin("/login")
                                .user("admin")
                                .password("WrongPassword")
                )


                .andExpect(status().is3xxRedirection())

                .andExpect(
                        redirectedUrl("/login?error=true")
                );
    }





    @Test
    void disabledUser_shouldNotLogin() throws Exception {


        User disabledUser = new User();

        disabledUser.setUsername("disabled");
        disabledUser.setEmail("disabled@test.com");

        disabledUser.setPassword(
                passwordEncoder.encode("Disabled123")
        );

        disabledUser.setRole("ROLE_USER");

        disabledUser.setEnabled(false);


        userRepository.save(disabledUser);



        mockMvc.perform(
                        formLogin("/login")
                                .user("disabled")
                                .password("Disabled123")
                )


                .andExpect(status().is3xxRedirection())

                .andExpect(
                        redirectedUrl("/login?error=true")
                );

    }

}