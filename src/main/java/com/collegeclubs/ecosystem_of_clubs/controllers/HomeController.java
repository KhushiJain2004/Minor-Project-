package com.collegeclubs.ecosystem_of_clubs.controllers;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.collegeclubs.ecosystem_of_clubs.service.JwtService;
import com.collegeclubs.ecosystem_of_clubs.service.MyUserDetailsService;


@Controller
public class HomeController {
    JwtService jwtService;
    MyUserDetailsService userService;

    @GetMapping("/") 
    public String displayroot() {
        return "index"; 
    }
    @GetMapping("/home") 
    public String displayhome() {
        return "index"; 
    }
    @GetMapping("/login") 
    public String displayAuth() {
        return "auth"; 
    }

    @PreAuthorize("hasAuthority('CLUB_ADMIN')")
    @GetMapping("/clubAdmin/dashboard") 
    public String displayDash() {
    
    return "clubAdminDash"; 
    }

    @PreAuthorize("hasAuthority('WEB_ADMIN')")
    @GetMapping("/webAdmin/dashboard") 
    public String displayWebDash(Model model) {

    return "dashboard"; 
    }
}