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
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.collegeclubs.ecosystem_of_clubs.filters.JwtFilter;
import com.collegeclubs.ecosystem_of_clubs.service.MyUserDetailsService;

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
                    .requestMatchers("/clubAdmin/").hasAuthority("CLUB_ADMIN")
                    .requestMatchers("/api/auth/register").permitAll()
                    .requestMatchers("/webAdmin/","/api/user/list").hasAuthority("WEB_ADMIN")
                    .requestMatchers("/**","/home").permitAll() 
                    .anyRequest().authenticated()
                    )
                .httpBasic(basic->{})
                .formLogin(login -> login
                    .loginPage("/login") // Custom login page
                    .permitAll()
                )
                // .logout(logout -> logout
                //     .permitAll())
                
                .addFilterBefore(jwtFilter,UsernamePasswordAuthenticationFilter.class)

                .build();

                
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
