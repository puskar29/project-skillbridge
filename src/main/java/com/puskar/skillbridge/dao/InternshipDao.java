package com.puskar.skillbridge.dao;

import com.puskar.skillbridge.model.Internship;
import com.puskar.skillbridge.model.Organizer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface InternshipDao extends JpaRepository<Internship, Long> {
    List<Internship> findByOrganizer(Organizer organizer);

    List<Internship> findByActiveTrueOrderByCreatedAtDesc();
}
