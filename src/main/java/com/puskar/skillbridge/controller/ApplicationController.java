package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.dao.ApplicationDao;
import com.puskar.skillbridge.dao.InternshipDao;
import com.puskar.skillbridge.dao.StudentDao;
import com.puskar.skillbridge.model.Application;
import com.puskar.skillbridge.model.Internship;
import com.puskar.skillbridge.model.Student;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.stereotype.Controller;

import java.security.Principal;

@Controller
public class ApplicationController {
    private final ApplicationDao applicationDao;
    private final StudentDao studentDao;
    private final InternshipDao internshipDao;

    public ApplicationController(
            ApplicationDao applicationDao,
            StudentDao studentDao,
            InternshipDao internshipDao) {
        this.applicationDao = applicationDao;
        this.studentDao = studentDao;
        this.internshipDao = internshipDao;
    }

    @PostMapping("/student/internships/{id}/apply")
    public String apply(
            @PathVariable Long id,
            Principal principal) {

        Student student = studentDao
                .findByEmailIgnoreCase(principal.getName())
                .orElseThrow();

        Internship internship = internshipDao
                .findById(id)
                .orElseThrow();

        if (!internship.isActive()) {
            return "redirect:/opportunity?error=inactive";
        }

        if (applicationDao.existsByStudentAndInternship(student, internship)) {
            return "redirect:/opportunity?error=already-applied";
        }

        Application application = new Application();
        application.setStudent(student);
        application.setInternship(internship);
        applicationDao.save(application);

        return "redirect:/student/dashboard?applied";
    }
}
