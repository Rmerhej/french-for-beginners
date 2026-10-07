package com.apprendrefr.service;

import com.apprendrefr.entity.User;
import com.apprendrefr.exception.ResourceNotFoundException;
import com.apprendrefr.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminService {

    private final UserRepository userRepository;
    private final UserService userService;

    public AdminService(UserRepository userRepository, UserService userService) {
        this.userRepository = userRepository;
        this.userService = userService;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public long countUsers() {
        return userRepository.count();
    }

    public long countAdmins() {
        return userRepository.findAll().stream()
                .filter(u -> "ADMIN".equals(u.getRole()))
                .count();
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }
    public void promoteToAdmin(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("Utilisateur non trouvé avec l'id : " + userId));
        user.setRole("ROLE_ADMIN");   // ← Attention : mieux avec le préfixe ROLE_
        userRepository.save(user);
    }

}