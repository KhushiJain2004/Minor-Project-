package com.collegeclubs.ecosystem_of_clubs.model;

import java.util.Collection;
import java.util.Collections;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Document(collection="users")
public class User implements UserDetails {
    
    @Id
    private String id;
    private String username;

    @Indexed(unique=true)
    @NotNull(message="email cannot be null")
    @Email(message="invalid email format")
    private String email;

    @NotNull(message="password cannot be null")
    private String password;

    @NotNull(message="role cannot be null")
    private Role role;

    public User() {
    }


    public User(String email, String password, String username) {
        this.email = email;
        this.password = password;
        this.username = username;
    }
    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", role=" + role +
                '}';
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singleton(new SimpleGrantedAuthority(role.name()));
    }

    @Override
    public String getPassword() {
       return password;
    }

    @Override
    public String getUsername() {
       return username;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    public String getEmail() {
        return email;
    }

    public Role getRole() {
        return role;
    }

    public String getUserId()
    {
        return id;
    }

    public void setEmail(String email)
    {
        this.email=email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    
    // @Override
    // protected void finalize() throws Throwable {
    //     super.finalize();
    // }

    // @Override
    // public String toString() {
    //     return super.toString();
    // }

    // @Override
    // protected Object clone() throws CloneNotSupportedException {
    //     return super.clone();
    // }

    // @Override
    // public boolean equals(Object obj) {
    //     return super.equals(obj);
    // }

    // @Override
    // public int hashCode() {
    //     return super.hashCode();
    // }

    
}