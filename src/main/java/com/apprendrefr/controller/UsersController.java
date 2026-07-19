package com.apprendrefr.controller;

import com.apprendrefr.entity.User;
import com.apprendrefr.service.UserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UsersController {

    private final UserService userService;

    public UsersController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/users")
    public String listUsers(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String keyword,
            Model model) {

        Pageable pageable = PageRequest.of(page, size, Sort.by("id").descending());
        Page<User> usersPage;

        if (keyword != null && !keyword.isBlank()) {
            usersPage = userService.searchUsers(keyword, pageable);
        } else {
            usersPage = userService.findAllPaginated(pageable);
        }

        model.addAttribute("users", usersPage.getContent());
        model.addAttribute("usersPage", usersPage);
        model.addAttribute("keyword", keyword);
        return "admin/users-list";
    }

    @GetMapping("/admin/users/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        userService.deleteById(id);
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/user/new")
    public String createForm(Model model) {
        model.addAttribute("user", new User());
        return "admin/new-user-form";
    }

    @PostMapping("/admin/users/save")
    public String saveDsBase(@ModelAttribute User user) {
        userService.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/edit/{id}")
    public String editUserForm(@PathVariable Long id, Model model) {
        User user = userService.findById(id)
                .orElseThrow(() -> new RuntimeException("Utilisateur non trouvé"));
        model.addAttribute("user", user);
        return "admin/user-form";
    }

    @PostMapping("/admin/users/edit")
    public String updateUser( @ModelAttribute User user) {

        userService.save(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/toggle/{id}")
    public String toggleUserStatus(@PathVariable Long id) {
        userService.toggleEnabled(id);
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/role/{id}/{role}")
    public String changeUserRole(@PathVariable Long id, @PathVariable String role) {
        userService.changeRole(id, role);
        return "redirect:/admin/users";
    }


}
