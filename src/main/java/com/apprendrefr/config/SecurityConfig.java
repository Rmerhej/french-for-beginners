package com.apprendrefr.config;

import com.apprendrefr.security.CustomAuthenticationSuccessHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfig {


    private final CustomAuthenticationSuccessHandler successHandler;
    private final PersistentTokenRepository persistentTokenRepository;

    public SecurityConfig(CustomAuthenticationSuccessHandler successHandler, @Lazy PersistentTokenRepository persistentTokenRepository) {
        this.successHandler = successHandler;
        this.persistentTokenRepository = persistentTokenRepository;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()))
                .authorizeHttpRequests(auth -> auth
                        // 1. Ressources publiques (Statiques + Pages publiques)
                        .requestMatchers("/", "/index", "/register", "/login", "/logout",
                                "/css/**", "/js/**", "/uploads/**", "/images/**", "/audio/**", "/webjars/**",
                                "/fragments/**", "prononciationNew").permitAll()

                        // 2. Pages de contenu (Cours, Exercices) accessibles à tous
                        .requestMatchers("/prononciation", "/togoToAuBureu",
                                "/lessons/preparation-list", "/lesgens/**", "/lesport/**",
                                "/supports-de-cours/**", "/adjectif/**", "/pronoms/**", "/lesson/**",
                                "/adjectifsdemonstratifs/**", "/expressionstemps/**", "/futursimple/**",
                                "/verbesreguliers/**", "/passecompse/**", "/imperatif/**",
                                "/auxiliaires/**", "/about", "/contact", "/rgpd",
                                "/secourscatholique", "/au-bureau",
                                "/preparation-quiz-lesson-vers-index", "/togoToAuBureuQuiz",
                                "/au-bureau-quiz", "/les-gens-quiz", "/lesVerbes", "/chiffresEtLettres",
                                "/quizzesSurLaGrammaire", "/prepositionConjonction",
                                "/accords-des-adjectifs", "/les-pronoms", "/les-adjectifs-accord-pluriel", "/utilisation-des-pronoms",
                                "/expressions-de-temps", "/futur-simple-quiz-grammaire", "/adjectifs-demonstratif-quiz-grammaire",
                                "/verbes-regulier-quiz-grammaire","/culture").permitAll()

                        // 3. Règles Administration (La règle spécifique avant la générale)
                        .requestMatchers("/admin/images/optimize").permitAll() // Exception spécifique
                        .requestMatchers("/admin/**").hasRole("ADMIN")

                        // 4. Règles Authentification
                        .requestMatchers("/quizzes", "/lessons").authenticated()
                        .requestMatchers(HttpMethod.POST, "/exercise/submit/**").authenticated()

                        // 5. Tout le reste
                        .anyRequest().authenticated()
                )
                .formLogin(form -> form
                        .loginPage("/login")
                        .successHandler(successHandler)
                        .failureUrl("/login?error=true")
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/") // Rediriger vers la racine "/" qui est autorisée
                        .permitAll()
                );

        return http.build();
    }
    // @Bean
    //public PersistentTokenRepository persistentTokenRepository(DataSource dataSource) {
    //  JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();
    //tokenRepository.setDataSource(dataSource);
    //return tokenRepository;
    //}

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}