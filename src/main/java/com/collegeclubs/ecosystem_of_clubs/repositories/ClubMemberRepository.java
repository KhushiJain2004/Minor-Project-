package com.collegeclubs.ecosystem_of_clubs.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.collegeclubs.ecosystem_of_clubs.model.ClubMember;

@Repository
public interface ClubMemberRepository extends MongoRepository<ClubMember, String>{
    
}
