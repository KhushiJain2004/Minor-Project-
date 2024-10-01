package com.collegeclubs.ecosystem_of_clubs.service;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.collegeclubs.ecosystem_of_clubs.model.ClubAdmin;
import com.collegeclubs.ecosystem_of_clubs.repositories.ClubAdminRepository;

public class ClubAdminService {
    
    private ClubAdminRepository clubAdminRepository;

    private PasswordEncoder encoder;

    public ClubAdmin registerClubAdmin(ClubAdmin admin)
    {
        admin.setPassword(encoder.encode(admin.getPassword()));
        return clubAdminRepository.save(admin);
    }

}
