package com.collegeclubs.ecosystem_of_clubs.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.collegeclubs.ecosystem_of_clubs.model.ClubAdmin;

public interface ClubAdminRepository extends MongoRepository<ClubAdmin,String>{
    ClubAdmin findByUsername(String username);
}
