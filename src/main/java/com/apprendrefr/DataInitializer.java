package com.apprendrefr;

import com.apprendrefr.entity.User;
import com.apprendrefr.repository.UserRepository;
import com.apprendrefr.security.Roles;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

/**
 * Crée le compte administrateur au démarrage, dans tous les profils sauf
 * "test".
 * <p>
 * Le dump SQL ne contient plus aucun compte : c'est la seule source de
 * l'administrateur.
 * L'application refuse de démarrer avec un mot de passe vide, trop court ou
 * resté à la valeur d'exemple.
 */
@Slf4j
@Component
@Profile("!test")
@RequiredArgsConstructor
public class DataInitializer implements CommandLineRunner {
    private static final int MIN_PASSWORD_LENGTH = 12;
    private static final String EXAMPLE_PASSWORD_PREFIX = "ChangeThis";
    @Value("${admin.username}")
    private String adminUsername;
    @Value("${admin.password}")
    private String adminPassword;
    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    @Override
    @Transactional
    public void run(String... args) {
        if (adminUsername == null || adminUsername.isBlank()) {
            throw new IllegalStateException("ADMIN_USERNAME n'est pas défini dans les variables d'environnement.");

        }
        if (adminPassword == null || adminPassword.isBlank()) {
            throw new IllegalStateException("ADMIN_PASSWORD n'est pas défini dans les variables d'environnement.");

        }
        if (adminPassword.length() < MIN_PASSWORD_LENGTH ||
                adminPassword.startsWith(EXAMPLE_PASSWORD_PREFIX)) {

            throw new IllegalStateException("ADMIN_PASSWORD doit contenir au moins " + MIN_PASSWORD_LENGTH + " caractères et ne doit pas être la valeur d'exemple.");
        }
        if (userRepository.findByUsername(adminUsername).isPresent()) {
            log.info("Compte administrateur déjà existant : {}",

                    adminUsername);
            return;
        }
        User admin = new User();
        admin.setUsername(adminUsername);
        admin.setPassword(passwordEncoder.encode(adminPassword));
        admin.setRole(Roles.ADMIN);
        admin.setEmail("admin-" + adminUsername + "@apprendrefr.com");
        userRepository.save(admin);
        log.info("Compte administrateur créé : {}", adminUsername);
    }
}

