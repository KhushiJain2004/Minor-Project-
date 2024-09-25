package com.collegeclubs.ecosystem_of_clubs.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/") // Handle the root URL
    public String displayhome() {
        return "home"; // This should return your home.jsp page
    }

}