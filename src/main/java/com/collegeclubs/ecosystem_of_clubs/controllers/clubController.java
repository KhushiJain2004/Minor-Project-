package com.collegeclubs.ecosystem_of_clubs.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.collegeclubs.ecosystem_of_clubs.service.ClubService;

@RestController
@RequestMapping("api/clubs")
public class clubController {
    
    private ClubService clubService;
    
}
