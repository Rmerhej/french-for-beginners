package com.apprendrefr.config;

import com.apprendrefr.security.CustomAuthenticationSuccessHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final CustomAuthenticationSuccessHandler successHandler;

    public SecurityConfig(CustomAuthenticationSuccessHandler successHandler) {
        this.successHandler = successHandler;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                // 1. Protection CSRF
                .csrf(csrf -> csrf
                        .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
                )
                // 2. Gestion des accès
                .authorizeHttpRequests(auth -> auth
                        // Ressources statiques et pages publiques
                        .requestMatchers("/", "/register", "/login", "/css/**", "/js/**", "/images/**",
                                "/webjars/**", "/uploads/**", "/fragments/**").permitAll()
                        // Vos autres routes publiques (regroupées pour la lisibilité)
                        .requestMatchers("/prononciation", "/preparation-list-index/**", "/togoToAuBureu",
                                "/lessons/preparation-list", "/lesgens/**", "/lesport/**",
                                "/supports-de-cours/**", "/adjectif/**", "/pronoms/**", "/lesson/**",
                                "/adjectifsdemonstratifs/**", "/expressionstemps/**", "/futursimple/**",
                                "/verbesreguliers/**", "/passecompse/**", "/imperatif/**",
                                "/auxiliaires/**", "/about", "/contact", "/rgpd",
                                "/secourscatholique", "/au-bureau", "/preparation-quiz-index",
                                "/preparation-quiz-lesson-vers-index", "/togoToAuBureuQuiz",
                                "/au-bureau-quiz").permitAll()
                        // Accès restreints
                        .requestMatchers("/admin/images/optimize").permitAll()
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .requestMatchers("/quizzes", "/lessons").authenticated()
                        .requestMatchers(HttpMethod.POST, "/exercise/submit**").authenticated()
                        .anyRequest().authenticated()
                )
                // 3. Configuration Login (c'est ici que le Handler est utilisé)
                .formLogin(form -> form
                        .loginPage("/login")
                        .successHandler(successHandler) // Redirige dynamiquement selon le rôle
                        .failureUrl("/login?error=true")
                        .permitAll()
                )
                // 4. Configuration Logout
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/index")
                        .permitAll()
                );

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}