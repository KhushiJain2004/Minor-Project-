package com.collegeclubs.ecosystem_of_clubs.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "Clubs")
public class Club {

    @Id
    private String clubId;
    private String clubName;
    private String slogan;
    private String logo;
    private String description;

    private String adminId;

    public Club() {
    }

    public Club(String clubId, String clubName, String slogan, String logo, String description, String adminId) {
        this.clubId = clubId;
        this.clubName = clubName;
        this.slogan = slogan;
        this.logo = logo;
        this.description = description;
        this.adminId = adminId;
    }

    // Getters and Setters

    public String getClubId() {
        return clubId;
    }

    public void setClubId(String clubId) {
        this.clubId = clubId;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getSlogan() {
        return slogan;
    }

    public void setSlogan(String slogan) {
        this.slogan = slogan;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }
   
}
