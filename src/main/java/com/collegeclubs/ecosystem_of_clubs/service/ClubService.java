package com.collegeclubs.ecosystem_of_clubs.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.collegeclubs.ecosystem_of_clubs.model.Club;
import com.collegeclubs.ecosystem_of_clubs.model.ClubAdmin;
import com.collegeclubs.ecosystem_of_clubs.repositories.ClubRepository;

public class ClubService {
    
    @Autowired
    private ClubRepository clubRepository;

    @Autowired
    private ClubAdminService clubAdminService;

    public Club registerClub(Club club, ClubAdmin admin)
    {
        ClubAdmin savedAdmin=clubAdminService.registerClubAdmin(admin);

        club.setAdmin(savedAdmin);
        return clubRepository.save(club);
    }

}
