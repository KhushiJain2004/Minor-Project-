package com.collegeclubs.ecosystem_of_clubs.service;

import com.collegeclubs.ecosystem_of_clubs.model.Events;
import com.collegeclubs.ecosystem_of_clubs.repositories.EventsRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class EventsService {

    private static final Logger logger = LoggerFactory.getLogger(EventsService.class);

    @Autowired
    private EventsRepository eventsRepository;

    // Get all events with pagination
    public Page<Events> getAllEvents(Pageable pageable) {
        logger.info("Fetching all events with pagination: page {}, size {}", pageable.getPageNumber(), pageable.getPageSize());
        Page<Events> eventsPage = eventsRepository.findAll(pageable);
        logger.info("Total events found: {}, total pages: {}", eventsPage.getTotalElements(), eventsPage.getTotalPages());
        return eventsPage;
    }

    // Get ongoing events based on the current time
    public List<Events> getOngoingEvents(LocalDateTime currentTime) {
        logger.info("Fetching ongoing events at time: {}", currentTime);
        List<Events> ongoingEvents = eventsRepository.findOngoingEvents(currentTime);
        if (ongoingEvents.isEmpty()) {
            logger.warn("No ongoing events found at {}", currentTime);
        } else {
            logger.info("Number of ongoing events found: {}", ongoingEvents.size());
        }
        return ongoingEvents;
    }

    // Get event by ID
    public Events getEventById(String eventId) {
        logger.info("Fetching event with ID: {}", eventId);
        Optional<Events> eventOpt = eventsRepository.findById(eventId);
        if (eventOpt.isPresent()) {
            logger.info("Event found: {}", eventOpt.get().getEventName());
            return eventOpt.get();
        } else {
            logger.error("Event with ID {} not found", eventId);
            return null;
        }
    }

    // Save or update an event
    public Events saveEvent(Events event) {
        logger.info("Saving event: {}", event.getEventName());

        // Validate start time and end time
        if (event.getStartTime() != null && event.getEndTime() != null && event.getStartTime().isAfter(event.getEndTime())) {
            logger.error("Start time must be before end time for event: {}", event.getEventName());
            throw new IllegalArgumentException("Start time must be before end time");
        }

        // Validate if contact information is provided
        if (event.getContact() != null) {
            logger.info("Contact information provided for event: {}", event.getEventName());
        } else {
            logger.warn("No contact information provided for event: {}", event.getEventName());
        }

        try {
            Events savedEvent = eventsRepository.save(event);
            logger.info("Event saved with ID: {}", savedEvent.getId());
            return savedEvent;
        } catch (Exception e) {
            logger.error("Error saving event: {}", e.getMessage(), e);
            throw e; // Rethrow or handle the exception as needed
        }
    }

    // Delete an event by ID
    public void deleteEventById(String eventId) {
        logger.info("Deleting event with ID: {}", eventId);
        Optional<Events> eventOpt = eventsRepository.findById(eventId);
        if (eventOpt.isPresent()) {
            eventsRepository.deleteById(eventId);
            logger.info("Event with ID {} deleted successfully", eventId);
        } else {
            logger.error("Cannot delete. Event with ID {} not found", eventId);
        }
    }
}
