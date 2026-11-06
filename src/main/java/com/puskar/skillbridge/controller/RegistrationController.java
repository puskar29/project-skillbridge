package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.dao.RegistrationDao;
import com.puskar.skillbridge.dao.StudentDao;
import com.puskar.skillbridge.dao.WorkshopDao;
import com.puskar.skillbridge.model.Registration;
import com.puskar.skillbridge.model.Student;
import com.puskar.skillbridge.model.Workshop;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.stereotype.Controller;

import java.security.Principal;

@Controller
public class RegistrationController {
    private final RegistrationDao registrationDao;
    private final StudentDao studentDao;
    private final WorkshopDao workshopDao;

    public RegistrationController(
            RegistrationDao registrationDao,
            StudentDao studentDao,
            WorkshopDao workshopDao) {
        this.registrationDao = registrationDao;
        this.studentDao = studentDao;
        this.workshopDao = workshopDao;
    }

    @PostMapping("/student/workshops/{id}/register")
    public String register(
            @PathVariable Long id,
            Principal principal) {

        Student student = studentDao
                .findByEmailIgnoreCase(principal.getName())
                .orElseThrow();

        Workshop workshop = workshopDao
                .findById(id)
                .orElseThrow();

        if (!workshop.isActive()) {
            return "redirect:/opportunity?error=inactive";
        }

        if (registrationDao.existsByStudentAndWorkshop(student, workshop)) {
            return "redirect:/opportunity?error=already-registered";
        }

        Registration registration = new Registration();
        registration.setStudent(student);
        registration.setWorkshop(workshop);
        registrationDao.save(registration);

        return "redirect:/index?registered";
    }

}
