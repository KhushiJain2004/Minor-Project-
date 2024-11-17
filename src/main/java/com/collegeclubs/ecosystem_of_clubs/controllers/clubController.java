package com.collegeclubs.ecosystem_of_clubs.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.collegeclubs.ecosystem_of_clubs.model.Club;
import com.collegeclubs.ecosystem_of_clubs.service.ClubService;

import jakarta.servlet.http.HttpSession;
// import org.springframework.web.bind.annotation.RequestParam;


@RestController
@RequestMapping("api/clubs")
public class clubController {
    
    @Autowired
    private ClubService clubService;

   
    @GetMapping("/list")
    public ResponseEntity<Object> getAllClubs(HttpSession session) {

        List<Club> clubList=clubService.getAllClubs();
        if(clubList.isEmpty()) return new ResponseEntity<>("No Clubs Found",HttpStatus.NO_CONTENT);
        else return new ResponseEntity<>(clubList,HttpStatus.OK);
    }

    

    @GetMapping("")
    public ResponseEntity<?> getClub(@RequestParam String id) {
        
        Club club=clubService.findByClubId(id);
        if(club==null) return new ResponseEntity<>("Club not found",HttpStatus.NO_CONTENT);
        return new ResponseEntity<>(club,HttpStatus.OK);
    }
    
    
}
