package com.apprendrefr.config;

import com.apprendrefr.security.CustomAuthenticationSuccessHandler;
import com.apprendrefr.security.LoginAttemptService;
import com.apprendrefr.security.LoginRateLimitFilter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import java.security.SecureRandom;
import java.util.HexFormat;



@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {


    private static final Logger log = LoggerFactory.getLogger(SecurityConfig.class);
    private static final int MIN_REMEMBER_ME_KEY_LENGTH = 32;

    private final CustomAuthenticationSuccessHandler successHandler;
    private final LoginAttemptService loginAttempts;
    private final String rememberMeKey;

    public SecurityConfig(CustomAuthenticationSuccessHandler successHandler,LoginAttemptService loginAttempts,
                          @Value("${app.security.remember-me-key:}") String rememberMeKey) {
        this.successHandler = successHandler;
        this.loginAttempts = loginAttempts;
        this.rememberMeKey = resolveRememberMeKey(rememberMeKey);
    }

    static String resolveRememberMeKey(String configured) {
        if (configured == null || configured.isBlank()) {
            byte[] random = new byte[32];
            new SecureRandom().nextBytes(random);
            log.warn("REMEMBER_ME_KEY non définie : clé aléatoire générée (les cookies remember-me ne survivent pas à un redémarrage).");
            return HexFormat.of().formatHex(random);
        }
        if (configured.length() < MIN_REMEMBER_ME_KEY_LENGTH) {
            throw new IllegalStateException("REMEMBER_ME_KEY doit contenir au moins "
                    + MIN_REMEMBER_ME_KEY_LENGTH + " caractères.");
        }
        return configured;
    }

    /** Pages de consultation (méthode GET) accessibles sans compte, en plus des pages de StaticPagesConfig. */
    private static final String[] OPEN_GET_PAGES = {
            "/conjugueur", "/supports-de-cours", "/testEval",
            "/niveauDebutant", "/niveauConsolidation", "/niveauApprofondissement", "/lessons",
            "/themes/**",
            // Quiz : seulement les numéros (« /quiz/my-results » reste réservé aux comptes)
            "/quiz/drag-drop", "/quiz/{id:\\d+}",
            // La France : QCM et quiz
            "/laFrance", "/principesEtValeursQCM", "/principesEtValeursQUIZ",
            "/systemeInstEtPolitiqueQCM", "/systemeInstEtPolitiqueQUIZ",
            "/droitsEtDevoirsQCM", "/droitsEtDevoirsQUIZ", "/histoireGeoCultureQCM", "/histoireGeoCultureQUIZ",
            "/vivreDsSocieteFQCM", "/vivreDsSocieteFQUIZ",
            // Leçons de préparation et leurs quiz
            "/preparation-list-index", "/preparation-quiz-index", "/togoToAuBureu", "/togoToAuBureuQuiz",
            "/AuCafé", "/AuTéléphone", "/LaVieQuotidienne", "/LeTourisme", "/LesRenseignements", "/AutourDeBébé",
            "/laSanté", "/LesRelationsHumaines", "/LesTâchesDomestiques", "/LePatrimoine", "/LImmobiier",
            "/LesLieux", "/lesgens", "/lesport", "/entreprise", "/bricolage", "/ville", "/laFac", "/meteo",
            "/AuCaféQuiz", "/AuTéléphoneQuiz", "/LaVieQuotidienneQuiz", "/LeTourismeQuiz", "/LesRenseignementsQuiz",
            "/AutourdeBebeQuiz", "/laSanteQuiz", "/lesRelationsHumainesQuiz", "/LesTâchesDomestiquesQuiz",
            "/LePatrimoineQuiz", "/LImmobilierQuiz", "/LesLieuxQuiz", "/lesgensquiz", "/lesportquiz",
            "/entrepriseQuiz", "/bricolageQuiz", "/meteoQuiz", "/villeQuiz", "/facQuiz"
    };

    @Bean
    public SessionRegistry sessionRegistry() {
        return new SessionRegistryImpl();
    }

    @Bean
    public HttpSessionEventPublisher httpSessionEventPublisher() {
        return new HttpSessionEventPublisher();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf
                        .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
                        .ignoringRequestMatchers(
                                "/visitor/**",          // ← ignore CSRF pour le tracking
                                "/api/visitor/**"       // ← au cas où tu utilises le préfixe /api
                        )
                )
                .authorizeHttpRequests(auth -> auth
                        // 1. Ressources publiques (Statiques + Pages publiques)
                        .requestMatchers(
                                "/", "/index", "/register", "/login", "/logout",
                                "/visitor/**",                    // ← plus simple
                                "/css/**", "/js/**","/manifest.webmanifest", "/sw.js", "/offline.html", "/pwa/**","/error", "/uploads/**", "/images/**", "/audio/**", "/webjars/**",
                                "/fragments/**", "/prononciationNew", "/robots.txt", "/sitemap.xml"
                        ).permitAll()

                        // 2. Pages de contenu (Cours, Exercices) accessibles à tous
                        .requestMatchers("/prononciation", "/togoToAuBureu",
                                "/lessons/preparation-list", "/lesgens/**", "/lesport/**",
                                "/supports-de-cours/**", "/adjectif/**", "/pronoms/**", "/lesson/**",
                                "/adjectifsdemonstratifs/**", "/expressionstemps/**",
                                "/verbesreguliers/**", "/passecompse/**", "/imperatif/**",
                                "/auxiliaires/**", "/about", "/contact", "/rgpd", "/installer",
                                "/secourscatholique", "/au-bureau",
                                "/preparation-quiz-lesson-vers-index", "/togoToAuBureuQuiz",
                                "/au-bureau-quiz", "/les-gens-quiz", "/lesVerbes", "/chiffresEtLettres",
                                "/quizzesSurLaGrammaire", "/prepositionConjonction",
                                "/accords-des-adjectifs", "/les-pronoms", "/les-adjectifs-accord-pluriel", "/utilisation-des-pronoms",
                                "/expressions-de-temps", "/futur-simple-quiz-grammaire", "/adjectifs-demonstratif-quiz-grammaire",
                                "/verbes-regulier-quiz-grammaire", "/culture", "/themes", "/theme-detail", "/conjugaison", "/cultureFrancaise",
                      "/LesArticlesDefinis","/AdjectifsQualificatifs","/PronomsPossessifesEtDemonstratifs","/LesAuxiliares","/verbesPresent",
                                "/impératif","/passéComposé","/futurSimple","/Limmobilier").permitAll()
                        // 2b. Consultation ouverte à tous : cours, quiz, QCM, conjugueur, thèmes, test de niveau.
                        // Seul l'enregistrement (scores, niveau, résultats) demande un compte : ces adresses
                        // restent protégées par « anyRequest().authenticated() » plus bas.
                        .requestMatchers(HttpMethod.GET, StaticPagesConfig.paths().toArray(String[]::new)).permitAll()
                        .requestMatchers(HttpMethod.GET, OPEN_GET_PAGES).permitAll()
                        .requestMatchers("/api/upload/**").hasRole("ADMIN")
                        // 3. Règles Administration (La règle spécifique avant la générale)

                        .requestMatchers("/admin/**").hasRole("ADMIN")

                        // 4. Règles Authentification
                        .requestMatchers("/quizzes").authenticated()
                        .requestMatchers(HttpMethod.POST, "/exercise/submit/**").authenticated()

                        // 5. Tout le reste
                        .anyRequest().authenticated()
                )
                .formLogin(form -> form
                        .loginPage("/login")
                        .successHandler(successHandler)
                        .failureHandler((request, response, exception) -> {
                            loginAttempts.recordFailure(request.getParameter("username"),
                                    LoginAttemptService.clientIp(request));
                            response.sendRedirect(request.getContextPath() + "/login?error=true");
                        })
                        .permitAll()
                )
                .addFilterBefore(new LoginRateLimitFilter(loginAttempts), UsernamePasswordAuthenticationFilter.class)
                .sessionManagement(session -> session
                        .maximumSessions(-1)
                        .sessionRegistry(sessionRegistry())
                )

                .rememberMe(remember -> remember
                        .key(rememberMeKey)
                        .rememberMeParameter("remember-me")
                        .tokenValiditySeconds(1209600)
                )

                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/") // Rediriger vers la racine "/" qui est autorisée
                        .permitAll()
                );


        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}