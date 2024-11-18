package com.collegeclubs.ecosystem_of_clubs.dto;

import java.util.List;

import javax.validation.constraints.NotNull;

import com.collegeclubs.ecosystem_of_clubs.model.Club;
import com.collegeclubs.ecosystem_of_clubs.model.ClubMember;
import com.collegeclubs.ecosystem_of_clubs.model.User;

public class RegistrationRequest {
    
    @NotNull(message="user must not be null")
    private User user;
    
    private Club club;

    private List<ClubMember> clubMembers;

    public RegistrationRequest(User user)
    {
        this.user=user;
    }
    public RegistrationRequest(User user, Club club,List<ClubMember> clubMembers)
    {
        this.user=user;
        this.club=club;
        this.clubMembers=clubMembers;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Club getClub() {
        return club;
    }

    public void setClub(Club club) {
        this.club = club;
    }

    public List<ClubMember> getClubMembers() {
        return clubMembers;
    }

    public void setClubMembers(List<ClubMember> clubMembers) {
        this.clubMembers = clubMembers;
    }
}
