package com.apprendrefr.security;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;
import org.springframework.security.web.csrf.CsrfException;

import java.io.IOException;

/**
 * Gère le « double clic » sur « Se connecter » : le 1er envoi ouvre la session et renouvelle le jeton
 * de sécurité, donc le 2e envoi (qui porte l'ancien jeton) est refusé en 403. Au lieu d'une page d'erreur,
 * on renvoie la personne déjà connectée vers l'accueil, sinon vers le formulaire. Les autres refus
 * gardent le comportement habituel (page d'erreur 403 du site).
 */
public class LoginCsrfAccessDeniedHandler implements AccessDeniedHandler {

    private final AccessDeniedHandler fallback = new AccessDeniedHandlerImpl();

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response,
                       AccessDeniedException exception) throws IOException, jakarta.servlet.ServletException {
        if (exception instanceof CsrfException && isLoginPost(request)) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            boolean loggedIn = auth != null && auth.isAuthenticated()
                    && !(auth instanceof AnonymousAuthenticationToken);
            String target = loggedIn ? "/" : "/login?expired=true";
            response.sendRedirect(request.getContextPath() + target);
            return;
        }
        fallback.handle(request, response, exception);
    }

    private static boolean isLoginPost(HttpServletRequest request) {
        if (!"POST".equalsIgnoreCase(request.getMethod())) {
            return false;
        }
        String path = request.getRequestURI().substring(request.getContextPath().length());
        return "/login".equals(path);
    }
}
