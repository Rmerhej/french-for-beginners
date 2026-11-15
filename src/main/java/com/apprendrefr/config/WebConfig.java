package com.apprendrefr.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Paths;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${app.upload.dir}")
    private String uploadDir;

    private final SocialLinks socialLinks;

    public WebConfig(SocialLinks socialLinks) {
        this.socialLinks = socialLinks;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // Fournit les liens Facebook / LinkedIn au pied de page de toutes les pages
        registry.addInterceptor(socialLinks);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

        String location = Paths
                .get(uploadDir)
                .toAbsolutePath()
                .normalize()
                .toUri()
                .toString();

        registry.addResourceHandler("/uploads/**")
                .addResourceLocations(location)
                // Le navigateur revérifie à chaque fois (réponse 304 légère si le fichier n'a pas changé) :
                // un fichier remplacé est visible aussitôt, sans retélécharger les images à chaque page.
                .setCacheControl(CacheControl.noCache());

        // Scripts, styles et fichiers de l'application : le navigateur doit revérifier à chaque fois
        // (réponse 304 très légère si rien n'a changé). Sinon, un ancien JS reste en mémoire 30 jours
        // après un déploiement. Les images et l'audio gardent le cache long de application.yml.
        registry.addResourceHandler("/js/**")
                .addResourceLocations("classpath:/static/js/")
                .setCacheControl(CacheControl.noCache());
        registry.addResourceHandler("/css/**")
                .addResourceLocations("classpath:/static/css/")
                .setCacheControl(CacheControl.noCache());
        registry.addResourceHandler("/sw.js", "/manifest.webmanifest", "/offline.html")
                .addResourceLocations("classpath:/static/")
                .setCacheControl(CacheControl.noCache());

        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }
}
