package com.collegeclubs.ecosystem_of_clubs.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collegeclubs.ecosystem_of_clubs.model.Club;
import com.collegeclubs.ecosystem_of_clubs.model.ClubMember;
import com.collegeclubs.ecosystem_of_clubs.model.User;
import com.collegeclubs.ecosystem_of_clubs.repositories.ClubRepository;

@Service
public class ClubService {
    
    @Autowired
    private ClubRepository clubRepository;

    @Autowired
    private UserService userService;

    public Club registerClub(Club club, User admin,List<ClubMember> members)
    {
        User savedAdmin=userService.register(admin);

        club.setAdminId(savedAdmin.getUserId());
        club.setPositionHolders(members);
        return clubRepository.save(club);
    }

    public List<Club> getAllClubs()
    {
        return clubRepository.findAll();
    }

    public Club findByClubId(String id) {
        return clubRepository.findByClubId(id);
    }

    public Optional<Club> findByClubName(String name) {
        return clubRepository.findByClubName(name);
    }

}
