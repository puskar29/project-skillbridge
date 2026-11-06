package com.puskar.skillbridge.dao;

import com.puskar.skillbridge.model.Organizer;
import com.puskar.skillbridge.model.Workshop;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface WorkshopDao extends JpaRepository<Workshop, Long> {

    List<Workshop> findByOrganizerAccount(Organizer organizerAccount);

    List<Workshop> findByActiveTrueOrderByCreatedAtDesc();

    @Query("""
            SELECT w FROM Workshop w
            WHERE w.active = true
              AND (
                LOWER(w.title) LIKE LOWER(CONCAT('%', :keyword, '%'))
                OR LOWER(w.organizer) LIKE LOWER(CONCAT('%', :keyword, '%'))
                OR LOWER(w.location) LIKE LOWER(CONCAT('%', :keyword, '%'))
                OR LOWER(w.description) LIKE LOWER(CONCAT('%', :keyword, '%'))
                OR LOWER(w.category) LIKE LOWER(CONCAT('%', :keyword, '%'))
              )
            ORDER BY w.createdAt DESC
            """)
    List<Workshop> searchActive(@Param("keyword") String keyword);

}
