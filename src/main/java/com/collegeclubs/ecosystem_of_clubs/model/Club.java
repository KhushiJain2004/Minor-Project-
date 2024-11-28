package com.collegeclubs.ecosystem_of_clubs.model;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "Clubs")
public class Club {

    @Id
    private String clubId;

    //required fields during registration
    private String clubName;
    private String slogan;
    private String description;
    private List<ClubMember> positionHolders;
    
    @Indexed(unique=true)
    private String adminId;

    //optional fields
    private String logo;
    private List<Events> events;
    private String contactEmail;
    private String contactPhone;
    private Map<String,String> socialMediaLinks;
    private List<String> achievements;
    private String memberBenefits;
    private String memberFee;
    // private List<String> stepsToJoin;
    private List<String> popularEvents;
    
    //MetaData
    @CreatedDate
    private Date createdDate;

    @LastModifiedDate
    private Date lastUpdatedDate;


    public Club() {
    }

    public Club(String clubId, String clubName, String slogan, String description, String adminId) {
        this.clubId = clubId;
        this.clubName = clubName;
        this.slogan = slogan;
        this.description = description;
        this.adminId = adminId;
    }
    public Club(String clubId, String clubName, String slogan, String description, List<ClubMember> positionHolders, String adminId) {
        this.clubId = clubId;
        this.clubName = clubName;
        this.slogan = slogan;
        this.description = description;
        this.positionHolders = positionHolders;
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

    public List<ClubMember> getPositionHolders() {
        return positionHolders;
    }

    public void setPositionHolders(List<ClubMember> positionHolders) {
        this.positionHolders = positionHolders;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public List<Events> getEvents() {
        return events;
    }

    public void setEvents(List<Events> events) {
        this.events = events;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public Map<String, String> getSocialMediaLinks() {
        return socialMediaLinks;
    }

    public void setSocialMediaLinks(Map<String, String> socialMediaLinks) {
        this.socialMediaLinks = socialMediaLinks;
    }

    public List<String> getAchievements() {
        return achievements;
    }

    public void setAchievements(List<String> Achievements) {
        this.achievements = Achievements;
    }

    public String getMemberBenefits() {
        return memberBenefits;
    }

    public void setMemberBenefits(String memberBenefits) {
        this.memberBenefits = memberBenefits;
    }

    public String getMemberFee() {
        return memberFee;
    }

    public void setMemberFee(String memberFee) {
        this.memberFee = memberFee;
    }

    // public List<String> getStepsToJoin() {
    //     return stepsToJoin;
    // }

    // public void setStepsToJoin(List<String> stepsToJoin) {
    //     this.stepsToJoin = stepsToJoin;
    // }

    public List<String> getPopularEvents() {
        return popularEvents;
    }

    public void setPopularEvents(List<String> popularEvents) {
        this.popularEvents = popularEvents;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getLastUpdatedDate() {
        return lastUpdatedDate;
    }

    public void setLastUpdatedDate(Date lastUpdatedDate) {
        this.lastUpdatedDate = lastUpdatedDate;
    }

   
}
