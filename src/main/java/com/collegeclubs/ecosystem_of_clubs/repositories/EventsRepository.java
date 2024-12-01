package com.collegeclubs.ecosystem_of_clubs.repositories;

import com.collegeclubs.ecosystem_of_clubs.model.Events;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.data.domain.Sort;
import java.time.LocalDateTime;
import java.util.List;

public interface EventsRepository extends MongoRepository<Events, String> {

    // This method allows sorting by any field like startTime or eventName
    List<Events> findAll(Sort sort);

    // Existing methods
    @Query("{'startTime': {'$lte': ?0}, 'endTime': {'$gte': ?0}}")
    List<Events> findOngoingEvents(LocalDateTime currentTime);

    @Query("{'endTime': {'$lt': ?0}}")
    List<Events> findPastEvents(LocalDateTime currentTime);

    @Query("{'featured': true}")
    List<Events> findFeaturedEvents();

    List<Events> findByClubId(String clubId);

    @Query("{ 'tags': { $in: ?0 } }")
    List<Events> findByTagsIn(List<String> tags);

    List<Events> findByStartTimeAfter(LocalDateTime currentTime);

    @Query("SELECT DISTINCT e.tags FROM Events e")
    List<String> findDistinctTags();
}
