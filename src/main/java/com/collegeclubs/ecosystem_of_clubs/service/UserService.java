package com.collegeclubs.ecosystem_of_clubs.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.collegeclubs.ecosystem_of_clubs.model.Role;
import com.collegeclubs.ecosystem_of_clubs.model.User;
import com.collegeclubs.ecosystem_of_clubs.repositories.UserRepository;

@Service
public class UserService{

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder encoder;

    @Autowired
    private AuthenticationManager authManager;
    @Autowired
    private JwtService jwtService;

    public User register(User user)
    {
        user.setPassword(encoder.encode(user.getPassword()));
        return userRepository.save(user);
    }

    public List<User> getAllClubs() {
        return userRepository.findAll();
    }

    public HashMap<String, Object> verifyUserAndGenerateToken(String email, String password, Role role) throws Exception{
        
        Authentication authentication = authManager.authenticate(new UsernamePasswordAuthenticationToken(email, password));

        if(!authentication.isAuthenticated()) throw new Exception("Authentication Failed");

        User user =(User) authentication.getPrincipal();

        if(!user.getRole().equals(role)) throw new  Exception("Incorrect role");

        String token= jwtService.generateToken(user.getUserId());

        HashMap<String,Object> response= new HashMap<>();

        response.put("token",token);
        response.put("email",user.getEmail());
        response.put("user",user);

        return response;
    }

    // public UserDetails loadUserbyId(String userId) {
    //     throw new UnsupportedOperationException("Not supported yet.");
    // }

    
}