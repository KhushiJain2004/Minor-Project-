package com.collegeclubs.ecosystem_of_clubs.controllers;

import com.collegeclubs.ecosystem_of_clubs.model.Events;
import com.collegeclubs.ecosystem_of_clubs.service.EventsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/events")
public class EventsController {

    @Autowired
    private EventsService eventsService;

    // Get all events
    @GetMapping
    public List<Events> getAllEvents() {
        return eventsService.getAllEvents();
    }

    // Get ongoing events
    @GetMapping("/ongoing")
    public List<Events> getOngoingEvents() {
        return eventsService.getOngoingEvents();
    }

    // Get event by ID
    @GetMapping("/{eventId}")
    public Events getEventById(@PathVariable String eventId) {
        return eventsService.getEventById(eventId);
    }

    // Create or update an event
    @PostMapping
    public Events createOrUpdateEvent(@RequestBody Events event) {
        return eventsService.saveEvent(event);
    }

    // Delete an event by ID
    @DeleteMapping("/{eventId}")
    public void deleteEvent(@PathVariable String eventId) {
        eventsService.deleteEventById(eventId);
    }
}
