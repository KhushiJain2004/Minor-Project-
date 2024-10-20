package com.collegeclubs.ecosystem_of_clubs.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.collegeclubs.ecosystem_of_clubs.model.User;
import com.collegeclubs.ecosystem_of_clubs.service.UserService;


@Controller
@RequestMapping("/api/user")
public class UserController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping("/list")
    public ResponseEntity<Object> getUsers() {
        List<User> userList=userService.getAllClubs();
        if(userList.isEmpty()) return new ResponseEntity<>("No users Found",HttpStatus.NO_CONTENT);
        return new ResponseEntity<>(userList,HttpStatus.OK);
    }
    
}
