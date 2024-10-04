package com.collegeclubs.ecosystem_of_clubs.repositories;

import com.collegeclubs.ecosystem_of_clubs.model.Events;
import org.springframework.data.mongodb.repository.MongoRepository;
import java.time.LocalDateTime;
import java.util.List;

public interface EventsRepository extends MongoRepository<Events, String> {
    List<Events> findByStartTimeBeforeAndEndTimeAfter(LocalDateTime currentTime);
    /*
      
     Fetch on the basis of Tag : Ongoing, Featured, Upcoming
    Auto update tag or Auto delete after END DATE
     
     */
}