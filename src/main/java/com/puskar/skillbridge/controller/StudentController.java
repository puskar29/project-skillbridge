package com.puskar.skillbridge.controller;

import com.puskar.skillbridge.dao.StudentDao;
import com.puskar.skillbridge.model.Student;
import com.puskar.skillbridge.service.InternshipService;
import com.puskar.skillbridge.service.WorkshopService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
public class StudentController {

    private final StudentDao studentDao;
    private final InternshipService internshipService;
    private final WorkshopService workshopService;

    public StudentController(StudentDao studentDao, InternshipService internshipService, WorkshopService workshopService) {
        this.studentDao = studentDao;
        this.internshipService = internshipService;
        this.workshopService = workshopService;
    }

    @GetMapping({"/student/dashboard", "/student/profile", "/student/home"})
    public String StudentProfile(Model model, Principal principal){

        if (principal != null){
            Student student = studentDao.findByEmailIgnoreCase(principal.getName()).orElse(null);
            model.addAttribute("student", student);
        }

        model.addAttribute("internships", internshipService.getActiveInternships());
        model.addAttribute("workshops", workshopService.getActiveWorkshops());

        return "student/dashboard";
    }

    @PostMapping("/studnet/profile/update")
    public String updateProfile(@ModelAttribute Student studentForm, Principal principal){
        if (principal == null) return "redirect:/login";

        Student student = studentDao.findByEmailIgnoreCase(principal.getName()).orElseThrow();
        student.setFirstName(studentForm.getFirstName());
        student.setLastName(studentForm.getLastName());
        student.setPhone(studentForm.getPhone());
        student.setCollege(studentForm.getCollege());
        student.setMajor(studentForm.getMajor());
        student.setGraduationYear(studentForm.getGraduationYear());
        student.setStudyYear(studentForm.getStudyYear());
        student.setDateOfBirth(studentForm.getDateOfBirth());
        student.setGender(studentForm.getGender());

        studentDao.save(student);
        return "redirect:/student/dashboard?profile?updated";
    }
}

