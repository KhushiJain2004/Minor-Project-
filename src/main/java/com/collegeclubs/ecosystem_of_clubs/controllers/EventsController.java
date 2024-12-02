package com.collegeclubs.ecosystem_of_clubs.controllers;

import com.collegeclubs.ecosystem_of_clubs.model.Events;
import com.collegeclubs.ecosystem_of_clubs.repositories.EventsRepository;
import com.collegeclubs.ecosystem_of_clubs.service.EventsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.Sort;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/events")
@Validated
public class EventsController {

    @Autowired
    private EventsService eventsService;
    @Autowired
    private EventsRepository eventsRepository;


    // Get all events with sorting functionality
    @GetMapping
    public ResponseEntity<List<Events>> getAllEvents(
            @RequestParam(name = "sortBy", defaultValue = "eventName") String sortBy,
            @RequestParam(name = "direction", defaultValue = "asc") String direction) {

        // Determine sorting direction
        Sort sort = direction.equalsIgnoreCase("desc") 
                    ? Sort.by(Sort.Order.desc(sortBy)) 
                    : Sort.by(Sort.Order.asc(sortBy));

        // Fetch sorted events
        return ResponseEntity.ok(eventsService.getAllEvents(sort));
    }

    // Get events by club
    @GetMapping("/club/{clubId}")
    public ResponseEntity<List<Events>> getEventsByClub(@PathVariable String clubId) {
        List<Events> events = eventsService.getEventsByClub(clubId);
        if (events.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(events);
    }

    // Get ongoing events
    @GetMapping("/ongoing")
    public ResponseEntity<List<Events>> getOngoingEvents() {
        return ResponseEntity.ok(eventsService.getOngoingEvents(LocalDateTime.now()));
    }

    // Get past events
    @GetMapping("/past")
    public ResponseEntity<List<Events>> getPastEvents() {
        return ResponseEntity.ok(eventsService.getPastEvents(LocalDateTime.now()));
    }

    // Get featured events
    @GetMapping("/featured")
    public ResponseEntity<List<Events>> getFeaturedEvents() {
        return ResponseEntity.ok(eventsService.getFeaturedEvents());
    }

    // Get event by ID
    @GetMapping("/{eventId}")
    public ResponseEntity<Events> getEventById(@PathVariable String eventId) {
        return eventsService.getEventById(eventId)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // Create or update an event
    @PostMapping
    public ResponseEntity<Events> createOrUpdateEvent(@Valid @RequestBody Events event) {
        Events savedEvent = eventsService.saveOrUpdateEvent(event);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedEvent);
    }

    // Delete an event by ID
    @DeleteMapping("/{eventId}")
    public ResponseEntity<Void> deleteEvent(@PathVariable String eventId) {
        if (eventsService.getEventById(eventId).isPresent()) {
            eventsService.deleteEventById(eventId);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }

    // Update an existing event
    @PutMapping("/{eventId}")
    public ResponseEntity<Events> updateEvent(
            @PathVariable String eventId,
            @Valid @RequestBody Events updatedEvent) {
        return eventsService.getEventById(eventId)
                .map(existingEvent -> {
                    updatedEvent.setId(eventId); // Ensure the ID is preserved
                    Events savedEvent = eventsService.saveOrUpdateEvent(updatedEvent);
                    return ResponseEntity.ok(savedEvent);
                })
                .orElse(ResponseEntity.notFound().build());
    }

    // Get events by tags
    @GetMapping("/filter-by-tags")
    public ResponseEntity<List<Events>> getEventsByTags(@RequestParam List<String> tags) {
        List<Events> events = eventsService.getEventsByTags(tags);
        if (events.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(events);
    }

    // Render events page with the list of events
    @GetMapping("/events")
    public String showEventsPage(Model model,
                                  @RequestParam(name = "sortBy", defaultValue = "startTime") String sortBy,
                                  @RequestParam(name = "direction", defaultValue = "asc") String direction) {
        // Fetch all events and apply sorting based on parameters
        Sort sort = direction.equalsIgnoreCase("asc") 
                    ? Sort.by(Sort.Order.asc(sortBy)) 
                    : Sort.by(Sort.Order.desc(sortBy));
        
        List<Events> eventsList = eventsService.getAllEvents(sort);
        model.addAttribute("events", eventsList);
        return "events"; // Maps to /WEB-INF/views/events.jsp
    }
    // Get all distinct tags
 @GetMapping("/tags")
public ResponseEntity<List<String>> getAllTags() {
    try {
        List<String> tags = eventsService.getAllTags();
        return ResponseEntity.ok(tags);
    } catch (Exception e) {
        e.printStackTrace();
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }
}


}
