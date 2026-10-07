package com.apprendrefr.controller;

import com.apprendrefr.entity.User;
import com.apprendrefr.service.UserService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user") User user,
                               BindingResult bindingResult,
                               String confirmPassword,
                               RedirectAttributes redirectAttributes,
                               Model model) {


        if (bindingResult.hasErrors()) {
            model.addAttribute("user", user);
            return "register";
        }


        if (confirmPassword == null || !confirmPassword.equals(user.getPassword())) {
            bindingResult.rejectValue("password", "error.password", "Les mots de passe ne correspondent pas");
            model.addAttribute("user", user);
            return "register";
        }
        userService.registerUser(user);
        redirectAttributes.addFlashAttribute("success", "✅ Inscription réussie ! Vous pouvez maintenant vous connecter.");
        return "redirect:/login";

    }

    @GetMapping("/login")
    public String loginPage(Model model) {
        return "login";
    }

}
