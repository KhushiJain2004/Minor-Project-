package com.collegeclubs.ecosystem_of_clubs.controllers;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.collegeclubs.ecosystem_of_clubs.dto.LoginRequest;
import com.collegeclubs.ecosystem_of_clubs.dto.RegistrationRequest;
import com.collegeclubs.ecosystem_of_clubs.model.Club;
import com.collegeclubs.ecosystem_of_clubs.model.Role;
import com.collegeclubs.ecosystem_of_clubs.model.User;
import com.collegeclubs.ecosystem_of_clubs.service.ClubService;
import com.collegeclubs.ecosystem_of_clubs.service.UserService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private ClubService clubService;
    
    @Autowired
    private UserService userService;
    
    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@RequestBody @Valid RegistrationRequest request)  {

        try {
            User user =request.getUser();

        // if(user==null) throw new NullPointerException();

        if(user.getRole()==Role.CLUB_ADMIN)  
        {
            User admin=user;
            user.setRole(Role.CLUB_ADMIN);
            Club club=clubService.registerClub(request.getClub(), admin);
            return new ResponseEntity<>(club, HttpStatus.OK);
        }
        
        else 
        {
            User newUser=userService.register(user);
            return new ResponseEntity<>(newUser, HttpStatus.OK);
        }
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest request) {
        try {
            HashMap<String,Object> response= userService.verifyUserAndGenerateToken(request.getEmail(),request.getPassword(),request.getRole());
    
            return new ResponseEntity<>(response,HttpStatus.OK);
            
          } catch (Exception e) {
    
            return new ResponseEntity<>(e.getMessage(),HttpStatus.FORBIDDEN);
          }
       
    }
    
    
}
