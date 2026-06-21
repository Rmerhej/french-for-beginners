package com.apprendrefr.config;

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

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf
                        .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
                )

                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/", "/register", "/login", "/css/**", "/js/**",
                                "/images/**","/webjars/**", "/uploads/**", "/fragments/**","/prononciation",
                                "/preparation-list-index/**","/togoToAuBureu",
                                "/lessons/preparation-list","/lesgens/**","/lesport/**").permitAll()
                        .requestMatchers("/","/supports-de-cours/**","/adjectif/**","/pronoms/**","/lesson/**",
                                "/adjectifsdemonstratifs/**","/expressionstemps/**","/futursimple/**","/verbesreguliers/**",
                                "/passecompse/**","/imperatif/**","/adjectif/**","/auxiliaires/**","/about","/contact","/rgpd",
                                "/secourscatholique","/au-bureau",
                                "/preparation-quiz-index","/preparation-quiz-lesson-vers-index","/togoToAuBureuQuiz","/au-bureau-quiz").permitAll()
                        .requestMatchers("/quizzes").authenticated()
                        .requestMatchers("/admin/images/optimize").permitAll()
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .requestMatchers("/lessons").authenticated()
                        .requestMatchers(HttpMethod.POST, "/exercise/submit**").authenticated()
                        .anyRequest().authenticated()
                )

                .formLogin(form -> form
                        .loginPage("/login")
                        .defaultSuccessUrl("/lessons", true)
                        .permitAll()
                        .failureUrl("/login?error=true")
                        .permitAll()
                )

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