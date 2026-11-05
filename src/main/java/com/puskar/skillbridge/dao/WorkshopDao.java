package com.puskar.skillbridge.dao;

import com.puskar.skillbridge.model.Organizer;
import com.puskar.skillbridge.model.Workshop;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WorkshopDao extends JpaRepository<Workshop, Long> {

    List<Workshop> findByOrganizerAccount(Organizer organizerAccount);

    List<Workshop> findByActiveTrueOrderByCreatedAtDesc();

}
