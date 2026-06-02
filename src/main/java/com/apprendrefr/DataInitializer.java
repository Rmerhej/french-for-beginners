package com.apprendrefr;

import com.apprendrefr.entity.User;
import com.apprendrefr.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public DataInitializer(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        // Création du compte Admin
        if (userRepository.findByUsername("admin").isEmpty()) {
            User admin = new User();
            admin.setUsername("admin");
            admin.setEmail("admin@apprendrefr.com");
            admin.setPassword(passwordEncoder.encode("admin123"));  // Mot de passe encodé
            admin.setRole("ADMIN");   // Important : "ADMIN" (pas ROLE_ADMIN)
            admin.setEnabled(true);
            userRepository.save(admin);
            System.out.println("✅ Compte Admin créé : username = admin | password = admin123");
        }
    }
}