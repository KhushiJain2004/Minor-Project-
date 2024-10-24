package com.collegeclubs.ecosystem_of_clubs.service;

import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.collegeclubs.ecosystem_of_clubs.model.User;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;

@Service
public class JwtService {

    private String secretKey="";
 
   public JwtService()
   {
        try{
            KeyGenerator key= KeyGenerator.getInstance("HmacSHA256");
            SecretKey sk=key.generateKey();
            secretKey=Base64.getEncoder().encodeToString(sk.getEncoded());
        }
        catch(NoSuchAlgorithmException e)
        {
            throw new RuntimeException(e);
        }
   }


    public String generateToken(String userId)
    {
        Map<String,Object> claims = new HashMap<>();

        return  Jwts.builder()
                .claims()
                .add(claims)
                .subject(userId)
                .issuedAt(new Date(System.currentTimeMillis()))
                .expiration(new Date(System.currentTimeMillis()+1000*60*60*24*3  ))
                .and()
                .signWith(getKey())
                .compact();     //this generates token 
    }

    private SecretKey getKey() {
        byte[] keybytes=Decoders.BASE64.decode(secretKey);
        return Keys.hmacShaKeyFor(keybytes);
    }

    public String extractUserId(String token) {
        return extractClaims(token).getSubject();  // The subject is the user ID
    }

        // Extract claims from the token
    private Claims extractClaims(String token) {
        return Jwts.parser()
                .verifyWith(getKey())  // Use your key here
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }

    public boolean validateToken(String token, UserDetails userDetails) {
       final String userId=extractUserId(token);
       return (userId.equals(((User) userDetails).getUserId()) && !isTokenExpired(token));
    }

    private boolean isTokenExpired(String token) {
        return extractClaims(token).getExpiration().before(new Date());
    }



}
