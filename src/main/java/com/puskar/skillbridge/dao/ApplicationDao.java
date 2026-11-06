package com.puskar.skillbridge.dao;

import com.puskar.skillbridge.model.Application;
import com.puskar.skillbridge.model.Internship;
import com.puskar.skillbridge.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ApplicationDao extends JpaRepository<Application, Long> {

    boolean existsByStudentAndInternship(Student student, Internship internship);

    List<Application> findByStudentOrderByAppliedAtDesc(Student student);

    List<Application> findByInternshipOrganizerIdOrderByAppliedAtDesc(Long organizerId);

    Optional<Application> findByIdAndInternshipOrganizerId(Long id, Long organizerId);

}