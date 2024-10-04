package com.collegeclubs.ecosystem_of_clubs.service;

import com.collegeclubs.ecosystem_of_clubs.model.Events;
import com.collegeclubs.ecosystem_of_clubs.repositories.EventsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class EventsService {

    @Autowired
    private EventsRepository eventsRepository;

    // Retrieve all events
    public List<Events> getAllEvents() {
        return eventsRepository.findAll();
    }

    // Retrieve ongoing events
    public List<Events> getOngoingEvents() {
        LocalDateTime now = LocalDateTime.now();
        return eventsRepository.findByStartTimeBeforeAndEndTimeAfter(now);
    }

    // Save a new event
    public Events saveEvent(Events event) {
        return eventsRepository.save(event);
    }

    // Get an event by ID
    public Events getEventById(String eventId) {
        return eventsRepository.findById(eventId).orElse(null);
    }

    // Delete an event by ID
    public void deleteEventById(String eventId) {
        eventsRepository.deleteById(eventId);
    }
}

