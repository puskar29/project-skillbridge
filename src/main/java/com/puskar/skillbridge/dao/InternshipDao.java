package com.puskar.skillbridge.dao;

import com.puskar.skillbridge.model.Internship;
import com.puskar.skillbridge.model.Organizer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface InternshipDao extends JpaRepository<Internship, Long> {
    List<Internship> findByOrganizer(Organizer organizer);

    List<Internship> findByActiveTrueOrderByCreatedAtDesc();

    @Query("""
            SELECT i FROM Internship i
            WHERE i.active = true
              AND (
                LOWER(i.title) LIKE LOWER(CONCAT('%', :keyword, '%'))
                OR LOWER(i.company) LIKE LOWER(CONCAT('%', :keyword, '%'))
                OR LOWER(i.location) LIKE LOWER(CONCAT('%', :keyword, '%'))
                OR LOWER(i.description) LIKE LOWER(CONCAT('%', :keyword, '%'))
              )
            ORDER BY i.createdAt DESC
            """)
    List<Internship> searchActive(@Param("keyword") String keyword);

}
