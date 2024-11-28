package com.collegeclubs.ecosystem_of_clubs.controllers;

import com.collegeclubs.ecosystem_of_clubs.model.Tag;
import com.collegeclubs.ecosystem_of_clubs.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/tags")
public class TagController {

    @Autowired
    private TagService tagService;

    // Get all tags (to show in dropdown on event creation)
    @GetMapping
    public ResponseEntity<List<Tag>> getAllTags() {
        List<Tag> tags = tagService.getAllTags();
        return ResponseEntity.ok(tags);
    }

    // Add a new tag
    @PostMapping
    public ResponseEntity<Tag> addTag(@RequestBody Tag tag) {
        Tag savedTag = tagService.addTag(tag);
        return ResponseEntity.ok(savedTag);
    }
}
