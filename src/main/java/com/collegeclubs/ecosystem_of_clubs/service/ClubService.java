package com.collegeclubs.ecosystem_of_clubs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collegeclubs.ecosystem_of_clubs.model.Club;
import com.collegeclubs.ecosystem_of_clubs.model.User;
import com.collegeclubs.ecosystem_of_clubs.repositories.ClubRepository;

@Service
public class ClubService {
    
    @Autowired
    private ClubRepository clubRepository;

    @Autowired
    private UserService userService;

    public Club registerClub(Club club, User admin)
    {
        User savedAdmin=userService.register(admin);

        club.setAdminId(savedAdmin.getUserId());
        return clubRepository.save(club);
    }

    public List<Club> getAllClubs()
    {
        return clubRepository.findAll();
    }

    public Club findByClubId(String id) {
        return clubRepository.findByClubId(id);
    }



}
