package com.collegeclubs.ecosystem_of_clubs.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.collegeclubs.ecosystem_of_clubs.filters.JwtFilter;
import com.collegeclubs.ecosystem_of_clubs.service.MyUserDetailsService;

import jakarta.servlet.http.HttpServletResponse;

    @Configuration
    @EnableWebSecurity
    public class SecurityConfig {       

        private final MyUserDetailsService userDetailsService;

        @Autowired
        private JwtFilter jwtFilter;

        public SecurityConfig(MyUserDetailsService userDetailsService) {
            this.userDetailsService = userDetailsService;
        }

        @Bean
        public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
            return http
                .csrf(csrf -> csrf.disable())
                // .cors(cors->cors.disable())
                .sessionManagement(session->session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeHttpRequests(request -> request
                .requestMatchers("/","/logout","/home").permitAll() 
                .requestMatchers("/api/auth/**").permitAll()
                .requestMatchers("/clubAdmin/**").hasAuthority("CLUB_ADMIN")
                .requestMatchers("/webAdmin/**","/api/user/list").hasAuthority("WEB_ADMIN")
                .requestMatchers("/**","/home").permitAll()
                .anyRequest().authenticated())
                .httpBasic(basic->{})
                .formLogin(login -> login
                    .loginPage("/login") // Custom login page
                    .permitAll()
                )
                .exceptionHandling(exceptionHandling -> exceptionHandling
                .authenticationEntryPoint(customAuthenticationEntryPoint()) // Handle auth failures
                .accessDeniedHandler(customAccessDeniedHandler()) // Handle access denials
        )
                // .logout(logout -> logout
                //     .permitAll())
                
                .addFilterBefore(jwtFilter,UsernamePasswordAuthenticationFilter.class)

                .build();

                
        }
        @Bean
        public AuthenticationEntryPoint customAuthenticationEntryPoint() {
            return (request, response, authException) -> {
                response.setContentType("application/json");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("{\"error\": \"Invalid authentication. Please log in again.\"}");
            };
        }

        @Bean
        public AccessDeniedHandler customAccessDeniedHandler() {
            return (request, response, accessDeniedException) -> {
                response.setContentType("application/json");
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                response.getWriter().write("{\"error\": \"Access denied. You do not have sufficient privileges.\"}");
            };
        }


        @Bean
        public PasswordEncoder passwordEncoder() {
            return new BCryptPasswordEncoder();
        }

        @Bean 
        public AuthenticationProvider authenticationProvider()
        {
            DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
            provider.setPasswordEncoder(passwordEncoder());
            provider.setUserDetailsService(userDetailsService);

            return provider;        
        }

        @Bean 
        public AuthenticationManager authenticationManager(AuthenticationConfiguration config) throws Exception
        {
            return config.getAuthenticationManager();
        }
    }
