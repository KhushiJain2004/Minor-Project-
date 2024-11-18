package com.collegeclubs.ecosystem_of_clubs.model;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="ClubMember")
public class ClubMember {
    private String name;
    private String designation;
    

    public ClubMember(String designation, String name) {
        this.designation = designation;
        this.name = name;
    }

    public ClubMember() {
    }


    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDesignation() {
        return designation;
    }
    public void setDesignation(String designation) {
        this.designation = designation;
    }
}
