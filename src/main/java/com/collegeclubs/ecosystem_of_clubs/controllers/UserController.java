package com.collegeclubs.ecosystem_of_clubs.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.collegeclubs.ecosystem_of_clubs.model.Role;
import com.collegeclubs.ecosystem_of_clubs.model.User;
import com.collegeclubs.ecosystem_of_clubs.service.UserService;

import jakarta.servlet.http.HttpSession;


@Controller
@RequestMapping("/api/user")
public class UserController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/list")
    public ResponseEntity<Object> getUsers(HttpSession session) {

        // Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        // if (auth == null || !auth.isAuthenticated()) {
        //     return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User is not authenticated");
        // }
        User user = (User) session.getAttribute("user");
        Role role = (Role) session.getAttribute("role");
        System.out.println("user from list"+user);
        System.out.println(role);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    System.out.println("Current authentication: " + authentication);
    System.out.println("Authorities: " + authentication.getAuthorities());

        // if (user == null || role == null || !role.equals(Role.WEB_ADMIN)) {
        //     return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
        // }
        List<User> userList=userService.getAllUsers();
        if(userList.isEmpty()) return new ResponseEntity<>("No users Found",HttpStatus.NO_CONTENT);
        return new ResponseEntity<>(userList,HttpStatus.OK);
    }
    
    
}
