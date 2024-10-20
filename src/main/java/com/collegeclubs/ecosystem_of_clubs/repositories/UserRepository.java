package com.collegeclubs.ecosystem_of_clubs.repositories;
import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.collegeclubs.ecosystem_of_clubs.model.User;

@Repository
public interface UserRepository extends MongoRepository<User,String> {
    Optional<User> findById(String id);
    Optional<User> findByEmail(String email);
    Optional<User> findByUsername(String username);
}
