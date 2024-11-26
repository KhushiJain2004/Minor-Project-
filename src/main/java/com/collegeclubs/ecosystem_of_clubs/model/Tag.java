package com.collegeclubs.ecosystem_of_clubs.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import javax.validation.constraints.NotBlank;

@Document(collection = "Tags")
public class Tag {

    @Id
    private String id;

    @NotBlank(message = "Tag name cannot be null or blank")
    private String name;

    // Getters and setters

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
