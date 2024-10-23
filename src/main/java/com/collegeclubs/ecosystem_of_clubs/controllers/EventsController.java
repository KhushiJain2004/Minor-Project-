package com.collegeclubs.ecosystem_of_clubs.controllers;

import com.collegeclubs.ecosystem_of_clubs.model.Events;
import com.collegeclubs.ecosystem_of_clubs.service.EventsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.validation.Valid;
import java.net.URI;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/events")
@Validated
public class EventsController {

    private static final Logger logger = LoggerFactory.getLogger(EventsController.class);

    @Autowired
    private EventsService eventsService;

    // Get all events
    @GetMapping
    public ResponseEntity<List<Events>> getAllEvents() {
        logger.info("Fetching all events");
        List<Events> events = eventsService.getAllEvents();
        logger.info("Number of events retrieved: {}", events.size());
        return ResponseEntity.ok(events);
    }

    // Get ongoing events
    @GetMapping("/ongoing")
    public ResponseEntity<List<Events>> getOngoingEvents() {
        LocalDateTime currentTime = LocalDateTime.now();
        logger.info("Fetching ongoing events at time: {}", currentTime);

        List<Events> ongoingEvents = eventsService.getOngoingEvents(currentTime);
        if (ongoingEvents.isEmpty()) {
            logger.warn("No ongoing events found at {}", currentTime);
            return ResponseEntity.noContent().build();
        }

        logger.info("Number of ongoing events retrieved: {}", ongoingEvents.size());
        return ResponseEntity.ok(ongoingEvents);
    }

    // Get event by ID
    @GetMapping("/{eventId}")
    public ResponseEntity<Events> getEventById(@PathVariable String eventId) {
        logger.info("Fetching event with ID: {}", eventId);
        Events event = eventsService.getEventById(eventId);

        if (event == null) {
            logger.error("Event with ID {} not found", eventId);
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(event);
    }

    // Create or update an event
    @PostMapping
    public ResponseEntity<Events> createOrUpdateEvent(@Valid @RequestBody Events event) {
        logger.info("Creating or updating event: {}", event.getEventName());

        // Validate date fields
        if (event.getStartTime() != null && event.getEndTime() != null && event.getStartTime().isAfter(event.getEndTime())) {
            logger.error("Start time must be before end time for event: {}", event.getEventName());
            return ResponseEntity.badRequest().body(null); // or handle it appropriately
        }

        try {
            Events savedEvent = eventsService.saveEvent(event);
            URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                    .path("/{id}")
                    .buildAndExpand(savedEvent.getId()) // Use getId() instead of getEventId()
                    .toUri();
            logger.info("Event created/updated successfully with ID: {}", savedEvent.getId()); // Use getId() instead of getEventId()
            return ResponseEntity.created(location).body(savedEvent);
        } catch (Exception e) {
            logger.error("Error occurred while creating or updating event: {}", e.getMessage(), e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    // Delete an event by ID
    @DeleteMapping("/{eventId}")
    public ResponseEntity<Void> deleteEvent(@PathVariable String eventId) {
        logger.info("Deleting event with ID: {}", eventId);
        Events event = eventsService.getEventById(eventId);

        if (event == null) {
            logger.error("Cannot delete. Event with ID {} not found", eventId);
            return ResponseEntity.notFound().build();
        }

        eventsService.deleteEventById(eventId);
        logger.info("Event with ID {} deleted successfully", eventId);
        return ResponseEntity.noContent().build();
    }
}
