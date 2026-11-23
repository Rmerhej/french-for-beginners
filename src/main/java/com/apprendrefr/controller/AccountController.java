package com.apprendrefr.controller;

import com.apprendrefr.entity.User;
import com.apprendrefr.exception.BusinessException;
import com.apprendrefr.exception.ResourceNotFoundException;
import com.apprendrefr.service.AccountService;
import com.apprendrefr.service.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/** Page « Mon compte » : changer son mot de passe, supprimer son compte. Réservée aux utilisateurs connectés. */
@Controller
public class AccountController {

    private static final String ROLE_ADMIN = "ROLE_ADMIN";

    private final UserService userService;
    private final AccountService accountService;

    public AccountController(UserService userService, AccountService accountService) {
        this.userService = userService;
        this.accountService = accountService;
    }

    @GetMapping("/compte")
    public String page(Authentication authentication, Model model) {
        User user = currentUser(authentication);
        model.addAttribute("accountUsername", user.getUsername());
        model.addAttribute("accountEmail", user.getEmail());
        model.addAttribute("accountAdmin", ROLE_ADMIN.equals(user.getRole()));
        return "compte";
    }

    @PostMapping("/compte/mot-de-passe")
    public String changePassword(Authentication authentication,
                                 @RequestParam(required = false) String actuel,
                                 @RequestParam(required = false) String nouveau,
                                 @RequestParam(required = false) String confirmation,
                                 RedirectAttributes redirect) {
        try {
            accountService.changePassword(currentUser(authentication).getId(), actuel, nouveau, confirmation);
            redirect.addFlashAttribute("succes", "Votre mot de passe a été modifié.");
        } catch (BusinessException e) {
            redirect.addFlashAttribute("erreur", e.getMessage());
        }
        return "redirect:/compte";
    }

    @PostMapping("/compte/supprimer")
    public String deleteAccount(Authentication authentication,
                                @RequestParam(required = false) String motDePasse,
                                @RequestParam(required = false) String confirmation,
                                HttpServletRequest request, HttpServletResponse response,
                                RedirectAttributes redirect) {
        if (confirmation == null || confirmation.isBlank()) {
            redirect.addFlashAttribute("erreurSuppression", "Cochez la case pour confirmer la suppression.");
            return "redirect:/compte";
        }
        try {
            accountService.deleteAccount(currentUser(authentication).getId(), motDePasse);
        } catch (BusinessException e) {
            redirect.addFlashAttribute("erreurSuppression", e.getMessage());
            return "redirect:/compte";
        }
        // Le compte n'existe plus : on ferme la session et on retire le cookie « Se souvenir de moi ».
        new SecurityContextLogoutHandler().logout(request, response, authentication);
        Cookie remember = new Cookie("remember-me", null);
        remember.setMaxAge(0);
        remember.setPath(request.getContextPath().isEmpty() ? "/" : request.getContextPath());
        response.addCookie(remember);
        return "redirect:/login?supprime";
    }

    private User currentUser(Authentication authentication) {
        return userService.findByUsername(authentication.getName())
                .orElseThrow(() -> new ResourceNotFoundException("Utilisateur non trouvé"));
    }
}
