package com.collegeclubs.ecosystem_of_clubs.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.collegeclubs.ecosystem_of_clubs.model.Club;
import com.collegeclubs.ecosystem_of_clubs.service.ClubService;

import jakarta.servlet.http.HttpSession;



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

    @PutMapping("")
    public ResponseEntity<?> updateClub(@RequestParam String adminId, @RequestBody Club clubDetails) {
        Club club=clubService.findByClubAdminId(adminId);
        // System.out.println("put controller");
        System.out.println(club);
        if(club==null) return new ResponseEntity<>("Club not found",HttpStatus.NO_CONTENT);

        if(clubDetails.getClubName()!=null) 
        {
            club.setClubName(clubDetails.getClubName());
        }
        if(clubDetails.getDescription()!=null) 
        {
            club.setDescription(clubDetails.getDescription());
        }
        if(clubDetails.getSlogan()!=null) 
        {
            club.setSlogan(clubDetails.getSlogan());
        }
        if(!clubDetails.getPositionHolders().isEmpty()) 
        {
            club.setPositionHolders(clubDetails.getPositionHolders());
        }
        if(clubDetails.getLogo()!=null) 
        {
            club.setLogo(clubDetails.getLogo());
        }
        if(clubDetails.getLogo()!=null) 
        {
            club.setLogo(clubDetails.getLogo());
        }
        if (clubDetails.getContactEmail() != null) {
            club.setContactEmail(clubDetails.getContactEmail());
        }
        if (clubDetails.getContactPhone() != null) {
            club.setContactPhone(clubDetails.getContactPhone());
        }
        if (!clubDetails.getSocialMediaLinks().isEmpty()) {
            Map<String,String> newLinks=clubDetails.getSocialMediaLinks();
            for(String key:newLinks.keySet())
            {
                if("remove".equals(newLinks.get(key)) )
                {
                    club.getSocialMediaLinks().remove(key);
                }
                else
                {
                    club.getSocialMediaLinks().put(key,newLinks.get(key));
                }
            }
        }
        if (!clubDetails.getAchievements().isEmpty()) {
            List<String> updatedAchievements = new ArrayList<>(clubDetails.getAchievements());
            club.getAchievements().addAll(updatedAchievements);
        }
        if (clubDetails.getMemberBenefits() != null) {
            club.setMemberBenefits(clubDetails.getMemberBenefits());
        }
        if (clubDetails.getMemberFee() != null) {
            club.setMemberFee(clubDetails.getMemberFee());
        }
        // if (clubDetails.getStepsToJoin() != null) {
        //     club.setStepsToJoin(clubDetails.getStepsToJoin());
        // }
        if (clubDetails.getPopularEvents() != null) {
            club.setPopularEvents(clubDetails.getPopularEvents());
        }
        // club.setLastUpdatedDate(LocalDateTime.now());

        Club updatedClub = clubService.save(club);

        return new ResponseEntity<>(updatedClub, HttpStatus.OK);
    }
    
    
}
