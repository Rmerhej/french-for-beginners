package com.apprendrefr;

import com.apprendrefr.entity.User;
import com.apprendrefr.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@Profile("dev")
@RequiredArgsConstructor
public class DataInitializer implements CommandLineRunner {

    @Value("${ADMIN_USERNAME}")
    private String adminUsername;

    @Value("${ADMIN_PASSWORD}")
    private String adminPassword;

    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    @Override
    public void run(String... args) throws Exception {

        if (adminPassword == null || adminPassword.trim().isEmpty()) {
            throw new RuntimeException("❌ ADMIN_PASSWORD n'est pas défini dans les variables d'environnement !");
        }


        if (userRepository.findByUsername(adminUsername).isPresent()) {
            System.out.println("✅ Admin déjà existant : " + adminUsername);
            return;
        }

        // création admin
        User admin = new User();
        admin.setUsername(adminUsername);
        admin.setPassword(passwordEncoder.encode(adminPassword));
        admin.setRole("ADMIN");
        admin.setEmail("admin-" + adminUsername + "@apprendrefr.com");


        userRepository.save(admin);

        System.out.println("✅ Admin créé avec succès !");

    }
}