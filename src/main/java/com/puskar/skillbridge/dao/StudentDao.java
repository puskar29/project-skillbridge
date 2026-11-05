package com.puskar.skillbridge.dao;

import com.puskar.skillbridge.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface StudentDao extends JpaRepository<Student, Long> {
    Optional<Student> findByEmailIgnoreCase(String email);
}
