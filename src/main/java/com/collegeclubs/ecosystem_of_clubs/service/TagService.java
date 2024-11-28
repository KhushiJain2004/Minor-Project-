package com.collegeclubs.ecosystem_of_clubs.service;

import com.collegeclubs.ecosystem_of_clubs.model.Tag;
import com.collegeclubs.ecosystem_of_clubs.repositories.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagService {

    @Autowired
    private TagRepository tagRepository;

    // Add a new tag
    public Tag addTag(Tag tag) {
        return tagRepository.save(tag);
    }

    // Get all tags
    public List<Tag> getAllTags() {
        return tagRepository.findAll();
    }
}
