package com.collegeclubs.ecosystem_of_clubs.controllers;

import com.collegeclubs.ecosystem_of_clubs.model.Events;
import com.collegeclubs.ecosystem_of_clubs.service.EventsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/events")
public class EventsController {

    private static final Logger logger = LoggerFactory.getLogger(EventsController.class);

    @Autowired
    private EventsService eventsService;

    // Get all events
    @GetMapping
    public List<Events> getAllEvents() {
        logger.info("Fetching all events");
        List<Events> events = eventsService.getAllEvents();
        logger.info("Number of events retrieved: {}", events.size());
        return events;
    }

    // Get ongoing events
    @GetMapping("/ongoing")
    public List<Events> getOngoingEvents() {
        LocalDateTime currentTime = LocalDateTime.now();
        logger.info("Fetching ongoing events at time: {}", currentTime);
        
        // Pass currentTime to the service method
        List<Events> ongoingEvents = eventsService.getOngoingEvents(currentTime); 
        if (ongoingEvents.isEmpty()) {
            logger.warn("No ongoing events found at {}", currentTime);
        } else {
            logger.info("Number of ongoing events retrieved: {}", ongoingEvents.size());
        }
        return ongoingEvents;
    }

    // Get event by ID
    @GetMapping("/{eventId}")
    public Events getEventById(@PathVariable String eventId) {
        logger.info("Fetching event with ID: {}", eventId);
        return eventsService.getEventById(eventId);
    }

    // Create or update an event
    @PostMapping
    public Events createOrUpdateEvent(@RequestBody Events event) {
        logger.info("Creating or updating event: {}", event.getEventName());
        return eventsService.saveEvent(event);
    }

    // Delete an event by ID
    @DeleteMapping("/{eventId}")
    public void deleteEvent(@PathVariable String eventId) {
        logger.info("Deleting event with ID: {}", eventId);
        eventsService.deleteEventById(eventId);
    }
}
