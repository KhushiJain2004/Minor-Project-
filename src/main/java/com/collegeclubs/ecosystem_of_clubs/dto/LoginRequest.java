package com.collegeclubs.ecosystem_of_clubs.dto;

import javax.validation.constraints.NotNull;

import com.collegeclubs.ecosystem_of_clubs.model.Role;

public class LoginRequest {

    // private String id;
    
    @NotNull(message="email cannot be null")
    private String email;
    
    @NotNull(message="password cannot be null")
    private String password;

    @NotNull(message="role cannot be null")
    private Role role;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    // public String getId() {
    //     return id;
    // }

    // public void setId(String id) {
    //     this.id = id;
    // }
}
