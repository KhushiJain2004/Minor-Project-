package com.collegeclubs.ecosystem_of_clubs.service;

import com.collegeclubs.ecosystem_of_clubs.model.Events;
import com.collegeclubs.ecosystem_of_clubs.model.TagAggregationResult;
import com.collegeclubs.ecosystem_of_clubs.repositories.EventsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class EventsService {

    @Autowired
    private EventsRepository eventsRepository;

    @Autowired
    private MongoTemplate mongoTemplate;  // Inject MongoTemplate

    public List<Events> getAllEvents() {
        return eventsRepository.findAll();
    }

    public List<Events> getEventsByClub(String clubId) {
        return eventsRepository.findByClubId(clubId);
    }

    public List<Events> getOngoingEvents(LocalDateTime currentTime) {
        return eventsRepository.findOngoingEvents(currentTime);
    }

    public List<Events> getPastEvents(LocalDateTime currentTime) {
        return eventsRepository.findPastEvents(currentTime);
    }

    public List<Events> getFeaturedEvents() {
        return eventsRepository.findFeaturedEvents();
    }

    public Optional<Events> getEventById(String eventId) {
        return eventsRepository.findById(eventId);
    }

    public Events saveOrUpdateEvent(Events event) {
        if (event.getStartTime().isAfter(event.getEndTime())) {
            throw new IllegalArgumentException("Start time must be before end time");
        }
        return eventsRepository.save(event);
    }

    public void deleteEventById(String eventId) {
        eventsRepository.deleteById(eventId);
    }

    public List<Events> getEventsByTags(List<String> tags) {
        return eventsRepository.findByTagsIn(tags);
    }

    public List<Events> getUpcomingEvents(LocalDateTime currentTime) {
        return eventsRepository.findByStartTimeAfter(currentTime);
    }

    // Fetch distinct tags from the events
    public List<String> getDistinctTags() {
        Aggregation aggregation = Aggregation.newAggregation(
                Aggregation.unwind("tags"), // Unwind the tags array
                Aggregation.group("tags"), // Group by tag
                Aggregation.sort(Sort.by(Sort.Order.asc("tags"))) // Sort alphabetically
        );
    
        AggregationResults<TagAggregationResult> result = mongoTemplate.aggregate(aggregation, Events.class, TagAggregationResult.class);
        
        return result.getMappedResults().stream()
                .map(TagAggregationResult::getTags)
                .collect(Collectors.toList());
    }
    
}
