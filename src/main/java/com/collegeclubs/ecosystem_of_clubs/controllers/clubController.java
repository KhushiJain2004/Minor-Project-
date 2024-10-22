package com.collegeclubs.ecosystem_of_clubs.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.collegeclubs.ecosystem_of_clubs.model.Club;
import com.collegeclubs.ecosystem_of_clubs.repositories.ClubRepository;
import com.collegeclubs.ecosystem_of_clubs.service.ClubService;

import jakarta.servlet.http.HttpSession;
// import org.springframework.web.bind.annotation.RequestParam;


@RestController
@RequestMapping("api/clubs")
public class clubController {
    
    @Autowired
    private ClubService clubService;

    @Autowired
    private ClubRepository clubRepository;

    // private JwTUtil jwt;

    // @PostMapping("/register")
    // public ResponseEntity<?> registerClub(@RequestBody ClubRegistrationRequest request)
    // {
    //     try {
    //         ClubAdmin admin=request.getAdmin();
    //         Club club=request.getClub();

    //         Club registeredClub=clubService.registerClub(club, admin);  
    //         return ResponseEntity.ok(registeredClub);

    //     } catch (Exception e) {
    //         return ResponseEntity.badRequest().body(e.getMessage());
    //     }
    // }

    @GetMapping("/list")
    public ResponseEntity<Object> getAllClubs(HttpSession session) {

        List<Club> clubList=clubService.getAllClubs();
        if(clubList.isEmpty()) return new ResponseEntity<>("No Clubs Found",HttpStatus.NO_CONTENT);
        else return new ResponseEntity<>(clubList,HttpStatus.OK);
    }

    

    // @PostMapping("/login")
    // public ResponseEntity<?> login(@RequestBody ClubAdmin request)
    // {
    //     ClubAdmin clubAdmin= clubAdminService.findByEmail(request.getEmail());

    //     if(clubAdmin==null || !encoder.matches(request.getPassword(),clubAdmin.getPassword())) 
    //     {
    //         return new ResponseEntity<>("Invalid username or password", HttpStatus.UNAUTHORIZED);
    //     }
    //     Club club= clubRepository.findByAdmin(clubAdmin);

    //     return new ResponseEntity<>(club, HttpStatus.OK);
    // }

    @PostMapping("")
    public ResponseEntity<?> getClub(@RequestParam String id) {
        
        Club club=clubRepository.findByClubId(id);
        if(club==null) return new ResponseEntity<>("Club not found",HttpStatus.NO_CONTENT);
        return new ResponseEntity<>(club,HttpStatus.OK);
    }
    
    
}
