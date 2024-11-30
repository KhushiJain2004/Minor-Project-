package com.collegeclubs.ecosystem_of_clubs.controllers;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.collegeclubs.ecosystem_of_clubs.model.Events;
import com.collegeclubs.ecosystem_of_clubs.service.EventsService;

@Controller
public class EventPageController {

    @Autowired
    private EventsService eventsService;

    @GetMapping("/events")
    public String showEventsPage(Model model) {
        // Fetch ongoing events
        List<Events> ongoingEvents = eventsService.getOngoingEvents(LocalDateTime.now());
        model.addAttribute("ongoingEvents", ongoingEvents);

        // Fetch upcoming events
        List<Events> upcomingEvents = eventsService.getUpcomingEvents(LocalDateTime.now());
        model.addAttribute("upcomingEvents", upcomingEvents);

        return "event"; // Name of your JSP file
    }
}