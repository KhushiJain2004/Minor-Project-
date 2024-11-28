package com.collegeclubs.ecosystem_of_clubs.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

@Document(collection = "Events")
public class Events {
    @Id
    private String id; // This will map to MongoDB's _id field

    @NotBlank(message = "Club ID cannot be blank")
    private String clubId;

    @NotBlank(message = "Event name cannot be blank")
    private String eventName;

    private String eventDescription;

    @NotNull(message = "Start time is required")
    private LocalDateTime startTime;

    @NotNull(message = "End time is required")
    private LocalDateTime endTime;

    private List<String> tags;

    private boolean featured; // Added the 'featured' field

    private Contact contact;

    public static class Contact {
        private String name;
        private String email;
        private String phone; // Updated to match MongoDB field name

        // Getters and Setters
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }

        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }

        public String getPhone() { return phone; } // Updated getter and setter
        public void setPhone(String phone) { this.phone = phone; }
    }

    // Getters and Setters for Events
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getClubId() { return clubId; }
    public void setClubId(String clubId) { this.clubId = clubId; }

    public String getEventName() { return eventName; }
    public void setEventName(String eventName) { this.eventName = eventName; }

    public String getEventDescription() { return eventDescription; }
    public void setEventDescription(String eventDescription) { this.eventDescription = eventDescription; }

    public LocalDateTime getStartTime() { return startTime; }
    public void setStartTime(LocalDateTime startTime) { this.startTime = startTime; }

    public LocalDateTime getEndTime() { return endTime; }
    public void setEndTime(LocalDateTime endTime) { this.endTime = endTime; }

    public List<String> getTags() { return tags; }
    public void setTags(List<String> tags) { this.tags = tags; }

    public boolean isFeatured() { return featured; }
    public void setFeatured(boolean featured) { this.featured = featured; }

    public Contact getContact() { return contact; }
    public void setContact(Contact contact) { this.contact = contact; }
}
