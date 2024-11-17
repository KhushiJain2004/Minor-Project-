package com.collegeclubs.ecosystem_of_clubs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collegeclubs.ecosystem_of_clubs.model.ClubMember;
import com.collegeclubs.ecosystem_of_clubs.repositories.ClubMemberRepository;

@Service
public class ClubMemberService {
    @Autowired
    private ClubMemberRepository clubMemberRepository;

    public void save(ClubMember clubMember)
    {
        clubMemberRepository.save(clubMember);
    }
}
