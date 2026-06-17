package com.apprendrefr;

import com.apprendrefr.entity.User;
import com.apprendrefr.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class DataInitializer implements CommandLineRunner {

    @Value("${admin.username}")
    private String adminUsername;

    @Value("${admin.password}")
    private String adminPassword;

    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    @Override
    public void run(String... args) throws Exception {
        System.out.println("username chargé par spring :" + adminUsername);

        if (adminPassword == null || adminPassword.trim().isEmpty()) {
            throw new RuntimeException("❌ ADMIN_PASSWORD n'est pas défini dans les variables d'environnement !");
        }


        if (userRepository.findByUsername(adminUsername).isPresent()) {
            System.out.println("✅ Admin déjà existant : " + adminUsername);
            return;
        }

        // créer admin
        User admin = new User();
        admin.setUsername(adminUsername);
        admin.setPassword(passwordEncoder.encode(adminPassword));
        admin.setRole("ADMIN");
        admin.setEmail(adminUsername + "admin@apprendrefr.com");   // ou une vraie adresse


        userRepository.save(admin);

        System.out.println("✅ Admin créé avec succès !");
        System.out.println("   Username : " + adminUsername);
        System.out.println("   Email    : " + admin.getEmail());
    }
}