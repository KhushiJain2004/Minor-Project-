package com.collegeclubs.ecosystem_of_clubs.repositories;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.collegeclubs.ecosystem_of_clubs.model.Club;

@Repository
public interface ClubRepository extends MongoRepository<Club,String>{
    // Club findbyClubName(String clubName);
    // Club findByAdmin(ClubAdmin admin);
    Club findByClubId(String clubId);

    public Optional<Club> findByClubName(String name);

}
