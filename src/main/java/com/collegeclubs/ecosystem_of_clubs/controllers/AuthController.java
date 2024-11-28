package com.collegeclubs.ecosystem_of_clubs.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.collegeclubs.ecosystem_of_clubs.dto.LoginRequest;
import com.collegeclubs.ecosystem_of_clubs.dto.RegistrationRequest;
import com.collegeclubs.ecosystem_of_clubs.model.Club;
import com.collegeclubs.ecosystem_of_clubs.model.ClubMember;
import com.collegeclubs.ecosystem_of_clubs.model.Role;
import com.collegeclubs.ecosystem_of_clubs.model.User;
import com.collegeclubs.ecosystem_of_clubs.service.ClubMemberService;
import com.collegeclubs.ecosystem_of_clubs.service.ClubService;
import com.collegeclubs.ecosystem_of_clubs.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private ClubService clubService;
    
    @Autowired
    private UserService userService;
    @Autowired
    private ClubMemberService clubMemberService;
    
    @PostMapping("/register")
    public ResponseEntity<?> registerUser(@RequestBody  RegistrationRequest request)  {

        try {
            User user =request.getUser();

        Optional<User> checkUser=userService.findUser(user.getEmail());
        if(checkUser.isPresent())  return  ResponseEntity.status(HttpStatus.BAD_REQUEST).body("User already exists");

        if(user.getRole()==Role.CLUB_ADMIN)  
        {
            Optional<Club> checkClub=clubService.findByClubName(request.getClub().getClubName());
            if(checkClub.isPresent()) return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Club already exists");

            User admin=user;
            user.setRole(Role.CLUB_ADMIN);

            List<ClubMember> members=request.getClubMembers();
            for(ClubMember member:members)
            {
                clubMemberService.save(member);
            }
            Club club=clubService.registerClub(request.getClub(), admin,members);
            return new ResponseEntity<>(club, HttpStatus.OK);
        }
        
        else 
        {
            User newUser=userService.register(user);
            return new ResponseEntity<>(newUser, HttpStatus.OK);
        }
        } catch (Exception e) {
            // e.printStackTrace();
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping("/login")
    // @CrossOrigin(origins = "http://localhost:8080")
    public ResponseEntity<?> login(@RequestBody LoginRequest request, Model model) {
        try {
            System.out.println("Received login request for email: " + request.getEmail());
            HashMap<String,Object> response= userService.verifyUserAndGenerateToken(request.getEmail(),request.getPassword(),request.getRole());
            String token=(String) response.get("token");
            ResponseCookie cookie = ResponseCookie.from("Authorization", token)
            .httpOnly(true)
            .secure(true) // Set to true in production (requires HTTPS)
            .path("/")    // Available across the application
            .maxAge(7 * 24 * 60 * 60) // 7 days expiry
            .sameSite("Strict")       // Prevent cross-site usage
            .build();

    
            return ResponseEntity.ok()
            .header("Set-Cookie", cookie.toString())
            .body(response);
            
          } catch (Exception e) {
            model.addAttribute("status", e.getMessage()); 
    
            return new ResponseEntity<>(e.getMessage(),HttpStatus.FORBIDDEN);
          }
    }
    @GetMapping("/logout")
    public ResponseEntity<String> logout(HttpServletResponse response) {

        // Clear the cookie
        System.out.println("requested for logout");
        Cookie cookie = new Cookie("Authorization", null); // Name of the cookie
        cookie.setPath("/"); // Set path to match the original cookie
        cookie.setHttpOnly(true);
        cookie.setMaxAge(0); // Expire the cookie immediately
        response.addCookie(cookie);

        return new ResponseEntity<>("logged out", HttpStatus.OK);
    }
        // @PostMapping("/login")
        // public RedirectView login(@RequestParam String email,
        //                     @RequestParam String password,
        //                     @RequestParam Role role,
        //                     HttpSession session, // Use HttpSession to manage session
        //                     @ModelAttribute("user") User user, RedirectAttributes redirectAttributes) {
        //     try {
        //         HashMap<String, Object> response = userService.verifyUserAndGenerateToken(email, password, role);
                
        //         // Store the user details or token in the session
        //         session.setAttribute("token", response.get("token"));
        //         session.setAttribute("user", response.get("user")); // Store user details
        //         // model.addAttribute("user",response.get("user"));

        //         redirectAttributes.addFlashAttribute("user", response.get("user"));
        //         redirectAttributes.addFlashAttribute("token", response.get("token"));
                
        //         // Redirect to dashboard
        //         return new RedirectView("/dashboard", true); // Make sure you have a controller mapping for /dashboard
        //     } catch (Exception e) {
        //         // model.addAttribute("error", e.getMessage());
        //         redirectAttributes.addFlashAttribute("error", e.getMessage());
        //         return new RedirectView("/login", true);
        //     }
        // }
        // @PostMapping("/login")
        // public ResponseEntity<?> login(
        //         @RequestParam String email,
        //         @RequestParam String password,
        //         @RequestParam Role role) {
        //     try {
        //         HashMap<String, Object> response = userService.verifyUserAndGenerateToken(email, password, role);

        //         return ResponseEntity.ok(response);
        //     } catch (Exception e) {
        //         return new ResponseEntity<>(e.getMessage(),HttpStatus.FORBIDDEN);
        //     }
        // }
        

}
