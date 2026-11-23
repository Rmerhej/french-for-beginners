package com.apprendrefr.service;

import com.apprendrefr.entity.User;
import com.apprendrefr.exception.BusinessException;
import com.apprendrefr.exception.ResourceNotFoundException;
import com.apprendrefr.repository.UserExerciseScoreRepository;
import com.apprendrefr.repository.UserQuizScoreRepository;
import com.apprendrefr.repository.UserRepository;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.regex.Pattern;

/** « Mon compte » : changement du mot de passe et suppression définitive de son propre compte. */
@Service
@Transactional
public class AccountService {

    /** Même règle que l'inscription : 8 caractères au moins, dont une lettre et un chiffre. */
    private static final Pattern PASSWORD_RULE = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d).{8,}$");
    private static final String ROLE_ADMIN = "ROLE_ADMIN";

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final UserExerciseScoreRepository exerciseScores;
    private final UserQuizScoreRepository quizScores;

    public AccountService(UserRepository userRepository, PasswordEncoder passwordEncoder,
                          UserExerciseScoreRepository exerciseScores, UserQuizScoreRepository quizScores) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.exerciseScores = exerciseScores;
        this.quizScores = quizScores;
    }

    /** Change le mot de passe après avoir vérifié l'ancien. Les erreurs sont des BusinessException au message lisible. */
    @CacheEvict(value = "users", key = "#userId")
    public void changePassword(Long userId, String currentPassword, String newPassword, String confirmation) {
        User user = load(userId);
        if (currentPassword == null || !passwordEncoder.matches(currentPassword, user.getPassword())) {
            throw new BusinessException("Le mot de passe actuel est incorrect.");
        }
        if (newPassword == null || !newPassword.equals(confirmation)) {
            throw new BusinessException("Les deux nouveaux mots de passe ne sont pas identiques.");
        }
        if (!PASSWORD_RULE.matcher(newPassword).matches()) {
            throw new BusinessException("Le nouveau mot de passe doit contenir au moins 8 caractères, dont une lettre et un chiffre.");
        }
        if (passwordEncoder.matches(newPassword, user.getPassword())) {
            throw new BusinessException("Le nouveau mot de passe doit être différent de l'ancien.");
        }
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }

    /** Supprime définitivement le compte et tous ses résultats, après vérification du mot de passe. */
    @CacheEvict(value = "users", key = "#userId")
    public void deleteAccount(Long userId, String password) {
        User user = load(userId);
        if (ROLE_ADMIN.equals(user.getRole())) {
            throw new BusinessException("Un compte administrateur ne peut pas être supprimé depuis cette page.");
        }
        if (password == null || !passwordEncoder.matches(password, user.getPassword())) {
            throw new BusinessException("Le mot de passe est incorrect.");
        }
        exerciseScores.deleteByUserId(userId);
        quizScores.deleteByUserId(userId);
        userRepository.delete(user);
    }

    private User load(Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("Utilisateur non trouvé"));
    }
}
