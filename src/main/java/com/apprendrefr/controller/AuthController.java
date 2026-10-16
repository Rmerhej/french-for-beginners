package com.apprendrefr.controller;

import com.apprendrefr.dto.RegisterRequest;
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
        model.addAttribute("user", new RegisterRequest());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@Valid @ModelAttribute("user") RegisterRequest
                                       form,

                               BindingResult bindingResult,
                               String confirmPassword,
                               RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {
            return "register";
        }
        if (confirmPassword == null ||
                !confirmPassword.equals(form.getPassword())) {

            bindingResult.rejectValue("password", "error.password", "Les mots de passe ne correspondent pas");
            return "register";
        }
// Seuls ces trois champs viennent du formulaire ; id, rôle et état sont fixés par le service
        User user = new User();
        user.setUsername(form.getUsername().trim());
        user.setEmail(form.getEmail().trim());
        user.setPassword(form.getPassword());
        userService.registerUser(user);
        redirectAttributes.addFlashAttribute("success", "✅ Inscription réussie ! Vous pouvez maintenant vous connecter.");

        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginPage(Model model) {
        return "login";
    }

}
