package com.apprendrefr.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * Liens des réseaux sociaux affichés dans le pied de page.
 * Les adresses se changent dans application.yml (section app.social) ou par les variables
 * d'environnement SOCIAL_FACEBOOK et SOCIAL_LINKEDIN. Une adresse vide masque l'icône.
 * Cette classe ajoute aussi les adresses au modèle de chaque page affichée (attributs
 * socialFacebook et socialLinkedin, lus par fragments/footer.html), y compris les pages
 * déclarées dans StaticPagesConfig.
 */
@Component("socialLinks")
@ConfigurationProperties(prefix = "app.social")
public class SocialLinks implements HandlerInterceptor {

    private String facebook = "";
    private String linkedin = "";

    public String getFacebook() { return facebook; }
    public void setFacebook(String facebook) { this.facebook = facebook; }

    public String getLinkedin() { return linkedin; }
    public void setLinkedin(String linkedin) { this.linkedin = linkedin; }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object handler, ModelAndView modelAndView) {
        if (modelAndView == null || !modelAndView.hasView()) {
            return;
        }
        String view = modelAndView.getViewName();
        // Pas de redirection : les attributs du modèle y deviendraient des paramètres d'adresse.
        if (view == null || view.startsWith("redirect:") || view.startsWith("forward:")) {
            return;
        }
        modelAndView.addObject("socialFacebook", facebook);
        modelAndView.addObject("socialLinkedin", linkedin);
    }
}
