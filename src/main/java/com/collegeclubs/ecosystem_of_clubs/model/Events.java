package com.collegeclubs.ecosystem_of_clubs.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.List;

@Document(collection = "Events")
public class Events {

    @Id
    private String id;

    @NotBlank(message = "Club ID cannot be null or blank")
    private String clubId;

    @NotBlank(message = "Event name cannot be null or blank")
    @Size(max = 100, message = "Event name should not exceed 100 characters")
    private String eventName;

    private String eventType;

    @Size(max = 200, message = "Event description should not exceed 200 characters")
    private String eventDescription;

    @NotNull(message = "Start time cannot be null")
    @Future(message = "Start time must be a future date")
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime startTime;

    @NotNull(message = "End time cannot be null")
    @Future(message = "End time must be a future date")
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime endTime;

    // New field for tags (interest tags for event recommendations)
    private List<String> tags;

    // New nested Contact class
    private Contact contact;

    // Default and parameterized constructors, getters, and setters remain the same

    public static class Contact {
        @NotBlank(message = "Contact name cannot be null or blank")
        private String name;

        @NotBlank(message = "Email cannot be null or blank")
        private String email;

        @NotBlank(message = "Phone number cannot be null or blank")
        private String phoneNumber;

        // Getters and Setters for Contact fields
        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getPhoneNumber() {
            return phoneNumber;
        }

        public void setPhoneNumber(String phoneNumber) {
            this.phoneNumber = phoneNumber;
        }
    }

    // Getters and Setters for Events fields

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClubId() {
        return clubId;
    }

    public void setClubId(String clubId) {
        this.clubId = clubId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getEventDescription() {
        return eventDescription;
    }

    public void setEventDescription(String eventDescription) {
        this.eventDescription = eventDescription;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }
}
