package com.collegeclubs.ecosystem_of_clubs.repositories;

import com.collegeclubs.ecosystem_of_clubs.model.Events;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import java.time.LocalDateTime;
import java.util.List;

public interface EventsRepository extends MongoRepository<Events, String> {

    @Query("{'startTime': {'$lte': ?0}, 'endTime': {'$gte': ?0}}")
    List<Events> findOngoingEvents(LocalDateTime currentTime);
}
