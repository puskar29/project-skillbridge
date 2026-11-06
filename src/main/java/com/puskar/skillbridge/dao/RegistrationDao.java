package com.puskar.skillbridge.dao;

import com.puskar.skillbridge.model.Registration;
import com.puskar.skillbridge.model.Student;
import com.puskar.skillbridge.model.Workshop;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface RegistrationDao extends JpaRepository<Registration, Long> {

    boolean existsByStudentAndWorkshop(Student student, Workshop workshop);

    List<Registration> findByStudentOrderByRegisteredAtDesc(Student student);

    List<Registration> findByWorkshopOrganizerAccountIdOrderByRegisteredAtDesc(Long organizerId);

    Optional<Registration> findByIdAndWorkshopOrganizerAccountId(Long id, Long organizerId);
}