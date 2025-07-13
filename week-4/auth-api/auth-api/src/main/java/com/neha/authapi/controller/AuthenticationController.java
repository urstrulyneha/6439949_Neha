package com.neha.authapi.controller;

import java.util.Base64;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthenticationController {

    @GetMapping("/authenticate")
    public ResponseEntity<?> authenticate(@RequestHeader("Authorization") String authHeader) {
        // Decode Base64 credentials
        String base64Credentials = authHeader.substring("Basic ".length()).trim();
        byte[] decodedBytes = Base64.getDecoder().decode(base64Credentials);
        String decodedString = new String(decodedBytes);
        
        String[] values = decodedString.split(":", 2);
        String username = values[0];
        String password = values[1];

        // Simple hardcoded check (you can replace with DB/service check)
        if ("user".equals(username) && "pwd".equals(password)) {
            // Dummy JWT token (you can generate real one with JJWT later)
            String token = "eyJhbGciOiJIUzI1NiJ9."
                    + "eyJzdWIiOiJ1c2VyIiwiaWF0IjoxNjEyMzQ1Njc0LCJleHAiOjE2MTIzNDY4NzR9."
                    + "t3LRvlCV-hwKfoqZYlaVQqEUiBloWcWn0ft3tgv0dL0";

            return ResponseEntity.ok().body("{\"token\":\"" + token + "\"}");
        } else {
            return ResponseEntity.status(401).body("Invalid credentials");
        }
    }
}
