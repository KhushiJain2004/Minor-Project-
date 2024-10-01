package com.collegeclubs.ecosystem_of_clubs.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.collegeclubs.ecosystem_of_clubs.model.Club;

public interface ClubRepository extends MongoRepository<Club,String>{
    
}
