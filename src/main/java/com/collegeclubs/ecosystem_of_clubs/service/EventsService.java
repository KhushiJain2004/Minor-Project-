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

    // Get all events
    public List<Events> getAllEvents() {
        return eventsRepository.findAll();
    }

    // Get ongoing events (pass current time to repository query)
    public List<Events> getOngoingEvents(LocalDateTime currentTime) {
        return eventsRepository.findOngoingEvents(currentTime);
    }

    // Get event by ID
    public Events getEventById(String eventId) {
        return eventsRepository.findById(eventId).orElse(null);
    }

    // Create or update event
    public Events saveEvent(Events event) {
        return eventsRepository.save(event);
    }

    // Delete event by ID
    public void deleteEventById(String eventId) {
        eventsRepository.deleteById(eventId);
    }
}
