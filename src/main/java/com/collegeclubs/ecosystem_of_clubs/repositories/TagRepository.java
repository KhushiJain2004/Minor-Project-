package com.collegeclubs.ecosystem_of_clubs.repositories;

import com.collegeclubs.ecosystem_of_clubs.model.Tag;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TagRepository extends MongoRepository<Tag, String> {
}
