package com.apprendrefr;

import com.apprendrefr.entity.User;
import com.apprendrefr.repository.UserRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class DataInitializer implements CommandLineRunner {

    @Value("${ADMIN_USERNAME:}")
    private String adminUsername;

    @Value("${ADMIN_PASSWORD:}")
    private String adminPassword;

    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    @Override
    @Transactional
    public void run(String... args) throws Exception {

        // ====================== INITIALISATION ADMIN ======================
        if (adminUsername == null || adminUsername.isBlank()
                || adminPassword == null || adminPassword.isBlank()) {
            System.out.println("⚠️ ADMIN_USERNAME / ADMIN_PASSWORD non définis : aucun compte admin créé.");
            return;
        }

        if (userRepository.findByUsername(adminUsername).isPresent()) {
            System.out.println("✅ Admin déjà existant : " + adminUsername);
            return;
        }

        User admin = new User();
        admin.setUsername(adminUsername);
        admin.setPassword(passwordEncoder.encode(adminPassword));
        admin.setRole("ADMIN");
        admin.setEmail("admin-" + adminUsername + "@apprendrefr.com");

        userRepository.save(admin);
        System.out.println("✅ Admin créé avec succès !");
    }
}