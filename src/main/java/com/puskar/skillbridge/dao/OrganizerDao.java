package com.puskar.skillbridge.dao;

import com.puskar.skillbridge.model.Organizer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface OrganizerDao extends JpaRepository<Organizer, Long> {
    Optional<Organizer> findByEmailIgnoreCase(String email);
}
