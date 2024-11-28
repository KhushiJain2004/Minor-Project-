package com.collegeclubs.ecosystem_of_clubs.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {

    @GetMapping("/") 
    public String displayroot() {
        return "index"; 
    }
    @GetMapping("/event") 
    public String displayEvent() {
        return "event"; 
    }
    @GetMapping("/home") 
    public String displayhome() {
        return "index"; 
    }
    @GetMapping("/login") 
    public String displayAuth() {
        return "auth"; 
    }
    @GetMapping("/clubs") 
    public String displayClubs() {
        return "clubDashboard"; 
    }

    // @PreAuthorize("hasAuthority('CLUB_ADMIN')")
    @GetMapping("/clubAdmin/dashboard") 
    public String displayDash() {
    
        System.out.println("reached");
    
    return "clubAdminDash"; 
    }

    @GetMapping("/webAdmin/dashboard") 
    public String displayWebDash(Model model) {

    return "dashboard"; 
    }
}